    /**
     * Notes:
     * This is an example stride prefetcher/prediction table that handles constant strides.
     * Currently the RPT is indefinite in size.
     * A hash map <pc, index> would speed up the search for the element in the prediction table. Right the search is linear time.
     * Only memory read operations apply (?)
     * A possiblilty is to create multiple tables within this function 
    */

    #include <stdio.h>
    #include <stdlib.h>
    #include <stdint.h>
    #include <string.h>

    #define STRIDESIZE 1

    typedef struct{
        int pc;
        uintptr_t inst_address;
        uintptr_t old_address;
        int stride[STRIDESIZE];
        int stride_position;
        int state;
        int seq_state;
        int steady_count;
        int total_count;
    }  RPT_element;

    RPT_element* constant_table_pointer = NULL;    // Global pointer to the constant stride RPT
    RPT_element* alternating_table_pointer = NULL;    // Global pointer to the constant stride RPT

    int table_size = 0;     // Number of elements stored in the RPTs
    int total_steady_strides = 0;   // Total reads to memory from an instruction in a steady stride state
    int total_memory_reads = 0;     // Total reads to memory

    void handleMemAccesses(void* new_address, int index);
    void modifyConstantTable(void* new_address, int index);
    void modifyAlternatingTable(void* new_address, int index);
    void printStrideEnd(int index);
    void printSummary();

    void handleMemAccesses(void* new_address, int index){
        /**
         * This is the function that is called from the instrumented application code everytime a memory read instruction is executed.
         * 
         * Returns 0 for success else 1.
        */

    // handle the new memory instruction in each of the tables
    
	   
	   modifyConstantTable(new_address, index-1);

    //modifyAlternatingTable(new_address, index);

    }





    void modifyConstantTable(void* new_address, int index){
        /**
         * This function handles any modifications to the constant stride reference prediction table
        */
	printf("\n-----------------------------------------------------------\n");
        printf("index: %d, tablesize: %d\n", index, table_size);


        total_memory_reads+= 1;
        //int index = -1; // Index of the memory instruction if it exists in the table, else -1
        //for(int i = 0; i<table_size; i++){
        //    if (constant_table_pointer[i].pc == index){
        //        index = i;
        //        break;
        //    }
        //}

        // Check if the memory access instruction already exists in the RPT:
        if(index >= table_size){

	     RPT_element new_element;
     	     new_element.pc = index;
             new_element.old_address = (uintptr_t)new_address;
	     new_element.state = 3;  // Set state to INITIAL
             new_element.total_count = 0;
             new_element.steady_count = 0;
             new_element.stride_position = 0;


	    if(constant_table_pointer == NULL){
                    //printf("Size of an RPT_element: %ld\n", sizeof(RPT_element));
 		    constant_table_pointer = malloc(sizeof(RPT_element));
		    printf("new malloc\n");
		    table_size += 1;
	    }else{
            // If the memory instruction does not exist in the table yet, expand the size of the table to fit the new entry at the specified index
		
	    table_size += 1;    
	    printf("reallocating room for %d more structs, this will increase the size of the struct by: %ld \n", (index +1) - table_size, ((index+1) - table_size)*sizeof(RPT_element));
    	    printf("index: %d, table size: %d, address accessed: %p\n", index, table_size, new_address);


   	    RPT_element* constant_table_temp = realloc(constant_table_pointer , table_size*sizeof(RPT_element));

            if (constant_table_temp  == NULL){  // Increase size based on the new entry's index

                printf("Error increasing table size. Exiting...\n ");
                free(constant_table_pointer);
		free(constant_table_temp);
		exit(1);

            };

	    constant_table_pointer = constant_table_temp;

	    printf("reallocation successful!");
	    }

            //printf("new struct is here: %d\n", constant_table_pointer[index]);
            constant_table_pointer[index] = new_element;
	    //printf("new element has been added\n");

	    
        }else{    // If the memory instruction exists in the table, update it.

		//printf("index %d already exists in the table\n", index);
            RPT_element *element = &constant_table_pointer[index]; // pointer to the table entry
            printf("instruction's new address: %ld\ninstruction's old address: %ld\n",(uintptr_t)new_address, element->old_address);
            int diff = (int)((uintptr_t)new_address - element->old_address);
	    //printf("diff: %d\n", diff);
	    printf("[INDEX] %d [DIFF] %d [STEADY_COUNT] %d\n", index, diff, element->steady_count);
            element->total_count += 1;

            if (element->state == 0){    // If current state is NO-PREDICTION

                if(diff == element->stride[element->stride_position]){
                    element->state += 1;     // Update to TRANSIENT state
		    printf("instruction %d has changed state: NO-PREDICTION->TRANSIENT \n", element->pc);

                }
                else{
		    printf("instruction %d remains in this state: NO-PREDICTION\n", element->pc);
                    element->stride[element->stride_position] = diff;
                }
            }
            else if(element->state == 1){    // If current state is TRANSIENT

                if(diff == element->stride[element->stride_position]){
                    element->state += 1;     // Update to STEADY state
		    printf("instruction %d has changed state: TRANSIENT->STEADY \n", element->pc);

                }
                else{
                    element->state -= 1;     // Update to NO-PREDICTION state
		    printf("instruction %d has changed state: TRANSIENT->NO-PREDICTION \n", element->pc);
                    element->stride[element->stride_position] = diff;
                }
            }
            else if(element->state == 2){    // If current state is STEADY
		
                total_steady_strides += 1;
                if(diff == element->stride[element->stride_position]){
                    element->steady_count += 1;
		    printf("instruction %d remains in this state: STEADY\n", element->pc);
                }
                else{
                    element->state += 1;     // Update to INITIAL state
                    element->steady_count = 0; 
                    printStrideEnd(index);
                    memset(element->stride, 0, STRIDESIZE*sizeof(int)); // Reset the stride pattern 
		    printf("instruction %d has changed state: STEADY->INITIAL \n", element->pc);

                }
            }
            else if(element->state == 3){    // If current state is INITIAL
                element->stride[element->stride_position] = diff;

                if(element->stride_position % STRIDESIZE == STRIDESIZE -1){  // Check if the stride array contains a potential pattern.
                    element->state -= 2;     // Update to TRANSIENT state
		    printf("instruction %d has changed state: INITIAL->TRANSIENT \n", element->pc);

                }
            }

            element->old_address = (uintptr_t)new_address;

        }

    }





    void modifyAlternatingTable(void* new_address, int index){
        /**
         * This function handles any modifications to the alternating stride reference prediction table
        */
        printf("here");

    }


    void printStrideEnd(int index){
        /**
         * This function prints information about a stride pattern that has just ended (state change from STREADY to INITIAL)
        */

    RPT_element element = constant_table_pointer[index];
    printf("| Inst. Address | Total steady calls | Total calls | Stride |\n");
    printf("-------------------------------------------------------------\n");
    printf("|%x|%d|%d|%d|\n", element.pc, element.steady_count, element.total_count, element.stride[element.stride_position]);

    }





    void printSummary(){
        /**
         * This function prints summary information about how many steady state memory accesses were done throughout the execution of the instrumented application
        */
        
        printf("Constant Stride Prefetching Stats\n");
        printf("------------------------------------------------\n");
        printf("| Total steady calls | Total calls | %% Steady |\n");
        printf("------------------------------------------------\n");
        printf("|%d|%d|%d|\n", total_steady_strides, total_memory_reads, (total_steady_strides/total_memory_reads)*100);
        
    }

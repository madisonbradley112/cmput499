//
// Created by vboxuser on 12/13/24.
//

/*
 * Copyright (c) 2019, 2020 Inria
 * All rights reserved.
 *
 * The license below extends only to copyright in the software and shall
 * not be construed as granting a license to any other intellectual
 * property including but not limited to intellectual property relating
 * to a hardware implementation of the functionality of the software
 * licensed hereunder.  You may use the software subject to the license
 * terms below provided that you ensure that this notice is replicated
 * unmodified and in its entirety in all distributions of the software,
 * modified or unmodified, in source code or in binary form.
 *
 * Copyright (c) 2005-2006 The Regents of The University of Michigan
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met: redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer;
 * redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution;
 * neither the name of the copyright holders nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#pragma once

#include <cassert>
#include <cstdint>

#include "base/logging.hh"
#include "base/types.hh"

namespace gem5
{

/**
 * Implements an n bit saturating counter and provides methods to
 * increment, decrement, and read it.
 *
 * @tparam T The type of the underlying counter container.
 */
template <class T>
class NegativeSatCounter
{
  public:
    T maxVal;
    T minVal;
    /** The default constructor should never be used. */
    NegativeSatCounter() = delete;

    /**
     * Constructor for the counter. The explicit keyword is used to make
     * sure the user does not assign a number to the counter thinking it
     * will be used as a counter value when it is in fact used as the number
     * of bits.
     *
     * @param bits How many bits the counter will have.
     * @param initial_val Starting value for the counter.
     *
     * @ingroup api_sat_counter
     */
    explicit NegativeSatCounter(unsigned bits, T initial_val = 0)
        : initialVal(initial_val), maxVal((1ULL << (bits-1)) - 1),
          minVal(-(1ULL << (bits-1))),
          counter(initial_val)
    {

        fatal_if(bits > 8*sizeof(T),
                 "Number of bits exceeds counter size");
        fatal_if(initial_val > maxVal,
                 "Saturating counter's initial value exceeds max value.");
    }

    /**
     * Copy constructor.
     *
     * @ingroup api_sat_counter
     */
    NegativeSatCounter(const NegativeSatCounter& other)
        : initialVal(other.initialVal), maxVal(other.maxVal),
          counter(other.counter)
    {
    }

    /**
     * Copy assignment.
     *
     * @ingroup api_sat_counter
     */
    NegativeSatCounter& operator=(const NegativeSatCounter& other) {
        if (this != &other) {
            NegativeSatCounter temp(other);
            this->swap(temp);
        }
        return *this;
    }

    /**
     * Move constructor.
     *
     * @ingroup api_sat_counter
     */
    NegativeSatCounter(NegativeSatCounter&& other)
    {
        initialVal = other.initialVal;
        maxVal = other.maxVal;
        counter = other.counter;
        NegativeSatCounter temp(0);
        other.swap(temp);
    }

    /**
     * Move assignment.
     *
     * @ingroup api_sat_counter
     */
    NegativeSatCounter& operator=(NegativeSatCounter&& other) {
        if (this != &other) {
            initialVal = other.initialVal;
            maxVal = other.maxVal;
            counter = other.counter;
            NegativeSatCounter temp(0);
            other.swap(temp);
        }
        return *this;
    }

    /**
     * Swap the contents of every member of the class. Used for the default
     * copy-assignment created by the compiler.
     *
     * @param other The other object to swap contents with.
     *
     * @ingroup api_sat_counter
     */
    void
    swap(NegativeSatCounter& other)
    {
        std::swap(initialVal, other.initialVal);
        std::swap(maxVal, other.maxVal);
        std::swap(counter, other.counter);
    }

    /**
     * Add-assignment.
     *
     * @ingroup api_sat_counter
     */
    NegativeSatCounter&
    operator+=(const long long& value)
    {
        if (value >= 0) {
            if (maxVal - this->counter >= value) {
                this->counter += value;
            } else {
                this->counter = maxVal;
            }
        } else {

          if (this->counter + value >= minVal){
            this->counter += value;
            } else {
              this->counter= minVal;
            }
        }
        return *this;
    }

    /**
     * Subtract-assignment.
     *
     * @ingroup api_sat_counter
     */
    NegativeSatCounter&
    operator-=(const long long& value)
    {
        if (value >= 0) {
            if (this->counter > this->minVal +value) {
                this->counter -= value;
            } else {
                this->counter = this->minVal;
            }
        } else {

          if (this->counter < this->maxVal +value) {
            this->counter -= value;
          }else{
            this->counter = this->maxVal;
            }

        }
        return *this;
    }

    /**
     * Read the counter's value.
     *
     * @ingroup api_sat_counter
     */
    operator T() const {

      return counter; }

    /**
     * Reset the counter to its initial value.
     *
     * @ingroup api_sat_counter
     */
    void reset() { counter = initialVal; }

    /**
     * Calculate saturation percentile of the current counter's value
     * with regard to its maximum possible value.
     *
     * @return A value between 0.0 and 1.0 to indicate which percentile of
     *         the maximum value the current value is.
     *
     * @ingroup api_sat_counter
     */
    double calcSaturation() const { return (double) counter / maxVal; }

    /**
     * Whether the counter has achieved its maximum value or not.
     *
     * @return True if the counter saturated.
     *
     * @ingroup api_sat_counter
     */
    bool isSaturated() const { return (counter == maxVal || counter == minVal); }

    /**
     * Saturate the counter.
     *
     * @return The value added to the counter to reach saturation.
     *
     * @ingroup api_sat_counter
     */
    T saturate()
    {
        const T diff = maxVal - counter;
        counter = maxVal;
        return diff;
    }

  private:
    T initialVal;
    T counter;
};

/** @ingroup api_sat_counter
 *  @{
 */
typedef NegativeSatCounter<int8_t> NSatCounter8;

/** @} */

} // namespace gem5



from m5.objects import Process

base_dir = "../../../../cpu2017/"
binary_dir = base_dir+"binaries/"
data_dir = base_dir+"data/"

#502.gcc_r
gcc_1 = Process()
gcc_1.executable =  binary_dir+'cpugcc_r'
data=data_dir+'gcc/input/gcc-pp.c'
gcc_1.cmd = [gcc_1.executable] + [data, "-O3 -finline-limit=0 -fif-conversion -fif-conversion2"]

gcc_2 = Process()
gcc_2.executable =  binary_dir+'cpugcc_r'
data=data_dir+'gcc/input/gcc-pp.c'
gcc_2.cmd = [gcc_2.executable] + [data, "-O2 -finline-limit=36000 -fpic"]

gcc_3 = Process()
gcc_3.executable =  binary_dir+'cpugcc_r'
data=data_dir+'gcc/input/gcc-smaller.c'
gcc_3.cmd = [gcc_3.executable] + [data, "-O3 -fipa-pta"]

gcc_4 = Process()
gcc_4.executable =  binary_dir+'cpugcc_r'
data=data_dir+'gcc/input/ref32.c'
gcc_4.cmd = [gcc_4.executable] + [data, "-O5"]

gcc_5 = Process()
gcc_5.executable =  binary_dir+'cpugcc_r'
data=data_dir+'gcc/input/ref32.c'
gcc_5.cmd = [gcc_5.executable] + [data, "-O3 -fselective-scheduling -fselective-scheduling2"]

#505.mcf_r
mcf = Process()
mcf.executable =  binary_dir+'mcf_r'
data=data_dir+'mcf/input/inp.in'
mcf.cmd = [mcf.executable] + [data]

#520.omnetpp_r
omnetpp = Process()
omnetpp.executable =  binary_dir+'omnetpp_r'
data=data_dir+'omnetpp/input/omnetpp.ini'
omnetpp.cmd = [omnetpp.executable] + ["-c General -r 0"]

#523.xalancbmk_r
xalancbmk = Process()
xalancbmk.executable =  binary_dir+'cpuxalan_r'
data=data_dir+'xalancbmk/input/'
xalancbmk.cmd = [xalancbmk.executable] + ['-v',data+'t5.xml',data+'xalanc.xsl']

#525.x264_r
x264_1 = Process()
x264_1.executable =  binary_dir+'x264_r'
data=data_dir+'x264/input/BuckBunny.264'
x264_1.cmd = [x264_1.executable] + ["--pass 1 --stats x264_stats.log --bitrate 1000 --frames 1000 -o BuckBunny_New.264 ", data,  " 1280x720"]

x264_2 = Process()
x264_2.executable =  binary_dir+'x264_r'
data=data_dir+'x264/input/BuckBunny.264'
x264_2.cmd = [x264_2.executable] + ["./x264 --pass 2 --stats x264_stats.log --bitrate 1000 --dumpyuv 200 --frames 1000 -o BuckBunny_New.264" , data, "  1280x720"]

x264_3 = Process()
x264_3.executable =  binary_dir+'x264_r'
data=data_dir+'x264/input/BuckBunny.264'
x264_3.cmd = [x264_3.executable] + ["--seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 " , data, " 1280 x720"]

#531.deepsjeng_r
deepsjeng = Process()
deepsjeng.executable =  binary_dir+'deepsjeng_r'
data=data_dir+'deepsjeng/input/ref.txt'
deepsjeng.cmd = [deepsjeng.executable] + [data]

#541.leela_r
leela = Process()
leela.executable =  binary_dir+'leela_r'
data=data_dir+'leela/input/ref.sgf'
leela.cmd = [leela.executable] + [data]

#548.exchange2_r
exchange2 = Process()
exchange2.executable =  binary_dir+'exchange2_r'
data="6"
exchange2.cmd = [exchange2.executable] + [data]

#557.xz_r
xz_1 = Process()
xz_1.executable =  binary_dir+'xz_r'
data=data_dir+'xz/input/cld.tar.xz'
xz_1.cmd = [xz_1.executable] + [data, "160 19cf30ae51eddcbefda78dd06014b4b96281456e078ca7c13e1c0c9e6aaea8dff3efb4ad6b0456697718cede6bd5454852652806a657bb56e07d61128434b474 59796407 61004416 6"]

xz_2 = Process()
xz_2.executable =  binary_dir+'xz_r'
data=data_dir+'xz/input/cpu2006docs.tar.xz'
xz_2.cmd = [xz_2.executable] + [data, "250 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 23047774 23513385 6e"]

xz_3 = Process()
xz_3.executable =  binary_dir+'xz_r'
data=data_dir+'xz/input/input.combined.xz'
xz_3.cmd = [xz_3.executable] + [data, "250 a841f68f38572a49d86226b7ff5baeb31bd19dc637a922a972b2e6d1257a890f6a544ecab967c313e370478c74f760eb229d4eef8a8d2836d233d3e9dd1430bf 40401484 41217675 7"]

def get_spec(bench: str):  # TODO add support for more of the benchmarks
    if bench == 'gcc_1':
        return gcc_1
    elif bench == 'gcc_2':
        return gcc_2
    elif bench == 'gcc_3':
        return gcc_3
    elif bench == 'gcc_4':
        return gcc_4
    elif bench == 'gcc_5':
        return gcc_5
    elif bench == 'mcf':
        return mcf
    elif bench == 'omnetpp':
        return omnetpp
    elif bench == 'xalancbmk':
        return xalancbmk
    elif bench == 'x264_1':
        return x264_1
    elif bench == 'x264_2':
        return x264_2
    elif bench == 'x264_3':
        return x264_3
    elif bench == 'deepsjeng':
        return deepsjeng
    elif bench == 'leela':  
        return leela
    elif bench == 'exchange2':
        return exchange2
    elif bench == 'xz_1':
        return xz_1
    elif bench == 'xz_2':
        return xz_2
    elif bench == 'xz_3':
        return xz_3
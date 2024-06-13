import sys
import subprocess

procs=[]

for i in range(4):
    proc = subprocess.Popen([sys.executable, 'client'+str(i)+'.py','debug'])
    procs.append(proc)

for proc in procs:
    proc.wait()

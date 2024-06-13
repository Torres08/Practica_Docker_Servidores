import sys
import subprocess

procs = []

for i in range(4):
    proc = subprocess.Popen([sys.executable, f'bots/bot{i}.py', 'debug'])
    procs.append(proc)
    
    print(f'Se ha creado el bot {i}.')

for proc in procs:
    proc.wait()
        

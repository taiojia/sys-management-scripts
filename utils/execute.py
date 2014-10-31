__author__ = 'jiasir (Taio Jia) <jiasir@icloud.com>'


import subprocess


class Execute():
    def run_getoutput(self, *_command_line):
        _lst = map(str, _command_line)
        subprocess.call(_lst, shell=True)




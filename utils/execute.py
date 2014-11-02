__author__ = 'jiasir (Taio Jia) <jiasir@icloud.com>'


import subprocess
import os


class Execute():
    def run_getoutput(self, *_command_line):
        _lst = map(str, _command_line)
        subprocess.call(_lst, shell=True)



    def output_to_variable(self, *_command_line):
    	_str = str(str, _command_line)
    	return os.popen(_str).readlines()

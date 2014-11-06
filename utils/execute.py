__author__ = 'jiasir (Taio Jia) <jiasir@icloud.com>'


import subprocess
import commands
import os


class Execute():
    def run_getoutput(self, *_command_line):
        """
        Execute command and get output to stdout. *_command_line is a  comma separated string.
        :param _command_line:
        :return:
        """
        _lst = map(str, _command_line)
        subprocess.call(_lst, shell=True)


    def output_to_variable(self, _command_line):
        """
        Execute command and return a string object. _command_line is a string no comma separated.
        :param _command_line: string
        :return: string object
        """
        _str = _command_line
        return os.popen(_str).readlines()


    def get_output(self, _command_line):
        """
        Execute command with commands.getoutput. _command_line is a string no comma separated.
        :param _command_line:
        :return:
        """
        _str = _command_line
        return commands.getoutput(_str)

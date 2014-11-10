#!/usr/bin/env python
__author__ = 'Taio'

import commands
import sys



arg = sys.argv[1]


def est(port):
    return commands.getoutput('sudo netstat -tunpa | grep :{num} | grep EST | grep -v grep | wc -l'.format(num=port))


def time_out(port):
    return commands.getoutput('sudo netstat -tunpa | grep :{num} | grep TIME_WAIT | grep -v grep | wc -l'.format(num=port))


if __name__ == '__main__' and not len(arg) == 2:
    if arg == 'EST_80':
        print est('80')
    if arg == 'EST_8080':
        print est('8080')
    if arg == 'TIME_OUT_80':
        print time_out('80')
    if arg == 'TIME_OUT_8080':
        print time_out('8080')
    if arg == 'EST_3306':
        print est('3306')
    if arg == 'TIME_OUT_3306':
        print time_out('3306')
    if arg == 'EST_11211':
        print est('11211')
    if arg == 'TIME_OUT_11211':
        print time_out('11211')
    if arg == 'EST_6379':
        print est('6379')
    if arg == 'TIME_OUT_6379':
        print time_out('6379')
else:
    print 'Please input one arguement.'
    print 'Usage: get-conns.py (EST_80|TIME_OUT_80|EST_3306|TIME_OUT_3306|EST_11211|TIME_OUT_11211|EST_6379|TIME_OUT_6379)'



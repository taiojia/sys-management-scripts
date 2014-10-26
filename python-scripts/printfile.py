#!/usr/bin/env python
__author__ = 'Taio'

import sys

fname = sys.argv[1]


def print_file1(fname):
    f = open(fname, 'r')
    for line in f:
        print(line)
    f.close()


def print_file2(fname):
    f = open(fname, 'r')
    print(f.read())
    f.close()


def print_file3(fname):
    """
    print file contents
    :rtype : file_name
    :return : string
    """
    print(open(fname, 'r').read())


if __name__ == '__main__':
    print_file3(fname)


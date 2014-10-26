#/usr/bin/env python
__author__ = 'Taio'

import os
import sys

fname = sys.argv[0]


def list_cwd():
    return os.listdir(os.getcwd())


def files_cwd():
    return [p for p in list_cwd() if os.path.isfile(p)]


def folders_cwc():
    return [p for p in list_cwd() if os.path.isdir(p)]


def list_py(path = None):
    if path == None:
        path = os.getcwd()
    return [fname for fname in os.listdir(path) if os.path.isfile(fname) if fname.endwith('.py')]


def size_in_bytes(fname):
    return os.stat(fname).st_size


def cwd_size_in_bytes():
    total = 0
    for name in files_cwd():
        total = total + size_in_bytes(name)
    return total


def cwd_size_in_bytes2():
    return sum(cwd_size_in_bytes(f) for f in files_cwd())

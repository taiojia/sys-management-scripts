#/usr/bin/env python
__author__ = 'Taio'

import sys
import os


def make_story1(fname):
    """
    Write contents to file.
    :rtype : str
    """
    f = open(fname, 'w')
    f.write('Mary had a little lamb,\n')
    f.write('and then she had some more.\n')
    f.close()


def add_to_story(line, fname):
    f = open(fname, 'a')
    f.write(line)
    f.close()


def insert_title(title, fname):
    f = open(fname, 'r+')
    temp = f.read()
    temp = title + '\n\n' + temp
    f.seek(0)
    f.write(temp)
    f.close()

def is_gif(fname):
    f = open(fname, 'br')
    first4 = tunple(f.read(4))
    return first4 == (0x47, 0x49, 0x46, 0x38)

if __name__ == '__main__':
    if len(os.sys.argv) > 1:
        fname = sys.argv[1]
    else:
        fname = 'tmp'

    if os.path.isfile(fname):
        print('{fname} already exists'.format(fname=fname))
    else:
        make_story1(fname)
        add_to_story('fuck\n', fname)




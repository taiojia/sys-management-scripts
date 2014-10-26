#/usr/bin/env python
__author__ = 'Taio'

import sys, os

def make_story1(fname):
    """

    :rtype : str
    """
    f = open(fname, 'w')
    f.write('Mary had a little lamb,\n')
    f.write('and then she had some more.\n')

if __name__ == '__main__':
    if len(os.sys.argv) > 1:
        fname = sys.argv[1]
    else:
        fname = 'tmp'

    if os.path.isfile(fname):
        print('{fname} already exists'.format(fname=fname))
    else:
        make_story1(fname)




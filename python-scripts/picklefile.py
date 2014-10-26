#!/usr/bin/env python
__author__ = 'Taio'

import pickle


def make_pickled_file():
    grades = {
        'alan': [4, 8, 10, 10],
        'tom': [7, 7, 7, 7],
        'may': [10, 8, 10, 10]
    }
    outfile = open('grades.dat', 'wb')
    pickle.dump(grades, outfile)


def get_pickled_data():
    infile = open('grades.dat', 'rb')
    grades = pickle.load(infile)
    return grades


if __name__ == '__main__':
    make_pickled_file()
    print get_pickled_data()

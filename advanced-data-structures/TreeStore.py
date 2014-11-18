#!/usr/bin/env python
__author__ = 'Taio'


class TreeStore():
    def __init__(self, value, children=[]):
        self.value = value
        self.children = children


    def __repr__(self, level=0):
        ret = "\t"*level+repr(self.value)+"\n"
        for child in self.children:
            ret += child.__repr__(level+1)
        return ret



# A Python Class to Store Trees
tree = TreeStore('grandmother', [
    TreeStore('daughter',[
        TreeStore('granddaughter'),
        TreeStore('grandson')
    ]),
    TreeStore('son', [
        TreeStore('granddaughter'),
        TreeStore('grandson')
    ])
])


print tree


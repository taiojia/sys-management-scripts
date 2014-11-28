#!/usr/bin/env python
# -*- coding: utf-8 -*-

__author__ = 'jiasir'


def print_node(node, level):
    print '\t |_'*level, node['id']


def browsing_tree(node, action, level=None):
    if level is None:
        level = 0

    action(node, level)
    if 'children' in node:
        children = node['children']
        for child in children:
            browsing_tree(child, action, level + 1)

dict_list = [
    { "id": 4, "pid": "b", "name": "004", "info": "描述004" },
    { "id": "a", "pid": None, "name": "001", "info": "描述001" },
    { "id": 2, "pid": "a", "name": "002", "info": "描述002" },
    { "id": 6, "pid": "b", "name": "006", "info": "描述006" },
    { "id": "b", "pid": "a", "name": "003", "info": "描述003" },
    { "id": 5, "pid": 4, "name": "005", "info": "描述005" },
    { "id": 7, "pid": "a", "name": "007", "info": "描述007" }
]

dict_items = {}
root = None

for obj in dict_list:
    if obj['pid'] is None:
        root = obj
    dict_items[obj['id']] = obj

for obj in dict_list:
    if obj['pid'] is not None:
        if 'children' not in dict_items[obj['pid']]:
            dict_items[obj['pid']]['children'] = []

        dict_items[obj['pid']]['children'].append(obj)


browsing_tree(root, print_node)
#!/usr/bin/env python
__author__ = 'Taio'

import urllib.request
import webbrowser


def open_web():
    webbrowser.open('http://www.python.org')

page = urllib.request.urlopen('http://www.python.org')
html = resp.read()
print html[: 25]
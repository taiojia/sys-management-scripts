#!/usr/bin/env python
__author__ = 'jiasir'


import sys
import logging
import urllib2
import time

url = sys.argv[1]

logger = logging.getLogger('url-mon')
logging.basicConfig(filename='url-mon.log', level=logging.DEBUG, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')

def get_site_status(url):
    try:
        urlfile = urllib2.urlopen(url, timeout=3)
        status_code = urlfile.code
        logger.info('{code} {link}'.format(code=status_code, link=url))
        if status_code in (200, 302):
            return 'up', urlfile
    except Exception as e:
        logger.error(e)
    return 'down', None


if __name__ == '__main__':
    i = 0
    while i < 24:
        i += 1
        print i
        get_site_status(url)
        time.sleep(20)

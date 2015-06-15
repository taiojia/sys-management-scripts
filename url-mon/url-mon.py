#!/usr/bin/env python
__author__ = 'jiasir'


import sys
import logging
import urllib2

url = sys.argv[1]

logger = logging.getLogger('url-mon')
logging.basicConfig(filename='url-mon.log', level=logging.DEBUG, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')

def get_site_status(url):
    try:
        urlfile = urllib2.urlopen(url)
        status_code = urlfile.code
        logger.info(status_code)
        if status_code in (200, 302):
            return 'up', urlfile
    except:
        pass
    return 'down', None


if __name__ == '__main__':
    get_site_status(url)
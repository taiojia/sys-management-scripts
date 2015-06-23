#!/usr/bin/env python
__author__ = 'jiasir'

"""Usage:
    python url-mon.py url phone[ phone...]
"""

import sys
import logging
import urllib2
import time
import socket

url = sys.argv[1]
p = sys.argv[2:]

logger = logging.getLogger('url-mon')
logging.basicConfig(filename='url-mon.log', level=logging.DEBUG, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')

hostname = socket.gethostname()

def notify_msg(phone, msg):
    return urllib2.urlopen('http://10.10.11.241/sms.php?phone={}&content={}'.format(phone, msg), timeout=3)


def get_site_status(url):
    try:
        urlfile = urllib2.urlopen(url, timeout=3)
        status_code = urlfile.code
        logger.info('{code} {link}'.format(code=status_code, link=url))
        if status_code in (200, 302):
            return 'up', urlfile
    except Exception as e:
        logger.error(e)
        [notify_msg(i, '{}%20cant%20access%20{}'.format(hostname, url[7:])) for i in p]

    return 'down', None


if __name__ == '__main__':
    i = 0
    while i < 24:
        i += 1
        print i
        get_site_status(url)
        time.sleep(20)

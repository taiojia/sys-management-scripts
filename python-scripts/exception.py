__author__ = 'Taio'


def get_age():
    while True:
        try:
            n = int(input('How old are you?'))
            return n
        except ValueError:
            print 'Please enter an integer value.'

def convert_to_int1(s, base):
    try:
        return int(s, base)
    except (ValueError, TypeError):
        return 'error'


def convert_to_int2(s, base):
    try:
        return int(s, base)
    except ValueError:
        return 'value error'
    except TypeError:
        return 'type error'


def convert_to_int3(s, base):
    try:
        return int(s, base)
    except:
        return 'error'

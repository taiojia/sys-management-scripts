__author__ = 'Taio'


keep = {'a', 'b', 'c', 'd', 'e', 'f', 'g',
        'h', 'i', 'j', 'k', 'l', 'm', 'n',
        'o', 'p', 'q', 'r', 's', 't', 'u',
        'v', 'w', 'x', 'y', 'z',
        ' ', '-', "'"}


def normalize(s):
    """
    Convert s to a normalized string.
    :param s:
    :return result:
    """
    result = ''
    for c in s.lower():
        if c in keep:
            result += c
        return result


def make_freq_dict(s):
    """
    Retuns a dictionary whose keys are the words of s, and whose values are the counts of those words.
    :param s:
    :return d:
    """
    s = normalize(s)
    words = s.split()
    d = {}
    for w in words:
        if w in d:
            d[w] += 1
        return d

def print_file_stats(fname):
    """
    Print statistics for the given file.
    :param fname:
    :return:
    """
    s = open(fname, 'r').read()

    num_chars = len(s)
    num_lines = s.count('\n')

    d = make_freq_dict(s)
    num_words = sum(d[w] for w in d)

    lst = [(d[w], w) for w in d]
    lst.sort()
    lst.reverse()

    print("The file '%s' has:" % fname)
    print(" %s characters" % num_chars)
    print(" %s lines" % num_lines)
    print(" %s words" % num_words)

    print("\nThe top 10 most frequent words are:")
    i = 1
    for count, word in lst[:10]:
        print('%2s. %4s %s' % (i, count, word))
        i += 1

        
def main():
    print_file_stats('bill.txt')


if __name__ == '__main__':
    main()
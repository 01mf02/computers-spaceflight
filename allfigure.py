#!/usr/bin/env python

# debugging
from __future__ import print_function
import sys
def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

from pandocfilters import toJSONFilter, Para

def add_elem(acc, x):
    if x['t'] == 'Image':
        acc.append([x])
        acc.append([])
    else:
        acc[-1].append(x)

    return acc

def all_figure(key, value, format, meta):
    if key == 'Para':
        l = reduce(add_elem, value, [[]])
        return [Para(x) for x in l if x != []]
    if key == 'Image':
        value[2][1] = "fig:"

if __name__ == "__main__":
    toJSONFilter(all_figure)

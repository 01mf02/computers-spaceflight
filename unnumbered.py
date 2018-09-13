#!/usr/bin/env python

# debugging
from __future__ import print_function
import sys
def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

from pandocfilters import toJSONFilter, RawInline, Para
from pfcompat import Image

def latex(x):
    return RawInline('latex', x)

def unnumbered(key, value, format, meta):
    #eprint("Key: " + key)
    if key == 'Header':
        [level, [ident, classes, kvs], inlines] = value
        if level <= 2 and 'unnumbered' in classes:
            cmd = 'addpart' if level == 1 else 'addchap'
            return \
                Para([ latex("\\" + cmd + '{') ] + inlines + [ latex('}\n')])

if __name__ == "__main__":
    toJSONFilter(unnumbered)

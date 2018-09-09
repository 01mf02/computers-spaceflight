#!/usr/bin/env python

# debugging
from __future__ import print_function
import sys
def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

from pandocfilters import toJSONFilter, RawInline
from pfcompat import Image

def latex(x):
    return RawInline('latex', x)

def figure(key, value, format, meta):
    #eprint("Key: " + key)
    if key == 'Image':
        caption = value[1]
        image = Image(value[0], value[1], value[2])

        return \
            [ latex(r'\begin{figure}' + '\n') \
            , image, latex('\n') \
            , latex(r'\caption{') \
            ] + caption + \
            [ latex('}' + '\n') \
            , latex(r'\end{figure}') \
	    ]

if __name__ == "__main__":
    toJSONFilter(figure)

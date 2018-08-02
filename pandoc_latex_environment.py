#!/usr/bin/env python

"""
Pandoc filter for converting divs to LaTeX environments
"""

from pandocfilters import toJSONFilter, RawBlock, stringify

import re

def environment(key, value, format, meta):
    if key == 'Div' and format in ['latex', 'beamer']:

        [[id, classes, properties], content] = value

	if len(classes) == 1:
	    klass = classes[0]

            if id != '':
                label = ' \\label{' + id + '}'
            else:
                label = ''

	    #currentProperties = dict(properties)
            #if 'title' in currentProperties:
            #    title = '[' + currentProperties['title'] + ']'
            #else:
            #    title = ''
	    title = ''

            value[1] = [RawBlock('tex', '\\begin{' + klass + '}' + title + label)] + content + [RawBlock('tex', '\\end{' + klass + '}')]

if __name__ == '__main__':
    toJSONFilter(environment)

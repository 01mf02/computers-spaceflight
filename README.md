# Computers in Spaceflight

This is a cleaned version of the book
"Computers in Spaceflight: The NASA Experience",
available as PDF from
<https://www.ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/19880069935.pdf>
and as HTML from
<https://history.nasa.gov/computers/contents.html>.

The PDF version is several hundreds of megabytes large,
making it hard to print and to navigate.
On the other hand, the HTML version is not available on a single page,
making it also hard to print.

This project has created a representation of the book
that can be used to yield both HTML and PDF versions.
These versions are smaller (in file size) than their originals,
easy to navigate (containing a hyperlinked index),
can be easily printed, and
fix several mistakes.
In addition, the PDF reproduces the page numbers
(until the "source notes" on page 303) and layout of the original book,
so references to pages of the original book remain valid.

The format of choice to represent the book is *Markdown*.
I use the flavour of the *Pandoc* document converter,
which allows conversion of Pandoc to several formats such as
HTML, PDF, ePub and so on.

To generate a PDF/HTML, you need Pandoc with pandocfilters.
I use the version 1.19.2.4, which is shipped with Ubuntu 18.04 LTS.
It can be installed via `sudo apt install pandoc python-pandocfilters`.
For PDF generation, you need a TeX distribution, such as TeX Live.

Generation of PDF is just a `make` away.
For HTML, run `make book.html`.


## Image conversion

To convert the images containing source code (in the appendices),
I proceeded as follows.

To crop away the figure caption:

    convert p396.jpg -chop 0x180 p396s.jpg

To perform OCR:

    tesseract p396s.jpg p396.txt --oem 3 --psm 6 -c preserve_interword_spaces=1

Finally, to remove unneeded blank lines introduced by the OCR:

    sed -i '/^$/d' p396.txt.txt


## TODO

This is work in progress. Help with the following points is welcome.
Just compare the output of the original PDF with the generated PDF.
KOMA-Script experience is particularly helpful.

* Show code figure captions in HTML (e.g. in Appendix II).
* Make page breaks absolute.
* Increase line spacing for headlines (but not always, see p. 258 in Ch8-3).
* Increase paragraph spacing for boxes.
* Do not break paragraphs after boxes that are in-between text
  (for example Box 4-6 in Ch4-7)
* Indent first paragraph of a section/subsection.
* Fix figure placement (see for example p. 196 in Ch6-3).
* Center box headlines and make them bold.

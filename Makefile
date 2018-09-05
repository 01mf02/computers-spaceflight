.SECONDARY:

PROLOGUE = Foreword Preface Acknow heads/Main heads/Reset Computing
POSTSRCS = Biblio Appendix-I Appendix-II Appendix-III Appendix-IV
WILDFILES = $(PROLOGUE) Part?-intro Ch?-? Epilogue Source? $(POSTSRCS)

hngfiles = $(wildcard $(patsubst %,i/filenames/%.html,$(1)))
hngnames = $(patsubst i/filenames/%.html,%,$(call hngfiles,$(1)))

#all: $(patsubst %,i/footnotes/%.html,$(call hngnames,$(WILDFILES)))
all: book.pdf

history.nasa.gov:
	wget \
	  --continue \
	  --recursive \
	  --no-clobber \
	  --page-requisites \
	  --convert-links \
	  --domains nasa.gov \
	  --no-parent \
	  --cut-dirs=2 \
	      https://history.nasa.gov/computers/contents.html

images: history.nasa.gov
	@mkdir -p $@
	ln -sfr $</*.jpg $@/

i/filenames: history.nasa.gov
	@mkdir -p `dirname $@`
	cp -r history.nasa.gov $@
	mv $@/ch1-1.html $@/Ch1-1.html
	mv $@/foreword.html $@/Foreword.html
i/filenames/%.html: i/filenames

# convert DOS line endings
i/unix/%.html: i/filenames/%.html
	@mkdir -p `dirname $@`
	tr "\r" "\n" < $< > $@

i/nofont/%.html: i/unix/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's|<.?FONT.*?>||gs' $< > $@

# necessary to remove these tags, otherwise `tidy` chokes on them
i/noxsas/%.html: i/nofont/%.html
	@mkdir -p `dirname $@`
	sed -e '/X-SAS-WINDOW/d' \
	    -e 's/ X-SAS-UseImageHeight//g' \
	    -e 's/ X-SAS-UseImageWidth//g' \
	    -e 's/X-SAS-UseImageWidth //g' $< > $@

# fix Ch2-5, Ch2-6, Ch2-8, Ch3-2
# depends on font information to be removed first!
i/fixtags/%.html: i/noxsas/%.html
	@mkdir -p `dirname $@`
	sed -e 's|</SUP></B><SUP>.</A></SUP>|</A></SUP></B>.|' \
	    -e 's|</SUP></B>.</A>|</A></SUP></B>.|' $< > $@

i/captioncase/%.html: i/fixtags/%.html
	@mkdir -p `dirname $@`
	sed -e 's/FIGURE/Figure/g' \
	    -e 's/TABLE/Table/g' $< > $@

i/tidy0/%.html: i/captioncase/%.html
	@mkdir -p `dirname $@`
	-tidy -wrap $< > $@

i/nonbsp/%.html: i/tidy0/%.html
	@mkdir -p `dirname $@`
	sed -e 's|\([^]]\).nbsp.|\1|g' \
	    -e 's|^.nbsp.||g' \
	    -e 's|.nbsp.<|<|g' $< > $@

i/nobr/%.html: i/nonbsp/%.html
	@mkdir -p `dirname $@`
	sed -e 's|<br>||g' \
	    -e 's|<br .>||g' $< > $@

# needs to have no brs inside, otherwise tidy recreates brs
i/nodeflists/%.html: i/nobr/%.html
	@mkdir -p `dirname $@`
	sed -e 's|<dl>||g' \
	    -e 's|</dl>||g' \
	    -e 's|<dt>|<p>|g' \
	    -e 's|</dt>|</p>|g' \
	    -e 's|<dd>|<p>|g' \
	    -e 's|</dd>|</p>|g' $< > $@

# necessary because of nbsp and nobr removal
i/tidy1/%.html: i/nodeflists/%.html
	@mkdir -p `dirname $@`
	-tidy -wrap $< > $@

i/noblockquote/%.html: i/tidy1/%.html
	@mkdir -p `dirname $@`
	sed -e '/<blockquote>/d' \
	    -e '/<.blockquote>/d' $< > $@

i/nobooktitle/%.html: i/noblockquote/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's/<body.*?>\n<center>.*?<b>Computers in Spaceflight:\s?The NASA Experience<.b>.*?<.center>/<body>/gs' $< > $@

i/nochapternumber/%.html: i/nobooktitle/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's/<body>\s*?<center>\s*?- Chapter.*? -\s*?<.center>/<body>/gs' $< > $@

i/nochaptertitle/%.html: i/nochapternumber/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's/<body>\s*?<center>\s*?- .*? -\s*?<.center>/<body>/gs' $< > $@

# necessary because there may be empty tags lingering before section title
# (e.g. in Ch2-8)
i/tidy2/%.html: i/nochaptertitle/%.html
	@mkdir -p `dirname $@`
	-tidy -wrap $< > $@

i/h3/%.html: i/tidy2/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's|<body>\s*?<center><b>(.*)<.b><.center>|<body>\n<h3>\1</h3>|g' $< > $@

i/boxes/%.html: i/h3/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's|<hr />\n<p>(.*?)Box (.*)</p>([\S\s]*?)<hr />|<div class=\"box\" title=\"\1Box \2\">\3</div>|g' $< > $@

# only once we have converted the boxes, we can get rid of horizontal rules
i/nohr/%.html: i/boxes/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e "s|<hr.*?/>||g" $< > $@

# tidying up necessary because of removing horizontal rules
# otherwise not all figures are detected
i/tidy3/%.html: i/nohr/%.html
	@mkdir -p `dirname $@`
	-tidy -wrap $< > $@

# add missing alt attributes in Ch9-3
i/figalts/%.html: i/tidy3/%.html
	@mkdir -p `dirname $@`
	sed \
	  -e 's|src=\"p289.jpg\"|src=\"p289.jpg\" alt=\"Figure 9-7A.\"|' \
	  -e 's|src=\"p295.jpg\"|src=\"p295.jpg\" alt=\"Figure 9-9A.\"|' \
	  $< > $@

# fix (i.e. inverse) image/caption order for Appendix II
# https://stackoverflow.com/questions/12422615/swap-with-a-consecutive-line-on-a-pattern-match-in-unix/12422780#12422780
i/figorder/Appendix-II.html: i/figalts/Appendix-II.html
	@mkdir -p `dirname $@`
	sed -n '/^<center>Figure II/{h;n;p;g};p' $< > $@
i/figorder/%.html: i/figalts/%.html
	@mkdir -p `dirname $@`
	ln -srf $< $@

i/figures/%.html: i/figorder/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's|<center>.*<img src=\"(.*?)\" alt=\"(.*?)\s*\" .*?/>.*\n<.*?>(.*?)</.*?>|<figure><img src=\"\1\" alt=\"\3\"></figure>|g' $< > $@

i/largefigs/%.html: i/figures/%.html
	@mkdir -p `dirname $@`
	sed 's|p\(.*\)s.jpg|p\1.jpg|g' $< > $@

# remove navigation elements at bottom of page
i/nonav/%.html: i/largefigs/%.html
	@mkdir -p `dirname $@`
	sed '/Index.gif/d' $< > $@

# move page reference from headline in Ch9-2.html
i/headlinepageref/%.html: i/nonav/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's|<center>\[<b>275</b>\] <b>Computers in the Apollo Mission Simulators</b></center>\n<p>|<center><b>Computers in the Apollo Mission Simulators</b></center>\n<p>\[<b>275</b>\] |' $< > $@

i/h4/%.html: i/headlinepageref/%.html
	@mkdir -p `dirname $@`
	sed 's|<center><b>\(.*\)</b></center>|<h4>\1</h4>|g' $< > $@

i/nolinkinref/%.html: i/h4/%.html
	@mkdir -p `dirname $@`
	sed 's|\[<a[^>]*></a>|\[|g' $< > $@

i/prefiximages/%.html: i/nolinkinref/%.html
	@mkdir -p `dirname $@`
	sed "s|p\(.*\).jpg|images/p\\1.jpg|g" $< > $@

# depends on tidying, because <B> can be sometimes preceded by empty <SUP>
i/fixreffmt/%.html: i/prefiximages/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's|\s*<b><sup>|<b><sup>|gs' $< | \
	perl -0777p -e 's|\.<b><sup>(.*?)</sup></b>|<b><sup>\1</sup></b>.|g' | \
	sed         -e 's|\.</a></sup></b>|</a></sup></b>\.|' > $@

i/footnotes/%.html: i/fixreffmt/%.html
	@mkdir -p `dirname $@`
	sed -e 's|<b><sup><a href="[^#]*#\([^\"]*\)\">\**</a></sup></b>|<b><sup><a href="#\1">\1</a></sup></b>|g' \
	     -e 's|<b><a name=\"\([^\"]*\)\"></a>\**</b>|<a id="\1"></a><b>\1</b>|g' \
	     -e 's|<a name=\"\([^\"]*\)[^>]*\"></a><b><sup>\**</sup></b>|<a id="\1"></a><b>\1</b>|g' \
	     -e 's|<a name=\"\([^\"]*\)\"></a><b>\**</b>|<a id="\1"></a><b>\1</b>|g' \
	     -e 's|<a name=\"\([^\"]*\)\"></a>\**|<a id="\1"></a><b>\1</b>|g' \
	     $< > $@

i/markdown/%.md: i/footnotes/%.html
	@mkdir -p `dirname $@`
	pandoc $< -o $@
i/markdown/heads/%.md: heads/%.md
	@mkdir -p `dirname $@`
	cp $< $@

i/markfoot/%.md: i/markdown/%.md
	@mkdir -p `dirname $@`
	sed -e 's|\*\*^\[\([^]]*\)\](#[^)]*)^\*\*|[^\1]|g' \
	    -e 's|^\[\](){#\(.*\)}\*\*[^*]*\*\*|[^\1]:|g' $< > $@

i/markfigpage/%.md: i/markfoot/%.md
	@mkdir -p `dirname $@`
	perl -0777p -e 's|\\\[\*\*([0-9]+)\*\*\\\]\s+!\[(.*)|![\\[**\1**\\] \2|g' $< > $@



PARTS := 1 2 3
PART1 := 1 2 3 4
PART2 := 5 6
PART3 := 7 8 9
makechap = heads/Ch$(1) $(sort $(call hngnames,Ch$(1)*))
makepart = heads/Part$(part) Part$(part)-intro \
	   $(foreach ch,$(PART$(part)),$(call makechap,$(ch)))
SOURCES = heads/Sources $(sort $(call hngnames,Source[0-9]))
BOOK = $(PROLOGUE) heads/FigA \
       $(foreach part,$(PARTS),$(call makepart,$(part))) \
       heads/Reset Epilogue $(SOURCES) $(POSTSRCS)
BOOK_MD = $(BOOK:%=src/%.md)

book.tex: header.tex prologue.tex meta.yaml latex.yaml $(BOOK_MD)
	pandoc -H header.tex -B prologue.tex --toc --top-level-division=part -F pandoc_latex_environment.py meta.yaml latex.yaml $(BOOK_MD) -o $@

book.pdf: book.tex
	latexmk -pdf $<

book.html: meta.yaml style.css $(BOOK_MD)
	pandoc -s --smart --toc meta.yaml --css style.css $(BOOK_MD) -o $@

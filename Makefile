# TODO:
# Appendix II: figure image and caption are swapped

.SECONDARY:

#all: $(patsubst %,h4/%,$(wildcard *.html))
all: $(patsubst %.html,markdown/%.md,$(wildcard *.html))

download:
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

# convert DOS line endings
unix/%.html: %.html
	@mkdir -p `dirname $@`
	tr "\r" "\n" < $< > $@

nofont/%.html: unix/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's/<FONT\s+?FACE.*?>//g' $< | \
	  sed 's/<.FONT>//g' > $@

noxsas/%.html: nofont/%.html
	@mkdir -p `dirname $@`
	sed -e '/X-SAS-WINDOW/d' \
	    -e 's/ X-SAS-UseImageHeight//g' \
	    -e 's/ X-SAS-UseImageWidth//g' \
	    -e 's/X-SAS-UseImageWidth //g' $< > $@

# fix Ch2-5, Ch2-6, Ch2-8, Ch3-2
pretidy/%: noxsas/%
	@mkdir -p `dirname $@`
	sed -e 's|</SUP></B><SUP>.</A></SUP>|</A></SUP></B>.|' \
	    -e 's|</SUP></B>.</A>|</A></SUP></B>.|' $< > $@

tidy/%.html: pretidy/%.html
	@mkdir -p `dirname $@`
	-tidy -i $< > $@

nobooktitle/%.html: tidy/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's/<body.*?>\s*?<center>.*?<b>Computers in Spaceflight:\s?The NASA Experience<.b>.*?<.center>/<body>/gs' $< > $@

nonbsp1/%.html: nobooktitle/%.html
	@mkdir -p `dirname $@`
	sed -e 's/<.>.nbsp.<..>//g' -e 's/<d.>.nbsp.<.d.>//g' -e 's/.nbsp.<br>//g' $< > $@

nonbsp2/%.html: nonbsp1/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's/<center>\s*?.nbsp.\s*?<.center>//gs' $< > $@

tidy2/%.html: nonbsp2/%.html
	@mkdir -p `dirname $@`
	-tidy -i $< > $@

nochapter/%.html: tidy2/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's/<body>\s*?<center>\s*?- Chapter.*? -\s*?<.center>/<body>/gs' $< > $@

nochaptertitle/%.html: nochapter/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's/<body>\s*?<center>\s*?- .*? -\s*?<.center>/<body>/gs' $< > $@

h3/%.html: nochaptertitle/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's|<body>\s*?<center>\s*?<b>(.*)<.b>\s*?<.center>|<body>\n  <h3>\1</h3>|g' $< > $@

nodeflists/%.html: h3/%.html
	@mkdir -p `dirname $@`
	sed -e 's|<dl>||g' -e 's|</dl>||g' -e 's|<dt>|<p>|g' -e 's|</dt>|</p>|g' -e 's|<dd>|<p>|g' -e 's|</dd>|</p>|g' $< > $@

tidy3/%.html: nodeflists/%.html
	@mkdir -p `dirname $@`
	-tidy -wrap $< > $@

noblockquote/%.html: tidy3/%.html
	@mkdir -p `dirname $@`
	sed -e '/<blockquote>/d' -e '/<.blockquote>/d' $< > $@

boxes/%.html: noblockquote/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's|<hr />\n<p>(.*?)Box (.*)</p>([\S\s]*?)<hr />|<div class=\"box\" title=\"\1Box \2\">\3</div>|g' $< > $@

nohr/%.html: boxes/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e "s|<hr.*?/>||g" $< > $@

captioncase/%.html: nohr/%.html
	@mkdir -p `dirname $@`
	sed -e 's/FIGURE/Figure/g' -e 's/TABLE/Table/g' $< > $@

tidy4/%.html: captioncase/%.html
	@mkdir -p `dirname $@`
	-tidy -wrap $< > $@

# add missing alt attributes in Ch9-3
figalts/%.html: tidy4/%.html
	@mkdir -p `dirname $@`
	sed \
	  -e 's|src=\"p289.jpg\"|src=\"p289.jpg\" alt=\"Figure 9-7A.\"|' \
	  -e 's|src=\"p295.jpg\"|src=\"p295.jpg\" alt=\"Figure 9-9A.\"|' \
	  $< > $@

# fix (i.e. inverse) image/caption order for Appendix II
# https://stackoverflow.com/questions/12422615/swap-with-a-consecutive-line-on-a-pattern-match-in-unix/12422780#12422780
figorder/%.html: figalts/%.html
	@mkdir -p `dirname $@`
	sed -n '/^<center>Figure II/{h;n;p;g};p' $< > $@

figures/%.html: figorder/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's|<center>.*<img src=\"(.*?)\" alt=\"(.*?)\s*\" .*?/>.*\n<.*?>(.*?)</.*?>|<figure><img src=\"\1\" alt=\"\2\"><figcaption>\3</figcaption></figure>|g' $< > $@

largefigs/%.html: figures/%.html
	@mkdir -p `dirname $@`
	sed 's|p\(.*\)s.jpg|p\1.jpg|g' $< > $@

# remove navigation elements at bottom of page
nonav/%.html: largefigs/%.html
	@mkdir -p `dirname $@`
	sed '/Index.gif/d' $< > $@

# move page reference from headline in Ch9-2.html
headlinepageref/%.html: nonav/%.html
	@mkdir -p `dirname $@`
	perl -0777p -e 's|<center>\[<b>275</b>\] <b>Computers in the Apollo Mission Simulators</b></center>\n<p>|<center><b>Computers in the Apollo Mission Simulators</b></center>\n<p>\[<b>275</b>\] |' $< > $@

h4/%.html: headlinepageref/%.html
	@mkdir -p `dirname $@`
	sed 's|<center><b>\(.*\)</b></center>|<h4>\1</h4>|g' $< > $@

markdown/%.md: h4/%.html
	@mkdir -p `dirname $@`
	pandoc $< -o $@

PROLOGUE = foreword Preface Acknow Computing
EPILOGUE = markdown/Epilogue $(SOURCES) $(POSTSRCS:%=markdown/%)
POSTSRCS = Biblio Appendix-I Appendix-II Appendix-III Appendix-IV
SOURCES = heads/Sources $(patsubst %,markdown/Source%,$(shell seq 1 9))

PART1 = heads/Part1 markdown/Part1-intro $(CH1) $(CH2) $(CH3) $(CH4)
PART2 = heads/Part2 markdown/Part2-intro $(CH5) $(CH6)
PART3 = heads/Part3 markdown/Part3-intro $(CH7) $(CH8) $(CH9)
CH1 = heads/Ch1 $(patsubst %,markdown/%,ch1-1 Ch1-2 Ch1-3 Ch1-4 Ch1-5)
CH2 = $(call makechap,2,9)
CH3 = $(call makechap,3,6)
CH4 = $(call makechap,4,9)
CH5 = $(call makechap,5,7)
CH6 = $(call makechap,6,4)
CH7 = $(call makechap,7,3)
CH8 = $(call makechap,8,3)
CH9 = $(call makechap,9,3)

makechap = heads/Ch$(1) $(patsubst %,markdown/Ch$(1)-%,$(shell seq 1 $(2)))
makepart = heads/Part$(1) markdown/Part$(1)-intro $(2)

final.pdf:
	pandoc -V documentclass:article --toc meta.md \
	  $(PROLOGUE:%=markdown/%.md) \
	  $(PART1:%=%.md) \
	  $(PART2:%=%.md) \
	  $(PART3:%=%.md) \
	  $(EPILOGUE:%=%.md) \
	  -o $@

.SECONDARY:

PROLOGUE = Foreword Preface Acknow Computing
POSTSRCS = Biblio Appendix-I Appendix-II Appendix-III Appendix-IV
WILDFILES = $(PROLOGUE) Part?-intro Ch?-? Epilogue Source? $(POSTSRCS)
HNGFILES = $(wildcard $(patsubst %,history.nasa.gov/%.html,$(WILDFILES)))
FILES = $(patsubst history.nasa.gov/%.html,%,$(HNGFILES))

all: $(patsubst %,i/nolinkinref/%.html,$(FILES))
#all: $(patsubst %,i/markdown/%.md,$(FILES))

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
	cp $</*.jpg $@/

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

# necessary to remove these tags, otherwise `tidy` chokes on them
i/noxsas/%.html: i/unix/%.html
	@mkdir -p `dirname $@`
	sed -e '/X-SAS-WINDOW/d' \
	    -e 's/ X-SAS-UseImageHeight//g' \
	    -e 's/ X-SAS-UseImageWidth//g' \
	    -e 's/X-SAS-UseImageWidth //g' $< > $@

# fix Ch2-5, Ch2-6, Ch2-8, Ch3-2
i/fixtags/%.html: i/noxsas/%.html
	@mkdir -p `dirname $@`
	sed -e 's|</SUP></B><SUP>.</A></SUP>|</A></SUP></B>.|' \
	    -e 's|</SUP></B>.</A>|</A></SUP></B>.|' $< > $@

# TODO: not needed anymore?
# throw away everything after `</HTML>`, as there is some garbage left
i/fixend/%.html: i/fixtags/%.html
	@mkdir -p `dirname $@`
	sed '/<.HTML>/q' $< > $@

i/captioncase/%.html: i/fixend/%.html
	@mkdir -p `dirname $@`
	sed -e 's/FIGURE/Figure/g' \
	    -e 's/TABLE/Table/g' $< > $@

i/tidy0/%.html: i/captioncase/%.html
	@mkdir -p `dirname $@`
	-tidy -wrap $< > $@

i/nofont/%.html: i/tidy0/%.html
	@mkdir -p `dirname $@`
	sed -e 's|<font[^>]*>||g' \
	    -e 's|</font>||g' $< > $@

i/nonbsp/%.html: i/nofont/%.html
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
	perl -0777p -e 's|<center>.*<img src=\"(.*?)\" alt=\"(.*?)\s*\" .*?/>.*\n<.*?>(.*?)</.*?>|<figure><img src=\"\1\" alt=\"\2\"><figcaption>\3</figcaption></figure>|g' $< > $@

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

i/markdown/%.md: i/h4/%.html
	@mkdir -p `dirname $@`
	pandoc $< -o $@

#PROLOGUE = foreword Preface Acknow Computing
#EPILOGUE = markdown/Epilogue $(SOURCES) $(POSTSRCS:%=markdown/%)
#POSTSRCS = Biblio Appendix-I Appendix-II Appendix-III Appendix-IV
#SOURCES = heads/Sources $(patsubst %,markdown/Source%,$(shell seq 1 9))
#
#PART1 = heads/Part1 markdown/Part1-intro $(CH1) $(CH2) $(CH3) $(CH4)
#PART2 = heads/Part2 markdown/Part2-intro $(CH5) $(CH6)
#PART3 = heads/Part3 markdown/Part3-intro $(CH7) $(CH8) $(CH9)
#CH1 = heads/Ch1 $(patsubst %,markdown/%,ch1-1 Ch1-2 Ch1-3 Ch1-4 Ch1-5)
#CH2 = $(call makechap,2,9)
#CH3 = $(call makechap,3,6)
#CH4 = $(call makechap,4,9)
#CH5 = $(call makechap,5,7)
#CH6 = $(call makechap,6,4)
#CH7 = $(call makechap,7,3)
#CH8 = $(call makechap,8,3)
#CH9 = $(call makechap,9,3)
#
#makechap = heads/Ch$(1) $(patsubst %,markdown/Ch$(1)-%,$(shell seq 1 $(2)))
#makepart = heads/Part$(1) markdown/Part$(1)-intro $(2)

final.pdf:
	pandoc -V documentclass:article --toc meta.md \
	  $(PROLOGUE:%=markdown/%.md) \
	  $(PART1:%=%.md) \
	  $(PART2:%=%.md) \
	  $(PART3:%=%.md) \
	  $(EPILOGUE:%=%.md) \
	  -o $@

# labPages
# http://localhost:4103/
# make serve ##

## https://mac-theobio.github.io/

current: target
-include target.mk

##################################################################

## Defs

# stuff

Sources += Makefile README.md

msrepo = https://github.com/dushoff
ms = makestuff
Ignore += local.mk
-include local.mk
-include makestuff/os.mk

# -include makestuff/perl.def

Ignore += makestuff
Makefile: makestuff $(ms)/Makefile
makestuff:
	git clone $(msrepo)/makestuff

######################################################################

Sources += $(wildcard *.md jd/*.md covid-19/*.md)

subdirs += events forecasts

alldirs += $(subdirs)

######################################################################

## Importing

Ignore += *.page.mkd *.wikitext
%.page.mkd: page.md %.wikitext
	cat $< > $@
	pandoc -f mediawiki -t markdown $*.wikitext >> $@

index.page.mkd: index.wikitext

######################################################################

# Pix

Sources += favicon.ico seird.jpg
Ignore += 16.ico 32.ico

Ignore += *.crop.jpg
seird.crop.jpg: seird.jpg Makefile
	convert -crop 350x350+280+30 $< $@
favicon.ico: seird.crop.jpg
	convert -resize x16 -gravity center -crop 16x16+0+0 -flatten -colors 256 $< 16.ico
	convert -resize x32 -gravity center -crop 32x32+0+0 -flatten -colors 256 $< 32.ico
	convert 16.ico 32.ico $@

######################################################################

# Jekyll

Sources += _config.yml $(wildcard Gemfile_*)

Sources += _includes/* _layouts/* css/* _sass/*

## cp -r _config.yml Gemfile_* _includes _layouts css _sass ~/gitroot/labPages ##

Ignore += .sass-cache/ Gemfile Gemfile.lock _site/

## Gemfile_sb.set:
Gemfile_orig.set Gemfile_sb.set: 
	/bin/ln -fs $(basename $@)  Gemfile

######################################################################

### Makestuff

-include makestuff/git.mk
-include makestuff/visual.mk

# -include makestuff/wrapR.mk


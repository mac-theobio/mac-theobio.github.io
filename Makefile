# labPages
# http://localhost:4103/
# make serve

current: target
-include target.mk

##################################################################

## Defs

# stuff

Sources += Makefile 

msrepo = https://github.com/dushoff
ms = makestuff
Ignore += local.mk
-include local.mk
-include $(ms)/os.mk

# -include $(ms)/perl.def

Ignore += $(ms)
Makefile: $(ms) $(ms)/Makefile
$(ms):
	git clone $(msrepo)/$(ms)

######################################################################

Sources += $(wildcard *.md jd/*.md)

######################################################################

## Importing

Ignore += *.page.mkd *.wikitext
%.page.mkd: page.md %.wikitext
	cat $< > $@
	pandoc -f mediawiki -t markdown $*.wikitext >> $@

index.page.mkd: index.wikitext

######################################################################


# Jekyll

Sources += seird.jpg

Sources += _config.yml $(wildcard Gemfile_*)

Sources += _includes/* _layouts/* css/* _sass/*

## cp -r _config.yml Gemfile_* _includes _layouts css _sass ~/gitroot/labPages ##

Gemfile_orig.set Gemfile_sb.set: 
	/bin/ln -fs $(basename $@)  Gemfile

######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk


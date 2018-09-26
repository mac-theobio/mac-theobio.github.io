# labPages
# http://localhost:4103/

current: target
-include target.mk

##################################################################

## Defs

# stuff

Sources += Makefile .ignore 
Ignore += .gitignore

msrepo = https://github.com/dushoff
ms = makestuff
Ignore += local.mk
-include local.mk
-include $(ms)/os.mk

# -include $(ms)/perl.def

Ignore += $(ms)
## Sources += $(ms)
Makefile: $(ms) $(ms)/Makefile
$(ms):
	git clone $(msrepo)/$(ms)

######################################################################

Sources += index.md

######################################################################

# JD-specific

wikiclean:
	$(RMF) *.page.md *.wikitext
offenders.page.md: offenders.wikitext
Ignore += *.page.md *.wikitext
%.page.md: page.md %.wikitext
	cat $< > $@
	pandoc -f mediawiki -t markdown $*.wikitext >> $@
	
Sources += jd/recommend.md jd/offenders.md

######################################################################

# Jekyll

Sources += seird.jpg

Sources += _config.yml $(wildcard Gemfile_*)

Sources += _includes/* _layouts/* css/* _sass/*

## cp -r _config.yml Gemfile_* _includes _layouts css _sass ~/gitroot/labPages ##

Gemfile_orig.set Gemfile_sb.set: /proc/uptime
	/bin/ln -fs $(basename $@)  Gemfile

######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk


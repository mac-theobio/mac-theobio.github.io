# labPages/events
# http://localhost:4103/labPages/
# make serve ##

## https://mac-theobio.github.io

current: target
-include target.mk

##################################################################

Sources += index.md

## Mike seminar

Sources += images/*.* Li_seminar.html
Sources += slides/*.pdf
Sources += $(wildcard *.jpg)

######################################################################

### Makestuff

## Defs

Sources += Makefile
ms = makestuff

Ignore += makestuff

Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include makestuff/os.mk

-include makestuff/git.mk
-include makestuff/visual.mk


# labPages/events
# http://localhost:4103/labPages/
# make serve ##

## https://mac-theobio.github.io

current: target
-include target.mk

##################################################################

## Defs

Sources += Makefile

ms = makestuff
Ignore += $(ms)
Makefile: $(ms)/Makefile
	touch $@
$(ms)/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include $(ms)/os.mk

######################################################################

Sources += index.md

## Mike seminar

Sources += images/*.* Li_seminar.html
Sources += slides/*.pdf
Sources += $(wildcard *.jpg)

######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk


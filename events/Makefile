
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

## index
## Idiotically maintain this manually

Sources += index.md

## Mike seminar

Sources += images/*.* Li_seminar.html

######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk


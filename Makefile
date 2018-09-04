# labPages
### Hooks for the editor to set the default target

current: target
-include target.mk

##################################################################

# Jekyll

Sources += _config.yml $(wildcard Gemfile_*)

Sources += _includes/* _layouts/* css/* _sass/*

## cp -r _config.yml Gemfile_* _includes _layouts css _sass ~/gitroot/labPages ##

Gemfile_orig.set Gemfile_sb.set: /proc/uptime
	/bin/ln -fs $(basename $@)  Gemfile

######################################################################


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

## Only meant to work with makestuff.sub
$(ms)/%.mk: $(ms)/Makefile ;
$(ms)/Makefile:
	git submodule update -i

######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk


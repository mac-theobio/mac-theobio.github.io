# labPages/forecasts
# http://localhost:4103/forecasts/
# make serve ##

## https://mac-theobio.github.io

current: target
-include target.mk

##################################################################

## Starting with Irena's forecast report

Ignore += ON_forecast-accuracy.zip ## Makes Irena's original folder
Sources += index.Rmd

## index.md: index.Rmd
index.html index.md: index.Rmd data/ON_forecasts.Rdata data/ON_infection-reports.Rdata
	Rscript -e "rmarkdown::render('$<')"

Sources += $(wildcard funs/*.R)
Ignore += figs data ## Need to figure out how these are made or found

##################################################################

### Makestuff

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


# labPages/forecasts
# http://localhost:4103/forecasts/
# http://localhost:4103/forecasts/outputs/
# make serve ##

## https://mac-theobio.github.io

current: target
-include target.mk

##################################################################

## Starting with Irena's forecast report

Ignore += ON_forecast-accuracy.zip ## Makes Irena's original folder
Sources += 2021-04-19.Rmd

## Making index.md from index.Rmd; html is a side product and is different from the html that will be rendered by jekyll
## Things needed to render must also be copied to outputs and pushed
## index.md: index.Rmd
2021-04-19.html 2021-04-19.md: 2021-04-19.Rmd data/ON_forecasts.Rdata data/ON_infection-reports.Rdata
	Rscript -e "rmarkdown::render('$<')"

2021-04-19_files: 2021-04-19.md ;

push_2021-04-19: 2021-04-19.html.op

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


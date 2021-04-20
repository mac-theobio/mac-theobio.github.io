# labPages/forecasts
# http://localhost:4103/forecasts/
# http://localhost:4103/forecasts/outputs/ON_accuracy.html
# make serve ##

## https://mac-theobio.github.io/forecasts/outputs/

current: target
-include target.mk

##################################################################

## Starting with Irena's forecast report

Ignore += ON_forecast-accuracy.zip ## Makes Irena's original folder
Sources += ON_accuracy.Rmd

Sources += content.mk

## Make foo.md from foo.Rmd; html is a side product and is different from the html that will be rendered by jekyll
## Things needed to render must also be copied to outputs and pushed
## ON_accuracy.html: ON_accuracy.Rmd
ON_accuracy.html: ON_accuracy.Rmd data/ON_forecasts.Rdata data/ON_infection-reports.Rdata
	Rscript -e "rmarkdown::render('$<')"

Ignore += ON_accuracy_files ON_accuracy.md ON_accuracy.html
ON_accuracy_files ON_accuracy.md: ON_accuracy.html ;

Sources += $(wildcard funs/*.R)
Ignore += figs data ## Need to figure out how these are made or found

push_page: ON_accuracy.html.op ON_accuracy_files.opdir 

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


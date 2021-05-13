# labPages/forecasts
# http://localhost:4103/forecasts/ON_forecast_0502
# http://localhost:4103/forecasts/outputs/ON_accuracy.html
# DO NOT SERVE FROM HERE (use parent)

## https://mac-theobio.github.io/forecasts/outputs/McMasterOntarioForecastsBlog2021-05-09

current: target
-include target.mk

##################################################################

Rrender = Rscript -e "rmarkdown::render('$<')"

## The first forecast blog

Ignore += ON_forecast-accuracy_blog-post/
Ignore += ON_forecast-accuracy.zip ## Makes Irena's original folder
Sources += ON_accuracy.Rmd

## Not clear what this is
Sources += content.mk

## ON_accuracy.html: ON_accuracy.Rmd
ON_accuracy.html: ON_accuracy.Rmd data/ON_forecasts.Rdata data/ON_infection-reports.Rdata
	$(Rrender)

Ignore += ON_accuracy_files ON_accuracy.md ON_accuracy.html
ON_accuracy_files ON_accuracy.md: ON_accuracy.html ;

Sources += $(wildcard funs/*.R)
Ignore += figs data ## Need to figure out how these are made or found

######################################################################

## Things needed to render must also be copied to outputs and pushed
push_page: ON_accuracy.html.op
## ON_accuracy_files.opdir 

##################################################################

## File location

## omt_blog = ~/screens/research/MacOMT/forecast_blog/

Ignore += local.mk
-include local.mk

## This is weirdly indirect; why not just make a symbolic link with this name?
omt_blog: 
	@(ls $(omt_blog)/Makefile > /dev/null) || (echo ERROR: Please set omt_blog directory in local.mk && false)

######################################################################

## 2021 May 12 (Wed) Just manually renaming the output html for now
## git mv outputs/ON_forecast_0509.html outputs/McMasterOntarioForecastsBlog2021-05-09.html ##

Sources += header.html footer.html

## Subsequent forecast blogs

Sources += fd.pl
## This rule will overwrite local changes!
## It's also weird; we can just keep the name from omt_blog
## ON_forecast_2022_0509.crib:
%.crib: omt_blog
	perl -wf fd.pl $* `ls -t $(omt_blog)/*.md | head -1` > $*.md
	$(RMR) $*_files
	cp -r `ls -dt $(omt_blog)/*_files | head -1` $*_files
	cp $(omt_blog)/style.css .

## It's literally just impossible how badly all of this works!
## JD is still adding header/footer to yaml manually. Fix this before you add another one. 2021 May 12 (Wed)
ON_forecast_0509.html: ON_forecast_0509.md
	$(Rrender)

Sources += $(wildcard ON_forecast_*.md) style.css
Sources += $(wildcard ON_forecast_*_files/*)

######################################################################

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


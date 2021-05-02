# labPages/forecasts
# http://localhost:4103/forecasts/ON_forecast_0502
# http://localhost:4103/forecasts/outputs/ON_accuracy.html
# DO NOT SERVE FROM HERE (use parent)

## https://mac-theobio.github.io/forecasts/ON_forecast_0502
## https://mac-theobio.github.io/forecasts/outputs/ON_forecast_0502

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

omt_blog: 
	@(ls $(omt_blog)/Makefile > /dev/null) || (echo ERROR: Please set omt_blog directory in local.mk && false)

######################################################################

Sources += header.html footer.html

## Subsequent forecast blogs

Sources += fd.pl
## This rule will overwrite local changes!
## ON_forecast_0502.crib:
%.crib: omt_blog
	perl -wf fd.pl $* `ls -t $(omt_blog)/*.md | head -1` > $*.md
	$(RMR) $*_files
	cp -r `ls -dt $(omt_blog)/*_files | head -1` $*_files
	cp $(omt_blog)/style.css .

## Drops YAML and doesn't work even if yaml is put back?
ON_forecast_0502.gfm.md: ON_forecast_0502.md
	pandoc -t gfm -o $@ $<

ON_forecast_0502.md:

## It's literally just impossible how badly all of this works!
## Don't let .md compete with .html in a jekyll dir (even locally)
ON_forecast_0502.render.html: ON_forecast_0502.md
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


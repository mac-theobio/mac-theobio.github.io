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

Ignore += local.mk
-include local.mk

Ignore += McMasterOntarioForecastsBlog2*.*
Ignore += omt_blog

omt_blog:
	@(ls $(omt_blog)/Makefile > /dev/null && ln -s $(omt_blog) $@) \
	|| (echo ERROR: Please set omt_blog directory in local.mk && false)

######################################################################

## Making this a pipeline

Sources += header.html footer.html
Sources += fd.pl

currblog = $(notdir $(shell ls -t omt_blog/*.md | head -1))
currfiles = $(currblog:.md=_files)

## Get blog from private site
get_blog: omt_blog
	$(CP) omt_blog/$(currblog) .
	-$(RMR) $(currfiles)
	$(CPR) omt_blog/$(currfiles) .
	$(CP) omt_blog/style.css .

format_blog:
	perl -i -wf fd.pl $(currblog)

view_blog:
	$(MAKE) $(currblog:.md=.html.go)

make_blog: get_blog format_blog view_blog

post_blog:
	$(MAKE) $(currblog:.md=.html.op)

## It's literally just impossible how badly all of this works!
## JD is still adding header/footer to yaml manually. Fix this before you add another one. 2021 May 12 (Wed)
%.html: %.md
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


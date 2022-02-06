# labPages/forecasts
# DO NOT SERVE FROM HERE (use parent)
# http://localhost:4103/forecasts/outputs/McMasterOntarioForecastsBlog2021-09-20.html

## https://mac-theobio.github.io/forecasts/outputs/McMasterOntarioForecastsBlog2021-09-20.html

current: target
-include target.mk

##################################################################

-include makestuff/perl.def

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

## Use local.mk to point to omt_blog: e.g.,
## echo 'omt_blog = ~/screens/research/MacOMT/forecast_blog/' > local.mk ##
Ignore += local.mk
-include local.mk

Ignore += McMasterOntarioForecastsBlog*.* McMasterOntarioForecastsBlog*/
Ignore += omt_blog

omt_blog:
	(ls $(omt_blog)/Makefile > /dev/null && ln -s $(omt_blog) $@) \
	|| (echo ERROR: Please set omt_blog directory in local.mk && false)

######################################################################

## Making this a pipeline
## This part also looks moribund now 2021 Dec 06 (Mon)

Sources += header.html footer.html
Sources += fd.pl

## blogno counts backward; blogno=1 will look for most recent Rmd file
blogno = 1

currblog = $(notdir $(shell ls omt_blog/Mc*.Rmd | tail -$(blogno) | head -1))
currfiles = $(currblog:.Rmd=_files)
currmark = $(currblog:.Rmd=.md)
currhtml = $(currblog:.Rmd=.html)

allblog = $(notdir $(shell ls omt_blog/Mc*.Rmd))
allmark = $(allblog:.Rmd=.md)

######################################################################

## New 2021 Jun 08 (Tue)
## _files are needed to make .html from md, but not needed to visualize html

hotdirs += omt_blog

Makefile: omt_blog/Makefile
omt_blog/Makefile: | omt_blog

.PRECIOUS: McM%.md
McM%.md: omt_blog/McM%.md fd.pl
	$(PUSH)
	$(CP) omt_blog/style*.css .
	-$(RMR) McM$*_files
	$(CPR) omt_blog/McM$*_files .

Ignore += current.html
current.html: $(currhtml)
	$(lnf)

currpost:
	$(MAKE) $(currmark:.md=.html.op)

## This might update and post all of the blogs found on omt_blog
allpost:
	$(MAKE) $(allmark:.md=.html.op)

######################################################################

## Deprecated 2021 Jun 08 (Tue)

## Get blog from private site
get_blog: omt_blog
	$(MAKE) omt_blog/$(currhtml)
	$(CP) omt_blog/$(currmark) .
	-$(RMR) $(currfiles)
	$(CPR) omt_blog/$(currfiles) .
	$(CP) omt_blog/style*.css .

## Make this real instead of PHONY

## Currently adding header/footer to yaml with perl script.
format_blog: get_blog
	perl -i -wf fd.pl $(currmark)

view_blog: format_blog
	$(MAKE) $(currmark:.md=.html.go)

post_blog: format_blog
	$(MAKE) $(currmark:.md=.html.op)

.PRECIOUS: %.html
%.html: %.md
	$(Rrender)

Sources += $(wildcard ON_forecast_*.md) style*.css
Sources += $(wildcard ON_forecast_*_files/*)

######################################################################

### Makestuff

Sources += Makefile

ms = makestuff
msrepo = https://github.com/dushoff

Ignore += makestuff
Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	git clone $(msrepo)/makestuff

-include makestuff/os.mk

-include makestuff/hotcold.mk

-include makestuff/git.mk
-include makestuff/visual.mk

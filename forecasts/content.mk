report: ON_forecast-accuracy.Rmd data/ON_forecasts.Rdata
	Rscript -e "rmarkdown::render('ON_forecast-accuracy.Rmd')"

tidy-data: scripts/make_tidy_data.R
	cd scripts; \
	Rscript --vanilla make_tidy_data.R; \
	cd ..;

forecast-gifs: scripts/make_forecast_gifs.R
	cd scripts; \
	Rscript --vanilla make_forecast_gifs.R; \
	cd ..;


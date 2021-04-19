---
layout: page
title: "Early prediction of Ontario's third COVID-19 wave"
subtitle: "[`McMasterPandemic`](https://github.com/bbolker/McMasterPandemic) Modelling Group"
author: "Michael Li, Irena Papst ([\\@irenapapst](https://twitter.com/irenapapst)), Ben Bolker ([\\@bolkerb](https://twitter.com/bolkerb)), Jonathan Dushoff ([\\@jd_mathbio](https://twitter.com/jd_mathbio)), David Earn ([\\@DavidJDEarn](https://twitter.com/davidjdearn))"
date: "Last update: 19 Apr 2021"
output: 
  bookdown::html_document2:
    keep_md: true
    number_sections: false
    toc: true
    toc_depth: 2
---



<style type="text/css">
p {
  font-size: 16px;
}

.caption {
  font-size: 14px;
  font-style: italic;
}
</style>

Here, we discuss our group’s most recent Ontario COVID-19 forecasts, and elaborate on a key modelling decision that enabled us to predict Ontario's third wave accurately, weeks in advance, while infection reports were still declining. 

# Context

Every two weeks, our group provides COVID-19 infection report forecasts for the province of Ontario to the [Ontario Modelling Consensus Table](https://covid19-sciencetable.ca/our-partners/), a partner of the [Ontario Science Advisory Table](https://covid19-sciencetable.ca).^[This report has been written independently of the Ontario Modelling Consensus Table and the Ontario Science Advisory Table. The views expressed in this report are solely the authors’ and do not reflect the opinions of either group.]

Our forecasts are based on a [compartmental epidemic model](https://en.wikipedia.org/wiki/Compartmental_models_in_epidemiology) implemented in our publicly available [`McMasterPandemic`](https://github.com/bbolker/McMasterPandemic) R package, and involve statistical fits to [the province's latest infection report data](https://covid-19.ontario.ca/data).

# An early warning

We made a forecast on 21 Feb 2021, when infection reports were still declining steadily from a peak in early January. At the time, we were asked to consider what would happen if public health measures were to relax in early March.

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/forecast-21feb-before-1.png" alt="The forecast made on 21 Feb 2021 (curve framed by a 95% confidence band). Observed infection reports (known at the time of the forecast) are denoted with solid black points. The forecast date is indicated with the dotted black vertical line. The forecast assumed that public health (PH) measures would be reduced on 8 Mar 2021, indicated with the dashed black vertical line."  />
<p class="caption">(\#fig:forecast-21feb-before)The forecast made on 21 Feb 2021 (curve framed by a 95% confidence band). Observed infection reports (known at the time of the forecast) are denoted with solid black points. The forecast date is indicated with the dotted black vertical line. The forecast assumed that public health (PH) measures would be reduced on 8 Mar 2021, indicated with the dashed black vertical line.</p>
</div>

Our model predicted exponential growth in infection reports very soon after an early-March reduction in public health measures. This prediction was rather startling at the time, especially given that infection reports appeared to still be declining. 

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/forecast-21feb-after-1.png" alt="The forecast made on 21 Feb 2021, with infection reports observed after the forecast date denoted with hollow black points. The actual lifting of the stay-at-home order on 8 Mar 2021 is indicated with the solid black vertical line."  />
<p class="caption">(\#fig:forecast-21feb-after)The forecast made on 21 Feb 2021, with infection reports observed after the forecast date denoted with hollow black points. The actual lifting of the stay-at-home order on 8 Mar 2021 is indicated with the solid black vertical line.</p>
</div>

Public health measures did indeed relax further in early March: on March 8th, the province [lifted the January stay-at-home order](https://news.ontario.ca/en/release/60580/toronto-peel-and-north-bay-parry-sound-public-health-regions-returning-to-strengthened-covid-19-resp) in the last few regions where it was still in effect (Toronto, Peel, and North Bay Parry Sound). Infection reports began growing exponentially soon after our forecast was made, propelling Ontario into its third, and largest, wave of infection as of early April 2021.

# An updated trajectory

When we made a forecast on 20 Mar 2021, infection reports had been increasing for a few weeks, so we were able to calibrate the growth rate of the third wave more precisely than in the 21 Feb forecast. We presented a "status quo" forecast, where we assumed that there were no changes to public health policy after the forecast date.

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/forecast-20mar-before-1.png" alt="The forecast made on 20 Mar 2021 (curve framed by a 95% confidence band). Observed infection reports (known at the time of the forecast) are denoted with solid black points. The forecast date is indicated with the dotted black vertical line."  />
<p class="caption">(\#fig:forecast-20mar-before)The forecast made on 20 Mar 2021 (curve framed by a 95% confidence band). Observed infection reports (known at the time of the forecast) are denoted with solid black points. The forecast date is indicated with the dotted black vertical line.</p>
</div>

Our model once again predicted exponential growth in infection reports into April 2021.

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/forecast-20mar-after-1.png" alt="The forecast made on 20 Mar 2021, with infection reports observed after the forecast date denoted with hollow black points."  />
<p class="caption">(\#fig:forecast-20mar-after)The forecast made on 20 Mar 2021, with infection reports observed after the forecast date denoted with hollow black points.</p>
</div>

Recent infection reports have followed the trajectory of our forecast into early April. We expect to see slowed growth in infection reports following the new provincial stay-at-home order effective 8 Apr 2021.

# Key modelling decision: incorporating B.1.1.7 takeover

Why is it that our model was able to predict the third wave of infection as early as mid-February, despite steadily declining infection reports at the time? The key was that we explicitly incorporated early signals of Variant of Concern ("VoC") spread in our model.

## B.1.1.7 in Ontario

The B.1.1.7 VoC was [first confirmed in Ontario on 26 Dec 2020](https://globalnews.ca/news/7542830/ontario-canada-first-cases-uk-coronavirus-variant/). [Early analysis from the United Kingdom](https://www.medrxiv.org/content/10.1101/2020.12.24.20248822v1?versioned=true) suggested that this variant would be about 50% more transmissible than strains that were previously circulating in Ontario ("non-VoCs"). 

This increased transmissibility has given B.1.1.7 a [selective advantage](https://en.wikipedia.org/wiki/Natural_selection) in Ontario, and this VoC is now dominant in the province, accounting for the majority of infection reports as of early April 2021. However, this variant was kept to low prevalence in the province for nearly two months, thanks to a coincident province-wide lockdown on 26 Dec 2020, followed shortly by a provincial stay-at-home order, which came into effect on 14 Jan 2021:

<div class="figure" style="text-align: center">
<img src="figs/2021-04-06-Estimated-Incidence_New-VOC-and-non-VOC-768x661.png" alt="All daily COVID-19 infection reports for Ontario (purple curve), with VoC infections subset (orange curve). Base plot from the [Ontario Science Advisory Table COVID-19 dashboard](https://covid19-sciencetable.ca/ontario-dashboard/)." width="737" />
<p class="caption">(\#fig:VoC-takeover)All daily COVID-19 infection reports for Ontario (purple curve), with VoC infections subset (orange curve). Base plot from the [Ontario Science Advisory Table COVID-19 dashboard](https://covid19-sciencetable.ca/ontario-dashboard/).</p>
</div>

Our group identified the threat posed by VoCs to the province early on, and explicitly incorporated the eventual takeover of a more transmissible variant in our model, as predicted by evolutionary theory. The precision with which we were able to model the growth of B.1.1.7 in Ontario is due to [estimates of transmission advantage from the United Kingdom](https://www.medrxiv.org/content/10.1101/2020.12.24.20248822v1?versioned=true) as well as [early VoC surveillence data](https://www.publichealthontario.ca/-/media/documents/ncov/voc/2021/02/sars-cov-2-variants-point-prevalence.pdf?la=en) from [Public Health Ontario](https://covid-19.ontario.ca/covid-19-epidemiologic-summaries-public-health-ontario).

## What if we hadn't explicitly incorporated B.1.1.7 takeover in our forecasts?

In preparing our forecasts, we also considered a scenario that did not explicitly incorporate the predicted B.1.1.7 takeover effect. Instead, we let the model fitting procedure infer any increases in the transmission rate solely using the infection reports observed at the time of the forecast, and then we propagated whatever effect had been detected forward after the forecast date. We call this the "baseline" scenario, where any increases to transmission due to B.1.1.7 spread are implicit in the infection report data.

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/p-21feb-bothscenarios-1.png" alt="*Forecasts made on 21 Feb 2021 and 20 Mar 2021 (curves framed by a 95% confidence band). The first scenario (red curve) involves explicitly modelling the takeover by the more-transmissible variant of concern (B.1.1.7), while the second scenario (blue curve) only includes increased transmissibility implicit in the infection report data.*"  />
<p class="caption">(\#fig:p-21feb-bothscenarios)*Forecasts made on 21 Feb 2021 and 20 Mar 2021 (curves framed by a 95% confidence band). The first scenario (red curve) involves explicitly modelling the takeover by the more-transmissible variant of concern (B.1.1.7), while the second scenario (blue curve) only includes increased transmissibility implicit in the infection report data.*</p>
</div>

In both forecasts, the baseline scenario is unable to predict the observed exponential growth in infection reports starting in mid-March. 

# Final thoughts

Accurate forecasts would not have been possible in this context had we simply relied on detecting increases to the transmission rate through infection report data. Modellers should continue to [monitor the global VoC situation closely](https://www.nytimes.com/interactive/2021/health/coronavirus-variant-tracker.html) and make careful, proactive adjustments to their projection scenarios when variant of concern threats emerge in their region, be it due to a novel mutation or VoC importation from another region. [Early VoC surveillance](https://www.publichealthontario.ca/en/about/blog/2021/monitoring-covid-19-voc) is crucial for this purpose.

We must also acknowledge that our model, as any, is not perfect, nor is it static. We are constantly working on model improvements to ensure our projections remain reliable throughout this pandemic. Our current work involves reducing uncertainties in disease transmission mechanisms, by integrating more realistic social structure and more precisely capturing the effect of the ongoing vaccine roll-out on population immunity.

---

### See our forecasts in action

<img src="figs/feb_forecast.gif" style="display: block; margin: auto;" />

<img src="figs/mar_forecast.gif" style="display: block; margin: auto;" />

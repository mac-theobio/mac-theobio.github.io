
# COVID-19 data analysis and forecasting at McMaster University

_Last update:_ 29 May 2020

Our research group is led by three faculty who have been engaged in epidemiological modelling research for more then 20 years:
- [Ben Bolker](https://ms.mcmaster.ca/~bolker/)
- [Jonathan Dushoff](https://mac-theobio.github.io/dushoff.html)
- [David Earn](http://davidearn.mcmaster.ca)

## Canadian public data repository

Postdoctoral fellow [Michael Li](https://wzmli.github.io/) is working hard to maintain the most complete, clean, Canadian COVID-19 data set derived from public sources: <https://wzmli.github.io/COVID19-Canada/>

## Advice to governments

We are providing comments and modelling results to governments that have sought our help.
The primary tools we are using are listed below.

## `McMasterPandemic` R package

[McMasterPandemic](https://github.com/bbolker/McMasterPandemic) is an R package that provides tools for parameter estimation, simulation, and forecasting infectious disease outbreaks (using compartmental epidemic models).  Follow the link to learn more about the package, including how to install and use it.  The functionality of this package is evolving rapidly.  We will improve the documentation as time permits.

## `epigrowthfit` R package

[epigrowthfit](https://github.com/davidearn/epigrowthfit) is an R package for estimating epidemic growth rates.  It was developed for the purpose of studying growth rates of historical epidemics, but it can be used to study real-time outbreaks.  The methodology and philosophy are based on:

[Ma J, Dushoff J, Bolker BM, Earn DJD (2014) "Estimating initial epidemic growth rates", _Bulletin of Mathematical Biology_, **76(1)**:245-260.](https://davidearn.mcmaster.ca/publications/MaEtAl2014)

The package is [available freely on github](https://github.com/davidearn/epigrowthfit).  We will improve the documentation as time permits.

## COVID-19 publications by our group

#### _Published_

[Weitz JS, Beckett SJ, Coenen AR _et al_, 7 May 2020, _Nature Medicine_ "Modeling shield immunity to reduce COVID-19 epidemic spread"](https://www.nature.com/articles/s41591-020-0895-3)

Barton CM, Alberti M, Ames D, Atkinson, J-A, Bales J, Burke E, Chen M, Diallo SY, Earn DJD, Fath B, Feng Z, Gibbons C, Hammond R, Heffernan J, Houser H, Hovmand PS, Kopainsky B, Mabry P L, Mair C, Meier P, Niles R, Nosek B, Osgood N, Pierce S, Polhill JG, Prosser L, Robinson E, Rosenzweig C, Sankaran S, Stange K, and Tucker G (2020). "Transparency of COVID-19 models." _Science_ **368**(6490), 482–483, DOI: http://science.sciencemag.org/cgi/doi/10.1126/science.abb8637

#### _Preprints_

Park SW, Bolker BM, Champredon D, Earn DJD, Li M, Weitz JS, Grenfell BT, Dushoff J (2020) "Reconciling early-outbreak estimates of the basic reproductive number and its uncertainty: framework and applications to the novel coronavirus (SARS-CoV-2) outbreak",
https://www.medrxiv.org/content/10.1101/2020.01.30.20019877v4


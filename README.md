
# haiDash

The **haiDash** R package provides an interactive dashboard and helper
functions to explore **Healthcare-Associated Infection (HAI)** data from
German PPS 2011.

This package was developed as part of **ETC5523: Communicating with
Data** Assignment 4  
at Monash University by *Qiuyuan Chen (31112994)*.

## Overview

`haiDash` allows users to: - Summarise and visualise infection types and
proportions - Explore data interactively using a Shiny dashboard -
Demonstrate R package documentation and pkgdown site publishing

The dataset used (`hai_clean`) is derived from the **BHAI** package and
includes counts and infection types collected in hospital settings.

------------------------------------------------------------------------

## Installation

You can install the development version of `haiDash` from GitHub:

``` r
# install.packages("pak")
pak::pak("ETC5523-2025/assignment-4-packages-and-shiny-apps-Qiuyuan0055/haiDash")
```

# haiDash

<!-- badges: start -->

<!-- badges: end -->

The goal of haiDash is to …

## Installation

You can install the development version of haiDash from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("ETC5523-2025/assignment-4-packages-and-shiny-apps-Qiuyuan0055")
```

Then load the package:

``` r
library(haiDash)
```

# Data

``` r
data("hai_clean")
head(hai_clean)
#> # A tibble: 5 × 3
#>   infection cases country
#>   <chr>     <int> <chr>  
#> 1 HAP          88 Germany
#> 2 SSI         111 Germany
#> 3 BSI          23 Germany
#> 4 UTI         155 Germany
#> 5 CDI          37 Germany
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(haiDash)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.

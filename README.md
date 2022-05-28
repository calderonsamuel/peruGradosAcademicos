
<!-- README.md is generated from README.Rmd. Please edit that file -->

# peruGradosAcademicos

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/peruGradosAcademicos)](https://CRAN.R-project.org/package=peruGradosAcademicos)
<!-- badges: end -->

The goal of peruGradosAcademicos is to have an easy way to access degree
information from SUNEDU Perú.

## Installation

You can install the development version of peruGradosAcademicos like so:

``` r
remotes::install_github("calderonsamuel/peruGradosAcademicos")
```

## Example

These are basic examples which shows you how to solve common problems:

You want to know the degrees obtained by a particular person:

``` r
library(peruGradosAcademicos)

get_constancia(n_dni = "08192557") |> # this gets JSON
    parse_constancia() |> # this parses JSON into clean data.frame
    subset(select = c(NOMBRE, GRADO))
#>                          NOMBRE                                   GRADO
#> 1 ZEGARRA ROJAS, OSWALDO DELFIN               <b>Bachiller en Medicina 
#> 2 ZEGARRA ROJAS, OSWALDO DELFIN                     <b>MEDICO CIRUJANO 
#> 3 ZEGARRA ROJAS, OSWALDO DELFIN <b>ESPECIALISTA EN MEDICINA PEDIATRICA 
#> 4 ZEGARRA ROJAS, OSWALDO DELFIN                  <b>Doctor en Medicina
```

You can also do this by specifying the full name of the person (DNI is
faster, tho):

``` r
get_constancia(nombre = "ZEGARRA ROJAS OSWALDO DELFIN") |> 
    parse_constancia() |> 
    subset(select = c(NOMBRE, GRADO))
#>                          NOMBRE                                   GRADO
#> 1 ZEGARRA ROJAS, OSWALDO DELFIN               <b>Bachiller en Medicina 
#> 2 ZEGARRA ROJAS, OSWALDO DELFIN                     <b>MEDICO CIRUJANO 
#> 3 ZEGARRA ROJAS, OSWALDO DELFIN <b>ESPECIALISTA EN MEDICINA PEDIATRICA 
#> 4 ZEGARRA ROJAS, OSWALDO DELFIN                  <b>Doctor en Medicina
```

You can also get the highest degree of the specified person’s DNI in a
single line (without degree metadata):

``` r
get_mayor_grado_from_dni(n_dni = "08192557")
#> [1] "Doctor"
```

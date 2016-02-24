tidytime
========

Functions for tidying time series objects.

Install
-------

    > devtools::install_github('jayhesselberth/tidytime')

Usage
-----

### load

``` r
library(tidytime)
```

### time series (`ts`) objects

``` r
sample.ts <- ts(1:10, frequency = 4, start = c(1959, 2))
tidytime(sample.ts)
#> Source: local data frame [10 x 3]
#> 
#>      index series value
#>      (dbl)  (chr) (int)
#> 1  1959.25      x     1
#> 2  1959.50      x     2
#> 3  1959.75      x     3
#> 4  1960.00      x     4
#> 5  1960.25      x     5
#> 6  1960.50      x     6
#> 7  1960.75      x     7
#> 8  1961.00      x     8
#> 9  1961.25      x     9
#> 10 1961.50      x    10
```

### `xts` objects

``` r
library(xts)
#> Loading required package: zoo
#> 
#> Attaching package: 'zoo'
#> The following objects are masked from 'package:base':
#> 
#>     as.Date, as.Date.numeric
data(sample_matrix)
sample.xts <- as.xts(sample_matrix, descr='my new xts object')
tidytime(sample.xts)
#> Source: local data frame [720 x 3]
#> 
#>         index series    value
#>        (time)  (chr)    (dbl)
#> 1  2007-01-02   Open 50.03978
#> 2  2007-01-03   Open 50.23050
#> 3  2007-01-04   Open 50.42096
#> 4  2007-01-05   Open 50.37347
#> 5  2007-01-06   Open 50.24433
#> 6  2007-01-07   Open 50.13211
#> 7  2007-01-08   Open 50.03555
#> 8  2007-01-09   Open 49.99489
#> 9  2007-01-10   Open 49.91228
#> 10 2007-01-11   Open 49.88529
#> ..        ...    ...      ...
```

### `zoo` objects

``` r
library(zoo)
x.Date <- as.Date("2003-02-01") + c(1, 3, 7, 9, 14) - 1
x <- zoo(rnorm(5), x.Date)
tidytime(x)
#> Source: local data frame [5 x 3]
#> 
#>        index series      value
#>       (date)  (chr)      (dbl)
#> 1 2003-02-01      x -0.8231236
#> 2 2003-02-03      x -0.8535224
#> 3 2003-02-07      x -0.2895839
#> 4 2003-02-09      x -1.5311656
#> 5 2003-02-14      x  0.8370543
```

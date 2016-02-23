#' Tidy multiple time series objects.
#'
#' This function is an S3 generic.
#'
#' @param x time series object to tidy
#' @param ... extra arguments
#'
#' @return \code{tidytime} returns a \code{data_frame} with one row for each
#'   observation in each series, with the following columns:
#'
#'   \item{index}{Index (usually date)} \item{series}{Name of the series}
#'   \item{value}{Value of the observation}
#'
#' @export
tidytime <- function(x, ...) { UseMethod("tidytime") }

#' Tidier for zoo object
#'
#' @inheritParams tidytime
#'
#' @examples
#' x.Date <- as.Date("2003-02-01") + c(1, 3, 7, 9, 14) - 1
#' x <- zoo(rnorm(5), x.Date)
#' tidytime(x)
#'
#' @export
tidytime.zoo <- function(x, ...) {
  ret <- dplyr::data_frame(as.matrix(x), index = zoo::index(x))
  ret <- tidyr::gather(ret, series, value, -index)
  ret
}

#' Tidier for time series object
#'
#' @inheritParams tidytime
#'
#' @examples
#'
#' @export
tidytime.ts <- function(x, ...) {
  ret <- data.frame(as.matrix(x), index = zoo::index(x))
  ret <- tidyr::gather(ret, series, value, -index)
  ret
}

#' Tidier for xts object
#'
#' @inheritParams tidytime
#'
#' @return data_frame
#'
#' @examples
#' if (require(xts)) {
#'   data(sample_matrix)
#'   sample.xts <- as.xts(sample_matrix)
#'   tidy(sample.xts)
#' }
#'
#' @export
tidytime.xts <- function(x, ...) {}

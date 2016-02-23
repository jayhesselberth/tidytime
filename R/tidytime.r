#' tidytime: tidying functions for time series data
#'
#' tidytime provides functions for tidying time series data.
#' \code{tidytime} supports major time series formats including:
#' \itemize{
#'  \item builtin time.series (ts)
#'  \item zoo
#'  \item xts
#'  }
#'
#' @docType package
#' @name tidytime
#'
#' @seealso \url{https://cran.r-project.org/web/packages/zoo/index.html}
#' @seealso \url{https://cran.r-project.org/web/packages/xts/index.html}
#'
NULL

#' Tidy time series objects.
#'
#' This function is an S3 generic.
#'
#' @param x time series object to tidy
#' @param ... extra arguments
#'
#' @return \code{tidytime} returns a \code{data_frame} with one row for each
#'   observation in each series, with the following columns:
#'
#'   \item{index}{Index (usually date)}
#'   \item{series}{Name of the series}
#'   \item{value}{Value of the observation}
#'
#' @export
tidytime <- function(x, ...) { UseMethod("tidytime") }

#' Tidier for NULL object
#'
#' @param x time series object to tidy
#' @param ... extra arguments
#'
#' @export
tidytime.NULL <- function(x, ...) {
  dplyr::data_frame()
}

#' Default tidytime method
#'
#' @param x time series object to tidy
#' @param ... extra arguments
#'
#' @export
tidytime.default <- function(x, ...) {
  warning(paste("No method for tidying an S3 object of class",
                class(x), ", using as.data.frame"))
  dplyr::as_data_frame(x)

}

#' Tidier for zoo object
#'
#' @param x time series object to tidy
#' @param ... extra arguments
#'
#' @return data_frame
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
#' @param x time series object to tidy
#' @param ... extra arguments
#'
#' @return data_frame
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
#' @param x time series object to tidy
#' @param ... extra arguments
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
tidytime.xts <- tidytime.zoo

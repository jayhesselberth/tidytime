library(xts)
library(zoo)

# sample data
sample.ts <- ts(1:10, frequency = 4, start = c(1959, 2))
data(sample_matrix)
sample.xts <- as.xts(sample_matrix)
sample.zoo <- zoo(rnorm(5),
                  as.Date("2003-02-01") + c(1, 3, 7, 9, 14) - 1)

context('dispatch of S3 generics')

test_that('tidytime.ts dispatch', {
  expect_equal(nrow(tidytime(sample.ts)), 10)
  expect_equal(ncol(tidytime(sample.ts)), 3)
})

test_that('tidytime.zoo dispatch', {
  expect_equal(nrow(tidytime(sample.zoo)), 5)
  expect_equal(ncol(tidytime(sample.ts)), 3)
})

test_that('tidytime.xts dispatch', {
  expect_equal(nrow(tidytime(sample.xts)), 720)
  expect_equal(ncol(tidytime(sample.xts)), 3)
})


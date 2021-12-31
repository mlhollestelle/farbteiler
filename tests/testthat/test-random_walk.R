segments = 4
walk = generate_walk(n_segments = segments)

test_that("generate_walk() works", {
  expect_equal(dim(walk), c(segments, 5))
})

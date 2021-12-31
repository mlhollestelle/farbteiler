steps = 4
walk = generate_steps(steps)

test_that("generate_steps() works", {
  expect_equal(dim(walk), c(steps, 3))
})

test_that("random_walk_coords() works", {
  points = random_walk_coords(walk)
  expect_equal(dim(points), c(steps + 1, 2))
})

points = data.frame(
  x = c(0, 1, 1, 2),
  y = c(0, 0, 1, 1)
)

points_cabinet = cabinet_projection(points)

# Bit shitty test for now but OK
test_that("transformation_works", {
  expect_equal(round(points_cabinet[1, 1]), 0)
  expect_equal(round(points_cabinet[2, 1]), 1)
  expect_equal(points_cabinet$x[4] - points_cabinet$x[3], 1)
})

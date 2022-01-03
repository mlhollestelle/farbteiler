#' Generate a background pattern.
#'
#' @param res resolution of the pattern.
#'
#' @return a data frame of points.
#' @export
generate_background_pattern = function(res = 0.05) {
  pattern = expand.grid(x = seq(-10, 10, res),
                        y = seq(-10, 10, res))
  return(pattern)
}

#' Generate a background pattern.
#'
#' @param res resolution of the pattern.
#' @param walk a walk.
#' @param border spacing around walk.
#'
#' @return a data frame of points.
#' @export
generate_background_pattern = function(walk, res = 0.05, border = 4) {
  bbox = get_bbox(walk)
  x = seq(bbox$x[1] - border, bbox$x[2] + border, by = res)
  y = seq(bbox$y[1] - border, bbox$y[2] + border, by = res)
  pattern = expand.grid(x = x, y = y)
  return(pattern)
}

#' Get bounding box of an object.
#'
#' @param df a data frame with an x and y column.
#'
#' @return a data frame.
#' @export
get_bbox = function(df) {
  bbox = data.frame(
    x = range(walk$x),
    y = range(walk$y)
  )
  return(bbox)
}

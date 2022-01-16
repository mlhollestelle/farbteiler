#' Generate a background pattern.
#'
#' @param res resolution of the pattern.
#' @param walk a walk.
#' @param border spacing around walk.
#' @param ratio aspect ratio
#'
#' @return a data frame of points.
#' @export
generate_background_pattern = function(walk, res = 0.05, border = 1, ratio = 3/2) {
  if (ratio < 1) {
    ratio = 1/ratio
  }
  bbox = get_bbox(walk, border = border)
  # Change extends to fit ratio
  edge_length = c(
    x = abs(diff(bbox$x)),
    y = abs(diff(bbox$y))
  )
  long_edge = which.max(edge_length)
  short_edge = which.min(edge_length)
  # Extend short edge if needed
  edge_length_old = edge_length
  extend_short_edge = edge_length[long_edge] > ratio * edge_length[short_edge]
  if (extend_short_edge) {
    edge_length[short_edge] = edge_length[long_edge]/ratio
  } else {
    # Extend long edge if needed
    edge_length[long_edge] = edge_length[short_edge] * ratio
  }
  extend_x = (edge_length["x"] - edge_length_old["x"])/2
  extend_y = (edge_length["y"] - edge_length_old["y"])/2
  x = seq(bbox$x[1] - extend_x, bbox$x[2] + extend_x, by = res)
  y = seq(bbox$y[1] - extend_y, bbox$y[2] + extend_y, by = res)
  pattern = expand.grid(x = x, y = y)
  return(pattern)
}

#' Get bounding box of an object.
#'
#' @param df a data frame with an x and y column.
#' @param border border around the bounding box.
#'
#' @return a data frame.
#' @export
get_bbox = function(df, border) {
  bbox = data.frame(
    x = c((min(df$x) - border),(max(df$x) + border)),
    y = c((min(df$y) - border),(max(df$y) + border))
  )
  return(bbox)
}

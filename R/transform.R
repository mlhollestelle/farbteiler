cabinet_projection = function(points, alpha = 63.4) {
  cabinet_points = data.frame(
    x = points$x + 0.5 * points$y * cos(alpha),
    y = points$y + 0.5 * points$y * sin(alpha))
  return(cabinet_points)
}

#' Build a farbteiler graph
#'
#' @return a plot
#' @export
farbteiler = function() {
  n_segments = sample(3:19, 1)
  levels = sample(1:6, 1)
  spacing = sample(c(0, 0.2, 0.5, 1), 1)
  walk = generate_walk(n_segments)
  walk = .cabinet_projection(walk, alpha)
  walk = .extrude_walk(walk, z = z, levels = levels, spacing = spacing)
  walk = .identify_depth(walk)
  plot = plot_random_walk(walk = walk)
  return(plot)
}

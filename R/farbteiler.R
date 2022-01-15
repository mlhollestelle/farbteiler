#' Build a farbteiler graph
#'
#' @return a plot
#' @export
farbteiler = function() {
  n_segments = sample(3:19, 1)
  levels = sample(1:6, 1)
  spacing = sample(c(0, 0.2, 0.5, 1), 1)
  walk = generate_walk(n_segments)
  plot = plot_random_walk(walk = walk, levels = levels, spacing = spacing)
  return(plot)
}

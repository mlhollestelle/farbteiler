#' Build a farbteiler graph
#'
#' @return a plot
#' @export
farbteiler = function() {
  n_segments = sample(5:19, 1)
  levels = sample(1:6, 1)
  spacing = sample(c(0, 0.2, 0.5, 1), 1)
  z = sample(c(0.5, 1, 2), 1)
  walk = generate_walk(n_segments)
  walk = .cabinet_projection(walk, alpha = 63.4)
  walk = .extrude_walk(walk, z = z, levels = levels, spacing = spacing)
  walk = .identify_depth(walk)
  # Generate background pattern:
  plot_colors = get_colors()
  n_colors = length(plot_colors)
  # Generate pattern:
  pattern = generate_background_pattern(walk)
  pattern$color = (sample(plot_colors, nrow(pattern), replace = TRUE))
  # Generate plot
  plot = plot_random_walk(walk = walk, pattern = pattern, plot_colors = plot_colors)
  return(plot)
}

#' Identify depth for plotting purposes.
#'
#' @param walk an extruded random walk.
#'
#' @return a data frame.
#' @export
.identify_depth = function(walk) {
  y_levels = sort(unique(walk$y))
  depth_levels = data.frame(
    depth = seq_len(length(y_levels)),
    y = y_levels
  )
  depth = plyr::ddply(walk, "group", function(element) {
    # Only consider bottom part of the element
    # this coincides with the first two items.
    element = merge(element[1:2, ], depth_levels)
    depth = mean(element$depth)
    return(data.frame(depth = depth))
  })
  walk = merge(walk, depth)
  walk = walk[with(walk, order(level, group, order)), ]
  return(walk)
}

.cabinet_projection = function(walk, alpha = 45) {
  walk$x = walk$x + 0.5 * walk$y * cos(alpha)
  walk$y = 0.5 * walk$y
  return(walk)
}

#' Extrude a random walk.
#'
#' @param walk a random walk.
#' @param z extrusion value.
#' @param levels number of levels of the walk.
#' @param spacing spacing between levels of the walk.
#'
#' @return a data frame.
#' @export
.extrude_walk = function(walk, z = 1, levels = 3, spacing = 0.2) {
  # Extrude walk
  rep_rows = c(1, rep(seq_len(nrow(walk)-1)[-1], each = 2), nrow(walk))
  walk_grouped = walk[rep_rows, c("x", "y")]
  walk_grouped$group = rep(seq_len(nrow(walk_grouped)/2), each = 2)
  z = 1
  walk_extruded = plyr::ddply(walk_grouped,
                              .variables = "group",
                              function(element) {
    element_extruded = element
    element_extruded$y = element_extruded$y + z
    polygon = rbind(
      element[],
      element_extruded[rev(seq_len(nrow(element_extruded))), ]
    )
    return(polygon)
  })
  walk_extruded$level = 1
  # Repeat
  if (levels == 1) {
    return(walk_extruded)
  }
  for (level in 2:levels) {
    walk_elevated = walk_extruded[walk_extruded$level == (level - 1), ]
    walk_elevated$level = level
    walk_elevated$y = walk_elevated$y + z + spacing
    walk_extruded = rbind(walk_extruded, walk_elevated)
  }
  return(walk_extruded)
}

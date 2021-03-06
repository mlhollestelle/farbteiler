#' Get a data frame of directions.
#'
#' @return a data frame with directions.
#' @export
get_directions = function() {
  directions = data.frame(
    direction = c("N", "E", "S", "W"),
    dx = c(0, 1, 0, -1),
    dy = c(1, 0, -1, 0)
    )
  return(directions)
}

#' Generate random steps into four wind directions.
#'
#' @param n_segments number of steps in the walk.
#'
#' @importFrom utils tail
#' @return a data frame.
#' @export
generate_walk = function(n_segments) {
  if (n_segments > 20 | n_segments == 0) {
    stop("n_segments must be between 1 and 20.")
  }
  directions = get_directions()
  steps = data.frame(
    direction = NA,
    dx = 0,
    dy = 0,
    x = 0,
    y = 0
  )
  # First step
  first_step = directions[sample(nrow(directions), 1), ]
  first_step$x = steps$x + first_step$dx
  first_step$y = steps$y + first_step$dy
  steps = rbind(steps, first_step)
  if (n_segments == 1) {
    return(steps)
  }
  # Next steps
  # Explore which possible next steps when self-avoidance must be ensured
  i = 2
  while (i < n_segments) {
    last_x = tail(steps$x, n = 1)
    last_y = tail(steps$y, n = 1)
    candidates = data.frame(
      x = last_x + directions$dx,
      y = last_y + directions$dy
    )
    collide = with(candidates, paste(x, y)) %in% with(steps, paste(x, y))
    candidates = directions[which(!collide), ]
    if (nrow(candidates) == 0) {
      return(steps)
    }
    next_step = candidates[sample(nrow(candidates), 1), ]
    next_step$x = last_x + next_step$dx
    next_step$y = last_y + next_step$dy
    steps = rbind(steps, next_step)
    i = i + 1
  }
  return(steps)
}

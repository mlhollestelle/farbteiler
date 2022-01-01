.cabinet_projection = function(walk, alpha = 45) {
  walk$x = walk$x + 0.5 * walk$y * cos(alpha)
  walk$y = 0.5 * walk$y
  return(walk)
}

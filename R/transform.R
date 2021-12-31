.cabinet_projection = function(walk, alpha = 63.4) {
  walk$x = walk$x + 0.5 * walk$y * cos(alpha)
  walk$y = walk$y + 0.5 * walk$y * sin(alpha)
  return(walk)
}

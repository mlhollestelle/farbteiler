#' Get farbkreis colours.
#'
#' @return a vector.
#' @export
farbkreis = function() {
  c(
    "yellow" = "#ffed00",
    "yellow-orange" = "#fdc300",
    "orange" = "#f39200",
    "orange-red" = "#ea5b0c",
    "red" = "#e30613",
    "red-purple" = "#952456",
    "purple" = "#312783",
    "purple-blue" = "#004899",
    "blue" = "#0069b4",
    "blue-green" = "#009a93",
    "green" = "#009640",
    "green-yellow" = "#95c11f"

  )
}

#' Get a random number of farbkreis colours.
#'
#' @return a vector.
#' @export
get_colors = function() {
  n_colors = sample(seq_len(length(farbkreis())), 1)
  return(sample(farbkreis(), n_colors))
}

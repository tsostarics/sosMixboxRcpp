#' Create pigment-blended color ramp
#'
#' Uses the mixbox library to create a color ramp/gradient
#'
#' @param colors Character vector of colors
#' @param values Optional, values between 0,1 if not equally spaced
#'
#' @return A function that takes a numeric value and returns a blended color
#' @export
#' @useDynLib mixboxRcpp
pigmentRamp <- function(colors, values = NULL) {
  if (is.null(values)) {
    values <- seq(0, 1, length.out = length(colors))
  } else if (length(values) != length(colors)){
    stop("length of values must equal length of colors")
  }
  
  function(x) {
    vapply(x, \(xx) {
      if(is.na(xx)) return(NA_character_)
      cparam <- get_colors_to_mix(xx, values)
      if (is.na(cparam[1]))
        return(NA_character_)
      
      blend_colors(colors[cparam[1]], colors[cparam[2]], cparam[3])
    }, 'char')
  }
}


#' Create a discrete color palette
#'
#' Create a palette of size n based on blending colors
#'
#' @param n Number of colors to return
#' @param colors Colors to use
#' @param values Optional numeric vector between 0 and 1 if values should not
#' be equally spaced
#'
#' @return A character vector of color hex strings
#' @export
blend_palette <- function(n, colors, values = NULL) {
  stopifnot(is.null(values) || typeof(values) %in% c('double', 'integer'))
  f <- pigmentRamp(colors, values)
  
  f(seq(0,1,length.out = n))
}
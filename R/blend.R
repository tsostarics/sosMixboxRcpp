#' Blend two colors with mixbox
#' 
#' Uses mixbox to blend two colors together
#'
#' @param x Color 1
#' @param y Color 2
#' @param mixratio Mix ratio, can be any float but is typically between 0 and 1.
#' Defaults to .5.
#'
#' @return A blended RGB color
#' @export
#' @importFrom grDevices col2rgb rgb
#' @importFrom Rcpp evalCpp
blend_colors <- function(x,y, mixratio = .5) {
  rgb1 <- col2rgb(x)
  rgb2 <- col2rgb(y)
  
  res <- 
    mixbox_blend(rgb1[1,1], rgb1[2,1], rgb1[3,1],
                 rgb2[1,1], rgb2[2,1], rgb2[3,1],
                 mixratio) / 255
  rgb(res[1], res[2], res[3])
}
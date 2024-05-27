#' Arbitrary color gradient
#' 
#' use mixbox to create a gradient of arbitrary values
#' 
#' @inheritParams ggplot2::scale_fill_gradientn
#' @param space Not used
#' @param colours Character vector of colors
#' @param colors character vector of colors
#'
#' @export
scale_color_mixboxn <- function (name = ggplot2::waiver(), ..., colours, values = NULL, space = "Lab", 
                                 na.value = "grey50", guide = "colourbar", aesthetics = "colour", 
                                 colors) 
{
  colours <- if (missing(colours)) 
    colors
  else colours

  ggplot2::continuous_scale(aesthetics, name = name, palette = pigmentRamp(colours, values), na.value = na.value, guide = guide, 
                   ...)
}

#' Arbitrary color gradient
#' 
#' use mixbox to create a 2 color gradient
#' 
#' @inheritParams ggplot2::scale_color_gradient
#' @param space Not used
#' @param colors character vector of colors
#' @export
scale_color_mixbox <- function (name = ggplot2::waiver(), ..., low="#132B43", high="#56B1F7", values = NULL, space = "Lab", 
                                 na.value = "grey50", guide = "colourbar", aesthetics = "color", 
                                 colors) 
{
  ggplot2::continuous_scale(aesthetics, name = name, palette = pigmentRamp(c(low, high), values), na.value = na.value, guide = guide, 
                   ...)
}

#' 2-color gradient with pigment blending
#' 
#' Uses mixbox to create a 2-color gradient with pigment blending
#' 
#' @inheritParams ggplot2::scale_fill_gradient
#' @param space Not used
#' @param colors Character vector of colors
#'
#' @export
scale_fill_mixbox <- function (name = ggplot2::waiver(), ..., low="#132B43", high="#56B1F7", values = NULL, space = "Lab", 
                                na.value = "grey50", guide = "colourbar", aesthetics = "fill", 
                                colors) 
{
  ggplot2::continuous_scale(aesthetics, name = name, palette = pigmentRamp(c(low, high), values), na.value = na.value, guide = guide, 
                   ...)
}

#' Arbitrary gradient with pigment blending
#' 
#' Uses mixbox to create a gradient with an arbitrary number of values
#' 
#' @inheritParams ggplot2::scale_fill_gradientn
#' @param space Not used
#' @param colors Character vector of colors
#' @param colours Character vector of colors
#'
#' @export
scale_fill_mixboxn <- function (name = ggplot2::waiver(), ..., colours, values = NULL, space = "Lab", 
          na.value = "grey50", guide = "colourbar", aesthetics = "fill", 
          colors) 
{
  colours <- if (missing(colours)) 
    colors
  else colours
  
  ggplot2::continuous_scale(aesthetics, name = name, palette =  pigmentRamp(colours, values), na.value = na.value, guide = guide, 
                   ...)
}





irgb <- function(r, g, b) {
  rgb(r/255, g/255, b/255)
}

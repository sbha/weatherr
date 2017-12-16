#' weatherr
#'
#' This function gives the current and four day weather forecast using the Weather Underground API
#' @param wu_all
#' @keywords weather, forecast
#' @export
#' @examples
#' wu_all()

# combine output from other functions

wu_all <- function(){
  # use
  wu_current()
  wu_4day()
  }


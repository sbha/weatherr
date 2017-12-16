#' weatherr
#'
#' This function gives the current and four day weather forecast using the Weather Underground API
#' @param wu_all
#' @keywords weather, forecast
#' @export
#' @examples
#' wu_all()

# combine output from other WU functions

wu_all <- function(city='Minneapolis', state='MN'){
  wu_current(city, state)
  wu_4day(city, state)
  }


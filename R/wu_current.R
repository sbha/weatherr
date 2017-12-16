#' weatherr
#'
#' This function gives the current weather forecast using the Weather Underground API
#' @param wu_current
#' @keywords weather, forecast
#' @export
#' @examples
#' wu_current()

wu_current <- function(city='Minneapolis', state='MN'){
  suppressMessages(library(RCurl))
  suppressMessages(library(jsonlite))
  # https://www.wunderground.com/weather/api/d/docs
  #wu_url <- 'http://api.wunderground.com/api/71dfcded4bf545e8/conditions/q/MN/Minneapolis.json'
  wu_api <- Sys.getenv('WU_API')
  #wu_url_current <- paste0('http://api.wunderground.com/api/', wu_api, '/conditions/q/MN/Minneapolis.json')
  wu_url_current <- paste0('http://api.wunderground.com/api/', wu_api, '/conditions/q/',state,'/',city,'.json')
  resp_current <- getURL(wu_url_current)

  # \r\n
  print(paste('Current conditions for:', city, state, Sys.time()))
  cat(paste(
    'current temp:\t\t', fromJSON(resp_current)$current_observation$temp_f,
    '\r\nfeels like:\t\t', fromJSON(resp_current)$current_observation$feelslike_f,
    '\r\ncurrent humidity:\t', fromJSON(resp_current)$current_observation$relative_humidity,
    '\r\ncurrent wind speed:\t', fromJSON(resp_current)$current_observation$wind_string,
    #'\r\ncurrent wind direction:\t', fromJSON(resp_current)$current_observation$wind_string,
    '\r\ncurrent weather:\t', fromJSON(resp_current)$current_observation$weather, '\r\n'))
  }


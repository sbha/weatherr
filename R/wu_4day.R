#' weatherr
#'
#' This function gives the four day weather forecast using the Weather Underground API
#' @param wu_4day
#' @keywords weather, forecast
#' @export
#' @examples
#' wu_4day()

# https://www.wunderground.com/weather/api/d/docs

wu_4day <- function(city='Minneapolis', state='MN'){
  suppressMessages(library(RCurl))
  suppressMessages(library(jsonlite))

  wu_api <- Sys.getenv('WU_API')
  #wu_url_forecast <- paste0('http://api.wunderground.com/api/', Sys.getenv('WU_API'), '/forecast/q/MN/Minneapolis.json')
  wu_url_forecast <- paste0('http://api.wunderground.com/api/', wu_api, '/forecast/q/',state,'/',city,'.json')
  resp_forecast <- getURL(wu_url_forecast)
  df_forecast <- fromJSON(resp_forecast)$forecast$txt_forecast$forecastday
  df_forecast <- df_forecast[c('title', 'fcttext')]
  df_forecast$title[1] <- 'Today'
  df_forecast$title[2] <- 'Tonight'
  df_forecast$title[3] <- 'Tomorrow'
  df_forecast$title[4] <- 'Tomorrow night'

  #return(df_forecast)
  names(df_forecast) <- NULL
  print(paste('Four day forecast for:', city, state))
  print(df_forecast, row.names = FALSE)

  }

# df_forecast %>%
#   select(title, fcttext)



# http://stackabuse.com/using-machine-learning-to-predict-the-weather-part-1/

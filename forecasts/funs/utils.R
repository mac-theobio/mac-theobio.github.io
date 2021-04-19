## UTILITY FUNCTIONS
library(dplyr)

## helper to get forecast date
get_forecast_date <- function(df){

  out <- (df %>% filter(!is.na(obs))
          %>% filter(date == max(date))
          %>% pull(date)
          %>% unique(.))

  return(out)
}

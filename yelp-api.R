#https://www.yelp.com/developers/documentation/v3/business_search
yelp_business_search <- function(term = NULL, location = NULL, 
                                 categories = NULL, radius = NULL, 
                                 limit = 150) {
  yelp <- "https://api.yelp.com"
  url <- modify_url(yelp, path = c("v3", "businesses", "search"),
                    query = list(term = term, location = location, limit = limit, 
                                 radius = radius, categories = categories))
  res <- GET(url, add_headers('Authorization' = paste("bearer", "B_U4GwmwEe9VBKkDDzTb9Y73yCpkVLAn5LsYzXH3T7spZYbo6EsJOk_wRd6a3ra63TWN--kq3jTJ2pEgmmnQjDtl90li7HX6WNMuxJMhMiU2YlZDMMqhK-zzZD7TYnYx")))
  print("This is Manhattan")
  results <- content(res)
  yelp_httr_parse <- function(x) {
    
    parse_list <- list(id = x$id, 
                       name = x$name, 
                       rating = x$rating, 
                       review_count = x$review_count, 
                       lat = x$coordinates$latitude, 
                       long = x$coordinates$longitude, 
                       address1 = x$location$address1, 
                       city = x$location$city, 
                       state = x$location$state, 
                       zip_code = x$location$zip_code)
    
    
    
    parse_list <- lapply(parse_list, FUN = function(x) ifelse(is.null(x), "", x))
    df <- data_frame(id=parse_list$id,
                     name=parse_list$name, 
                     rating = parse_list$rating, 
                     review_count = parse_list$review_count, 
                     lat=parse_list$latitude, 
                     long = parse_list$longitude, 
                     address1 = parse_list$address1, 
                     city = parse_list$city, 
                     state = parse_list$state, 
                     zip_code = parse_list$zip_code)
    df
  }
  
  
  results_list <- lapply(results$businesses, FUN = yelp_httr_parse)

}

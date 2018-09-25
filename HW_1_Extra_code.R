##Sanity Check for Part F
taxi_data %>% 
  filter(hack_license == 2013007606) %>%
  select(hack_license, pickup_datetime, passenger_count) %>%
  as.data.frame() 
x %>%
  filter(hack_license == 2013007606)


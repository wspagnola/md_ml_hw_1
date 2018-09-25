##Sanity Check for Part F
taxi_data %>% 
  filter(hack_license == 2013007606) %>%
  select(hack_license, pickup_datetime, passenger_count) %>%
  as.data.frame() 
x %>%
  filter(hack_license == 2013007606)



#Check To See if Any Tims are Greater than One Hour
final_summary %>% 
  filter(total_time_with_passengers > as.duration(0)) %>%
  mutate(avg_speed =  miles_with_passengers / as.numeric(total_time_with_passengers, unit="hours")) %>%
  filter(avg_speed > 60)

final_summary %>%
  group_by(hack_license) %>%
  summarize(entries = n())

final_summary[final_summary$hack_license==2013000001, ]

check_license  <- sample(taxi_data$hack_license, 1) 
final_summary[final_summary$hack_license == check_license , ]
#Print in Console
taxi_data[taxi_data$hack_license == check_license  ,] %>% select(pickup_datetime, dropoff_datetime, avg_speed) %>% as.data.frame()

#Check To See if Any Tims are Greater than One Hour
final_summary %>% 
  filter(total_time_with_passengers > as.duration(3600))


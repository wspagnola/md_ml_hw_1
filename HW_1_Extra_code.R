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


taxi_data %>%
  mutate(shift =  case_when(
    hour(pickup_datetime) >= 4 &   hour(pickup_datetime) < 12 ~ "morning",
    hour(pickup_datetime) >= 12 & hour(pickup_datetime) < 21 ~ "afternoon",
    hour(pickup_datetime) >= 21 | hour(pickup_datetime) < 4 ~ "night")) %>%
  group_by(shift) %>% 
  summarize(mean_tip = mean(tip_amount), mean_mile = mean(trip_distance),
            mean_tip_per_mile = mean_tip / mean_mile)

##Summarize Mean Tip 
taxi_data %>%
  mutate(shift =  case_when(
    hour(pickup_datetime) >= 4 &   hour(pickup_datetime) < 12 ~ "morning",
    hour(pickup_datetime) >= 12 & hour(pickup_datetime) < 21 ~ "afternoon",
    hour(pickup_datetime) >= 21 | hour(pickup_datetime) < 4 ~ "night")) %>%
  group_by(shift) %>% filter(tip_amount > 0) %>%
  summarize(mean_tip = mean(tip_amount), mean_mile = mean(trip_distance),
            mean_tip_per_mile = mean_tip / mean_mile)


taxi_data %>%
  mutate(hour = hour(pickup_datetime)) %>%
  group_by(as.factor(hack_license)) %>%  
  summarize(avg_passenger = mean(passenger_count),
            total_earnings = sum(tip_amount)) %>%
  ggplot()+
  geom_smooth(aes(x=avg_passenger, y=total_earnings))


taxi_data %>%
  mutate(hour = hour(pickup_datetime)) %>%
  ggplot()+
  geom_point(aes(x=passenger_count, y=tip_amount))

names(taxi_data)

taxi_data %>%
  mutate(tipped= case_when(
    tip_amount == 0 ~ 0,
    tip_amount > 0 ~ 1)) %>%
  group_by(tipped) %>%
  summarize(avg_distance = mean(trip_distance))

taxi_data %>%
  mutate(tipped= case_when(
    tip_amount == 0 ~ 0,
    tip_amount > 0 ~ 1)) %>%
  ggplot() +
  geom_boxplot(aes(x=as.factor(tipped), y=trip_distance))



# --- Calories and steps
ggplot(data = daily_activity, aes(x = total_steps, y = calories)) + 
  geom_point(colour = "#6BA292", alpha = 0.5, size = 3) +
  geom_smooth(method = "lm") + # Only want to see linear slope
  theme_minimal() +
  labs(x = "Steps", y = "Calories", title = "Correlation Between Steps and Calories", subtitle = "Daily", captions = "")

## Avoid id is expressed as scientific notation
daily_activity$id <- format(daily_activity$id, scientific = FALSE)

# --- Active minutes
vigorous_month <- 321.428571 # 75 min / 7 days a week * 30 days
moderate_month <- 642.857143 # 150 min / 7 days a week * 30 days

## Create data frame for very_active group and moderate_active group
very_active <- daily_activity %>% 
  group_by(id) %>% 
  summarise(value = sum(very_active_minutes))
very_active$active_lvl <- rep("very_active", length(very_active$id))
very_active$grading <- as.integer(very_active$value/vigorous_month)

moderate_active <- daily_activity %>% 
  group_by(id) %>% 
  summarise(value = sum(moderate_active_minutes))
moderate_active$active_lvl <- rep("moderate_active", length(moderate_active$id))
moderate_active$grading <- as.integer(moderate_active$value/moderate_month)

daily_active_sum_by_user <- union(very_active, moderate_active)
rm(very_active)
rm(moderate_active)

## Show the very_active minutes and moderate_active minutes of each user
ggplot(data = daily_active_sum_by_user, aes(x = id, y = value, fill = active_lvl)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_hline(yintercept = c(vigorous_month, moderate_month), color = c('#6BA292', '#DEE5DE'), linetype = "dotted", alpha = 0.8) +
  coord_flip() +
  theme_minimal() +
  scale_fill_manual('Active Level', values = c('#DEE5DE', '#6BA292')) +
  labs(x = "ID", y = "Active Minutes", title = "Total Active Minutes", subtitle = "2016-04-12 to 2016-05-12", captions = "")

# --- Add weekly message 
## Make sure the order of the results is day_labs and not alphabetical
day_labs <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday") 
sleep_day$weekday_info <- weekdays(sleep_day$activity_day)
sleep_day$weekday_info <- factor(sleep_day$weekday_info, levels = day_labs)

## Crate data frame for asleep_time and bedtime
asleep_time_weekly <- sleep_day %>% 
  group_by(weekday_info) %>% 
  summarise_at(vars(total_asleep_minutes), list(mean = mean))
asleep_time_weekly$lable <- rep("asleep", length(asleep_time_weekly$weekday_info))

bedtime_weekly <- sleep_day %>% 
  group_by(weekday_info) %>% 
  summarise_at(vars(total_bedtime_minutes), list(mean = mean))
bedtime_weekly$lable <- rep("bedtime", length(bedtime_weekly$weekday_info))

sleep_weekly <- union(asleep_time_weekly, bedtime_weekly)
rm(asleep_time_weekly)
rm(bedtime_weekly)

## Plot charts for average asleep time and bedtime by days of the week
ggplot(data = sleep_weekly, aes(x = weekday_info, y = mean, fill = lable)) +
  geom_bar(stat = "identity", width = 0.7, position = position_dodge(0.75)) +
  theme_minimal() +
  scale_fill_manual('Sleep', values = c('#6BA292','#FFDC7C')) +
  labs(x = "Weekday", y = "Average Sleep Minutes", title = "Average Sleep Minutes Weekly", subtitle = "2016-04-12 to 2016-05-12", captions = "")

# --- Add weekly message 
daily_activity$weekday_info <- weekdays(daily_activity$activity_day)
daily_activity$weekday_info <- factor(daily_activity$weekday_info, levels = day_labs) # order weekday

# Create data frame for average very_active, moderate_active, and light_active minutes
very_active_minutes_weekly <- daily_activity %>% 
  group_by(weekday_info) %>% 
  summarise_at(vars(very_active_minutes), list(active_minutes_mean = mean))
very_active_minutes_weekly$lable <- rep("very_active", length(very_active_minutes_weekly$weekday_info))

moderate_active_minutes_weekly <- daily_activity %>% 
  group_by(weekday_info) %>% 
  summarise_at(vars(moderate_active_minutes), list(active_minutes_mean = mean))
moderate_active_minutes_weekly$lable <- rep("moderate_active", length(moderate_active_minutes_weekly$weekday_info))

light_active_minutes_weekly <- daily_activity %>% 
  group_by(weekday_info) %>% 
  summarise_at(vars(light_active_minutes), list(active_minutes_mean = mean))
light_active_minutes_weekly$lable <- rep("light_active", length(light_active_minutes_weekly$weekday_info))

avg_active_minutes_weekly <- bind_rows(very_active_minutes_weekly,
                                       moderate_active_minutes_weekly, 
                                       light_active_minutes_weekly)

rm(very_active_minutes_weekly)
rm(moderate_active_minutes_weekly)
rm(light_active_minutes_weekly)

ggplot(data = avg_active_minutes_weekly, aes(x = weekday_info, y = active_minutes_mean, fill = lable)) +
  geom_bar(stat = "identity", width = 0.7, position = position_dodge(0.75)) +
  theme_minimal() +
  scale_fill_manual('Active Level', values = c('#DEE5DE','#FFDC7C', '#6BA292')) +
  labs(x = "Weekday", y = "Average Active Minutes", title = "Average Active Minutes Weekly", subtitle = "2016-04-12 to 2016-05-12", captions = "")

# --- Extract hh:mm in the attribute activity_hour
hourly_intensities$time_info <- format(hourly_intensities$activity_hour, format = "%H:%M")

avg_intensity_hour <- hourly_intensities %>% 
  group_by(time_info) %>% 
  summarise_at(vars(total_intensities), list(intensity_mean = mean))
colnames(avg_intensity_hour)[1] <- "hours"

ggplot(data = avg_intensity_hour, aes(x = hours, y = intensity_mean)) +
  geom_col(width = 0.7, fill = "#6BA292") +
  theme_minimal() +
  labs(x = "Hours", y = "Average Intensities", title = "Average Intensities Hourly", subtitle = "All users from 2016-04-12 to 2016-05-12", captions = "")

# See code in chart 2 to see how I got the number grading
active_grading <- daily_active_sum_by_user %>% 
  group_by(id) %>% 
  summarise(grading = sum(grading)) 
for (i in 1 : length(active_grading$grading)) {
  if (active_grading$grading[i] >= 3) {
    active_grading$grading[i] <- 3  
  } # Set upper bound for grading
}

group_size <- as.data.frame(table(active_grading$grading))
group_size$percentages <- percent(group_size$Freq/sum(group_size$Freq))
group_size$lable <- c("0: Deficient", "1: Passable", "2: Good", "3: Excellent")

ggplot(group_size, aes(x = "", y = Freq, fill = lable)) +
  geom_bar(stat = "identity", width = 2, color = "white") +
  coord_polar("y", start = 0) +
  theme_void() +
  geom_label(aes(label = percentages),
             position = position_stack(vjust = 0.5),
             show.legend = FALSE) +
  scale_fill_manual("Physical Activity Level", values = c("#6BA292", '#DEE5DE', '#EDEBDF', '#ecd98d' )) +
  labs(title = "Classification of Users Based on Physical Activity", subtitle = "According to very active and moderate active minutes of 33 users", captions = "")

# --- Extract hh:mm in the attribute activity_minute
minute_METs_narrow$time_info <- format(minute_METs_narrow$activity_minute, format = "%H:%M")
minute_METs_narrow$time_info <- as.POSIXct(minute_METs_narrow$time_info, format = "%H:%M")

# --- Add weekly message (necessary dataframe)
minute_METs_narrow$weekday_info <- weekdays(minute_METs_narrow$activity_minute)
minute_METs_narrow$weekday_info <- factor(minute_METs_narrow$weekday_info, levels = day_labs)

ggplot(data = minute_METs_narrow, aes(x = time_info, y = MET, group = as.Date(activity_minute))) + 
  geom_point(colour = "#6BA292", alpha = 0.1, size = 0.5) + 
  facet_grid(weekday_info ~.) +
  theme_minimal() +
  scale_x_datetime(breaks = date_breaks("2 hour"), labels = date_format("%H:%M")) +
  labs(x = "Hours", y = "MET Value (*10)", title = "MET Values in a Day", subtitle = "", captions = "")
# Make sure the scale lib has been load!!
# time_info has to be class POSIXct and has to be transformed before using ggplot

minute_METs_narrow_merge_grading <- merge(x = minute_METs_narrow, 
                                          y = active_grading[, c("id", "grading")], 
                                          by = "id", all.x = TRUE)
minute_METs_g0 <- minute_METs_narrow_merge_grading %>% 
  filter(grading == "0")
minute_METs_g1 <- minute_METs_narrow_merge_grading %>% 
  filter(grading == "1")
minute_METs_g2 <- minute_METs_narrow_merge_grading %>% 
  filter(grading == "2")
minute_METs_g3 <- minute_METs_narrow_merge_grading %>% 
  filter(grading == "3")

ggplot(data = minute_METs_g0, aes(x = time_info, y = MET, group = as.Date(activity_minute))) +
  geom_point(colour = "#6BA292", alpha = 0.1, size = 0.5) +
  facet_grid(weekday_info ~.) +
  theme_minimal() +
  scale_x_datetime(breaks = date_breaks("2 hour"), labels = date_format("%H:%M")) +
  labs(x = "Hours", y = "MET Value (*10)", title = "MET Values in a Day", subtitle = "Group 0", captions = "")

ggplot(data = minute_METs_g1, aes(x = time_info, y = MET, group = as.Date(activity_minute))) +
  geom_point(colour = "#6BA292", alpha = 0.1, size = 0.5) +
  facet_grid(weekday_info ~.) +
  theme_minimal() +
  scale_x_datetime(breaks = date_breaks("2 hour"), labels = date_format("%H:%M")) +
  labs(x = "Hours", y = "MET Value (*10)", title = "MET Values in a Day", subtitle = "Group 1", captions = "")

ggplot(data = minute_METs_g2, aes(x = time_info, y = MET, group = as.Date(activity_minute))) +
  geom_point(colour = "#6BA292", alpha = 0.1, size = 0.5) +
  facet_grid(weekday_info ~.) +
  theme_minimal() +
  scale_x_datetime(breaks = date_breaks("2 hour"), labels = date_format("%H:%M")) +
  labs(x = "Hours", y = "MET Value (*10)", title = "MET Values in a Day", subtitle = "Group 2", captions = "")

ggplot(data = minute_METs_g3, aes(x = time_info, y = MET, group = as.Date(activity_minute))) +
  geom_point(colour = "#6BA292", alpha = 0.1, size = 0.5) +
  facet_grid(weekday_info ~.) +
  theme_minimal() +
  scale_x_datetime(breaks = date_breaks("2 hour"), labels = date_format("%H:%M")) +
  labs(x = "Hours", y = "MET Value (*10)", title = "MET Values in a Day", subtitle = "Group 3", captions = "")

hourly_intensities_merge_grading <- merge(x = hourly_intensities, y = active_grading[, c("id", "grading")], by = "id", all.x = TRUE)
avg_intensity_hour_g0 <- hourly_intensities_merge_grading %>% 
  filter(grading == "0") %>%
  group_by(time_info) %>% 
  summarise_at(vars(total_intensities), list(intensity_mean = mean))
colnames(avg_intensity_hour_g0)[1] <- "hours"
ggplot(data = avg_intensity_hour_g0, aes(x = hours, y = intensity_mean)) +
  geom_col(width = 0.7, fill = "#6BA292") +
  theme_minimal() +
  labs(x = "Hours", y = "Average Intensities of Group 0", title = "Average Intensities of Group 0 Hourly", subtitle = "2016-04-12 to 2016-05-12 of users from group 0", captions = "")

avg_intensity_hour_g1 <- hourly_intensities_merge_grading %>% 
  filter(grading == "1") %>%
  group_by(time_info) %>% 
  summarise_at(vars(total_intensities), list(intensity_mean = mean))
colnames(avg_intensity_hour_g1)[1] <- "hours"
ggplot(data = avg_intensity_hour_g1, aes(x = hours, y = intensity_mean)) +
  geom_col(width = 0.7, fill = "#6BA292") +
  theme_minimal() +
  labs(x = "Hours", y = "Average Intensities of Group 1", title = "Average Intensities of Group 1 Hourly", subtitle = "2016-04-12 to 2016-05-12 of users from group 1", captions = "")

avg_intensity_hour_g2 <- hourly_intensities_merge_grading %>% 
  filter(grading == "2") %>%
  group_by(time_info) %>% 
  summarise_at(vars(total_intensities), list(intensity_mean = mean))
colnames(avg_intensity_hour_g2)[1] <- "hours"
ggplot(data = avg_intensity_hour_g2, aes(x = hours, y = intensity_mean)) +
  geom_col(width = 0.7, fill = "#6BA292") +
  theme_minimal() +
  labs(x = "Hours", y = "Average Intensities of Group 2", title = "Average Intensities of Group 2 Hourly", subtitle = "2016-04-12 to 2016-05-12 of users from group 2", captions = "")

avg_intensity_hour_g3 <- hourly_intensities_merge_grading %>% 
  filter(grading == "3") %>%
  group_by(time_info) %>% 
  summarise_at(vars(total_intensities), list(intensity_mean = mean))
colnames(avg_intensity_hour_g3)[1] <- "hours"
ggplot(data = avg_intensity_hour_g3, aes(x = hours, y = intensity_mean)) +
  geom_col(width = 0.7, fill = "#6BA292") +
  theme_minimal() +
  labs(x = "Hours", y = "Average Intensities of Group 3", title = "Average Intensities of Group 3 Hourly", subtitle = "2016-04-12 to 2016-05-12 of users from group 3", captions = "")
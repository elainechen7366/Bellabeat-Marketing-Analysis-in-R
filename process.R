# --- Check uniqueness
n_unique(daily_activity$id)
n_unique(daily_calories$id)
n_unique(daily_intensities$id)
n_unique(daily_steps$id)
n_unique(heartrate_seconds$id)
n_unique(hourly_calories$id)
n_unique(hourly_intensities$id)
n_unique(hourly_steps$id)
n_unique(minute_calories_narrow$id)
n_unique(minute_calories_wide$id)
n_unique(minute_intensities_narrow$id)
n_unique(minute_intensities_wide$id)
n_unique(minute_METs_narrow$id)
n_unique(minute_sleep$id)
n_unique(minute_steps_narrow$id)
n_unique(minute_steps_wide$id)
n_unique(sleep_day$id)
n_unique(weight_loginfo$id)

# --- Check uniqueness
n_unique(daily_activity$activity_day)
n_unique(daily_calories$activity_day)
n_unique(daily_intensities$activity_day)
n_unique(daily_steps$activity_day)
n_unique(date(heartrate_seconds$activity_second))
n_unique(date(hourly_calories$activity_hour))
n_unique(date(hourly_intensities$activity_hour))
n_unique(date(hourly_steps$activity_hour))
n_unique(date(minute_calories_narrow$activity_minute))
n_unique(date(minute_calories_wide$activity_hour))
n_unique(date(minute_intensities_narrow$activity_minute))
n_unique(date(minute_intensities_wide$activity_hour))
n_unique(date(minute_METs_narrow$activity_minute))
n_unique(date(minute_sleep$activity_minute))
n_unique(date(minute_steps_narrow$activity_minute))
n_unique(date(minute_steps_wide$activity_hour))
n_unique(date(sleep_day$activity_day))
n_unique(date(weight_loginfo$activity_day))

# --- Check missing value
print("---------------- daily_activity ----------------")
if (sum(is.na(daily_activity)) != 0) {
  print("Position of missing values:")
  which(is.na(daily_activity))
} else {
  print("No missing value")
}

print("---------------- daily_calories ----------------")
if (sum(is.na(daily_calories)) != 0) {
  print("Position of missing values:")
  which(is.na(daily_calories))
} else {
  print("No missing value")
}

print("---------------- daily_intensities ----------------")
if (sum(is.na(daily_intensities)) != 0) {
  print("Position of missing values:")
  which(is.na(daily_intensities))
} else {
  print("No missing value")
}

print("---------------- daily_steps ----------------")
if (sum(is.na(daily_steps)) != 0) {
  print("Position of missing values:")
  which(is.na(daily_steps))
} else {
  print("No missing value")
}

print("---------------- heartrate_seconds ----------------")
if (sum(is.na(heartrate_seconds)) != 0) {
  print("Position of missing values:")
  which(is.na(heartrate_seconds))
} else {
  print("No missing value")
}

print("---------------- hourly_calories ----------------")
if (sum(is.na(hourly_calories)) != 0) {
  print("Position of missing values:")
  which(is.na(hourly_calories))
} else {
  print("No missing value")
}

print("---------------- hourly_intensities ----------------")
if (sum(is.na(hourly_intensities)) != 0) {
  print("Position of missing values:")
  which(is.na(hourly_intensities))
} else {
  print("No missing value")
}

print("---------------- hourly_steps ----------------")
if (sum(is.na(hourly_steps)) != 0) {
  print("Position of missing values:")
  which(is.na(hourly_steps))
} else {
  print("No missing value")
}

print("---------------- minute_calories_narrow ----------------")
if (sum(is.na(minute_calories_narrow)) != 0) {
  print("Position of missing values:")
  which(is.na(minute_calories_narrow))
} else {
  print("No missing value")
}

print("---------------- minute_calories_wide ----------------")
if (sum(is.na(minute_calories_wide)) != 0) {
  print("Position of missing values:")
  which(is.na(minute_calories_wide))
} else {
  print("No missing value")
}

print("---------------- minute_intensities_wide ----------------")
if (sum(is.na(minute_intensities_wide)) != 0) {
  print("Position of missing values:")
  which(is.na(minute_intensities_wide))
} else {
  print("No missing value")
}

print("---------------- minute_intensities_narrow ----------------")
if (sum(is.na(minute_intensities_narrow)) != 0) {
  print("Position of missing values:")
  which(is.na(minute_intensities_narrow))
} else {
  print("No missing value")
}

print("---------------- minute_METs_narrow ----------------")
if (sum(is.na(minute_METs_narrow)) != 0) {
  print("Position of missing values:")
  which(is.na(minute_METs_narrow))
} else {
  print("No missing value")
}

print("---------------- minute_sleep ----------------")
if (sum(is.na(minute_sleep)) != 0) {
  print("Position of missing values:")
  which(is.na(minute_sleep))
} else {
  print("No missing value")
}

print("---------------- minute_steps_narrow ----------------")
if (sum(is.na(minute_steps_narrow)) != 0) {
  print("Position of missing values:")
  which(is.na(minute_steps_narrow))
} else {
  print("No missing value")
}

print("---------------- minute_steps_wide ----------------")
if (sum(is.na(minute_steps_wide)) != 0) {
  print("Position of missing values:")
  which(is.na(minute_steps_wide))
} else {
  print("No missing value")
}

print("---------------- sleep_day ----------------")
if (sum(is.na(sleep_day)) != 0) {
  print("Position of missing values:")
  which(is.na(sleep_day))
} else {
  print("No missing value")
}

print("---------------- weight_loginfo ----------------")
if (sum(is.na(weight_loginfo)) != 0) {
  print("Position of missing values:")
  which(is.na(weight_loginfo))
} else {
  print("No missing value")
}

# --- Check and remove duplicates
print("---------------- daily_activity ----------------")
if (nrow(daily_activity) == nrow(daily_activity %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  daily_activity <- daily_activity %>% distinct()
}

print("---------------- daily_calories ----------------")
if (nrow(daily_calories) == nrow(daily_calories %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  daily_calories <- daily_calories %>% distinct()
}

print("---------------- daily_intensities ----------------")
if (nrow(daily_intensities) == nrow(daily_intensities %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  daily_intensities <- daily_intensities %>% distinct()
}

print("---------------- daily_steps ----------------")
if (nrow(daily_steps) == nrow(daily_steps %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  daily_steps <- daily_steps %>% distinct()
}

print("---------------- heartrate_seconds ----------------")
if (nrow(heartrate_seconds) == nrow(heartrate_seconds %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  heartrate_seconds <- heartrate_seconds %>% distinct()
}

print("---------------- hourly_calories ----------------")
if (nrow(hourly_calories) == nrow(hourly_calories %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  hourly_calories <- hourly_calories %>% distinct()
}

print("---------------- hourly_intensities ----------------")
if (nrow(hourly_intensities) == nrow(hourly_intensities %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  hourly_intensities <- hourly_intensities %>% distinct()
}

print("---------------- hourly_steps ----------------")
if (nrow(hourly_steps) == nrow(hourly_steps %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  hourly_steps <- hourly_steps %>% distinct()
}

print("---------------- minute_calories_narrow ----------------")
if (nrow(minute_calories_narrow) == nrow(minute_calories_narrow %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  minute_calories_narrow <- minute_calories_narrow %>% distinct()
}

print("---------------- minute_calories_wide ----------------")
if (nrow(minute_calories_wide) == nrow(minute_calories_wide %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  minute_calories_wide <- minute_calories_wide %>% distinct()
}

print("---------------- minute_intensities_narrow ----------------")
if (nrow(minute_intensities_narrow) == nrow(minute_intensities_narrow %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  minute_intensities_narrow <- minute_intensities_narrow %>% distinct()
}

print("---------------- minute_intensities_wide ----------------")
if (nrow(minute_intensities_wide) == nrow(minute_intensities_wide %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  minute_intensities_wide <- minute_intensities_wide %>% distinct()
}

print("---------------- minute_METs_narrow ----------------")
if (nrow(minute_METs_narrow) == nrow(minute_METs_narrow %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  minute_METs_narrow <- minute_METs_narrow %>% distinct()
}

print("---------------- minute_sleep ----------------")
if (nrow(minute_sleep) == nrow(minute_sleep %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  minute_sleep <- minute_sleep %>% distinct()
}

print("---------------- minute_steps_narrow ----------------")
if (nrow(minute_steps_narrow) == nrow(minute_steps_narrow %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  minute_steps_narrow <- minute_steps_narrow %>% distinct()
}

print("---------------- minute_steps_wide ----------------")
if (nrow(minute_steps_wide) == nrow(minute_steps_wide %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  minute_steps_wide <- minute_steps_wide %>% distinct()
}

print("---------------- sleep_day ----------------")
if (nrow(sleep_day) == nrow(sleep_day %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  sleep_day <- sleep_day %>% distinct()
}

print("---------------- weight_loginfo ----------------")
if (nrow(weight_loginfo) == nrow(weight_loginfo %>% distinct())) {
  print("No duplicate rows")
} else {
  print("Remove duplicate rows")
  weight_loginfo <- weight_loginfo %>% distinct()
}

# --- Check if data are the same
## daily_activity vs. daily_calories
identical(daily_activity$id, daily_calories$id)
identical(daily_activity$activity_day, daily_calories$activity_day)
identical(daily_activity$calories, daily_calories$calories)
## daily_activity vs. daily_steps
identical(daily_activity$id, daily_steps$id)
identical(daily_activity$activity_day, daily_steps$activity_day)
identical(daily_activity$total_steps, daily_steps$total_steps)
## daily_activity vs. daily_intensities
identical(daily_activity$id, daily_intensities$id)
identical(daily_activity$activity_day, daily_intensities$activity_day)
identical(daily_activity$sedentary_minutes, daily_intensities$sedentary_minutes)
identical(daily_activity$light_active_minutes, daily_intensities$light_active_minutes)
identical(daily_activity$moderate_active_minutes, daily_intensities$moderate_active_minutes)
identical(daily_activity$very_active_minutes, daily_intensities$very_active_minutes)
identical(daily_activity$sedentary_active_distance, daily_intensities$sedentary_active_distance)
identical(daily_activity$light_active_distance, daily_intensities$light_active_distance)
identical(daily_activity$moderate_active_distance, daily_intensities$moderate_active_distance)
identical(daily_activity$very_active_distance, daily_intensities$very_active_distance)

identical(unique(minute_sleep$id), unique(sleep_day$id))
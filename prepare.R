# --- Install packages
install.packages("dplyr")
install.packages("readxl")
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("skimr")

# --- Load libraries
library("dplyr")
library("readxl")
library("ggplot2")
library("scales")
library("tidyverse")
library("skimr")

# --- Load files
daily_activity <- read.csv("Data/dailyActivity_merged.csv")
daily_calories <- read.csv("Data/dailyCalories_merged.csv")
daily_intensities <- read.csv("Data/dailyIntensities_merged.csv")
daily_steps <- read.csv("Data/dailySteps_merged.csv")
heartrate_seconds <- read.csv("Data/heartrate_seconds_merged.csv")
hourly_calories <- read.csv("Data/hourlyCalories_merged.csv")
hourly_intensities <- read.csv("Data/hourlyIntensities_merged.csv")
hourly_steps <- read.csv("Data/hourlySteps_merged.csv")
minute_calories_narrow <- read.csv("Data/minuteCaloriesNarrow_merged.csv")
minute_calories_wide <- read.csv("Data/minuteCaloriesWide_merged.csv")
minute_intensities_narrow <- read.csv("Data/minuteIntensitiesNarrow_merged.csv")
minute_intensities_wide <- read.csv("Data/minuteIntensitiesWide_merged.csv")
minute_METs_narrow <- read.csv("Data/minuteMETsNarrow_merged.csv")
minute_sleep <- read.csv("Data/minuteSleep_merged.csv")
minute_steps_narrow <- read.csv("Data/minuteStepsNarrow_merged.csv")
minute_steps_wide <- read.csv("Data/minuteStepsWide_merged.csv")
sleep_day <- read.csv("Data/sleepDay_merged.csv")
weight_loginfo <- read.csv("Data/weightLogInfo_merged.csv")

# --- Glimpse files
print("---------------- daily_activity ----------------")
glimpse(daily_activity)
print("---------------- daily_calories ----------------")
glimpse(daily_calories)
print("---------------- daily_intensities ----------------")
glimpse(daily_intensities)
print("---------------- daily_steps ----------------")
glimpse(daily_steps)
print("---------------- heartrate_seconds ----------------")
glimpse(heartrate_seconds)
print("---------------- hourly_calories ----------------")
glimpse(hourly_calories)
print("---------------- hourly_intensities ----------------")
glimpse(hourly_intensities)
print("---------------- hourly_steps ----------------")
glimpse(hourly_steps)
print("---------------- minute_calories_narrow ----------------")
glimpse(minute_calories_narrow)
print("---------------- minute_calories_wide ----------------")
glimpse(minute_calories_wide)
print("---------------- minute_intensities_narrow ----------------")
glimpse(minute_intensities_narrow)
print("---------------- minute_intensities_wide ----------------")
glimpse(minute_intensities_wide)
print("---------------- minute_METs_narrow ----------------")
glimpse(minute_METs_narrow)
print("---------------- minute_sleep ----------------")
glimpse(minute_sleep)
print("---------------- minute_steps_narrow ----------------")
glimpse(minute_steps_narrow)
print("---------------- minute_steps_wide ----------------")
glimpse(minute_steps_wide)
print("---------------- sleep_day ----------------")
glimpse(sleep_day)
print("---------------- weight_loginfo ----------------")
glimpse(weight_loginfo)

# --- Rename Attributes
## daily_activity
names(daily_activity)[names(daily_activity) == "Id"] <- "id"
names(daily_activity)[names(daily_activity) == "ActivityDate"] <- "activity_day"
names(daily_activity)[names(daily_activity) == "TotalSteps"] <- "total_steps"
names(daily_activity)[names(daily_activity) == "TotalDistance"] <- "total_distance"
names(daily_activity)[names(daily_activity) == "TrackerDistance"] <- "tracker_distance"
names(daily_activity)[names(daily_activity) == "LoggedActivitiesDistance"] <- "logged_activities_distance"
names(daily_activity)[names(daily_activity) == "VeryActiveDistance"] <- "very_active_distance"
names(daily_activity)[names(daily_activity) == "ModeratelyActiveDistance"] <- "moderate_active_distance"
names(daily_activity)[names(daily_activity) == "LightActiveDistance"] <- "light_active_distance"
names(daily_activity)[names(daily_activity) == "SedentaryActiveDistance"] <- "sedentary_active_distance"
names(daily_activity)[names(daily_activity) == "VeryActiveMinutes"] <- "very_active_minutes"
names(daily_activity)[names(daily_activity) == "FairlyActiveMinutes"] <- "moderate_active_minutes"
names(daily_activity)[names(daily_activity) == "LightlyActiveMinutes"] <- "light_active_minutes"
names(daily_activity)[names(daily_activity) == "SedentaryMinutes"] <- "sedentary_minutes"
names(daily_activity)[names(daily_activity) == "Calories"] <- "calories"

## daily_calories
names(daily_calories)[names(daily_calories) == "Id"] <- "id"
names(daily_calories)[names(daily_calories) == "ActivityDay"] <- "activity_day"
names(daily_calories)[names(daily_calories) == "Calories"] <- "calories"

## daily_intensities
names(daily_intensities)[names(daily_intensities) == "Id"] <- "id"
names(daily_intensities)[names(daily_intensities) == "ActivityDay"] <- "activity_day"
names(daily_intensities)[names(daily_intensities) == "VeryActiveDistance"] <- "very_active_distance"
names(daily_intensities)[names(daily_intensities) == "ModeratelyActiveDistance"] <- "moderate_active_distance"
names(daily_intensities)[names(daily_intensities) == "LightActiveDistance"] <- "light_active_distance"
names(daily_intensities)[names(daily_intensities) == "SedentaryActiveDistance"] <- "sedentary_active_distance"
names(daily_intensities)[names(daily_intensities) == "VeryActiveMinutes"] <- "very_active_minutes"
names(daily_intensities)[names(daily_intensities) == "FairlyActiveMinutes"] <- "moderate_active_minutes"
names(daily_intensities)[names(daily_intensities) == "LightlyActiveMinutes"] <- "light_active_minutes"
names(daily_intensities)[names(daily_intensities) == "SedentaryMinutes"] <- "sedentary_minutes"

## daily_steps
names(daily_steps)[names(daily_steps) == "Id"] <- "id"
names(daily_steps)[names(daily_steps) == "ActivityDay"] <- "activity_day"
names(daily_steps)[names(daily_steps) == "StepTotal"] <- "total_steps"

## heartrate_seconds
names(heartrate_seconds)[names(heartrate_seconds) == "Id"] <- "id"
names(heartrate_seconds)[names(heartrate_seconds) == "Time"] <- "activity_second"
names(heartrate_seconds)[names(heartrate_seconds) == "Value"] <- "heartrate"

## hourly_calories
names(hourly_calories)[names(hourly_calories) == "Id"] <- "id"
names(hourly_calories)[names(hourly_calories) == "ActivityHour"] <- "activity_hour"
names(hourly_calories)[names(hourly_calories) == "Calories"] <- "calories"

## hourly_intensities
names(hourly_intensities)[names(hourly_intensities) == "Id"] <- "id"
names(hourly_intensities)[names(hourly_intensities) == "ActivityHour"] <- "activity_hour"
names(hourly_intensities)[names(hourly_intensities) == "TotalIntensity"] <- "total_intensities"
names(hourly_intensities)[names(hourly_intensities) == "AverageIntensity"] <- "average_intensities"
# should not use intensity_total_hour, it causes misunderstanding easily

## hourly_steps
names(hourly_steps)[names(hourly_steps) == "Id"] <- "id"
names(hourly_steps)[names(hourly_steps) == "ActivityHour"] <- "activity_hour"
names(hourly_steps)[names(hourly_steps) == "StepTotal"] <- "total_steps"

## minute_calories_narrow
names(minute_calories_narrow)[names(minute_calories_narrow) == "Id"] <- "id"
names(minute_calories_narrow)[names(minute_calories_narrow) == "ActivityMinute"] <- "activity_minute"
names(minute_calories_narrow)[names(minute_calories_narrow) == "Calories"] <- "calories"

## minute_calories_wide
names(minute_calories_wide)[names(minute_calories_wide) == "Id"] <- "id"
names(minute_calories_wide)[names(minute_calories_wide) == "ActivityHour"] <- "activity_hour"
for (i in 3:ncol(minute_calories_wide)) { # lower case of Calories00 to Calories59
  names(minute_calories_wide)[i] <- tolower(names(minute_calories_wide)[i])
}

## minute_intensities_narrow
names(minute_intensities_narrow)[names(minute_intensities_narrow) == "Id"] <- "id"
names(minute_intensities_narrow)[names(minute_intensities_narrow) == "ActivityMinute"] <- "activity_minute"
names(minute_intensities_narrow)[names(minute_intensities_narrow) == "Intensity"] <- "intensity_state"

## minute_intensities_wide
names(minute_intensities_wide)[names(minute_intensities_wide) == "Id"] <- "id"
names(minute_intensities_wide)[names(minute_intensities_wide) == "ActivityHour"] <- "activity_hour"
for (i in 3:ncol(minute_intensities_wide)) { # lower case of Intensity00 to Intensity59
  names(minute_intensities_wide)[i] <- tolower(names(minute_intensities_wide)[i])
}

## minute_METs_narrow
names(minute_METs_narrow)[names(minute_METs_narrow) == "Id"] <- "id"
names(minute_METs_narrow)[names(minute_METs_narrow) == "ActivityMinute"] <- "activity_minute"
names(minute_METs_narrow)[names(minute_METs_narrow) == "METs"] <- "MET"

## minute_sleep
names(minute_sleep)[names(minute_sleep) == "Id"] <- "id"
names(minute_sleep)[names(minute_sleep) == "date"] <- "activity_minute"
names(minute_sleep)[names(minute_sleep) == "value"] <- "sleep_state"
names(minute_sleep)[names(minute_sleep) == "logId"] <- "log_id"

## minute_steps_narrow
names(minute_steps_narrow)[names(minute_steps_narrow) == "Id"] <- "id"
names(minute_steps_narrow)[names(minute_steps_narrow) == "ActivityMinute"] <- "activity_minute"
names(minute_steps_narrow)[names(minute_steps_narrow) == "Steps"] <- "total_steps"

## minute_steps_wide
names(minute_steps_wide)[names(minute_steps_wide) == "Id"] <- "id"
names(minute_steps_wide)[names(minute_steps_wide) == "ActivityHour"] <- "activity_hour"
for (i in 3:ncol(minute_steps_wide)) { # lower case of Steps00 to Steps59
  names(minute_steps_wide)[i] <- tolower(names(minute_steps_wide)[i])
}

## sleep_day
names(sleep_day)[names(sleep_day) == "Id"] <- "id"
names(sleep_day)[names(sleep_day) == "SleepDay"] <- "activity_day"
names(sleep_day)[names(sleep_day) == "TotalSleepRecords"] <- "total_sleep_records"
names(sleep_day)[names(sleep_day) == "TotalMinutesAsleep"] <- "total_asleep_minutes"
names(sleep_day)[names(sleep_day) == "TotalTimeInBed"] <- "total_bedtime_minutes"

## weight_loginfo
names(weight_loginfo)[names(weight_loginfo) == "Id"] <- "id"
names(weight_loginfo)[names(weight_loginfo) == "Date"] <- "activity_day"
names(weight_loginfo)[names(weight_loginfo) == "WeightKg"] <- "weight_kg"
names(weight_loginfo)[names(weight_loginfo) == "WeightPounds"] <- "weight_pounds"
names(weight_loginfo)[names(weight_loginfo) == "Fat"] <- "fat"
names(weight_loginfo)[names(weight_loginfo) == "BMI"] <- "BMI"
names(weight_loginfo)[names(weight_loginfo) == "IsManualReport"] <- "is_manual_report"
names(weight_loginfo)[names(weight_loginfo) == "LogId"] <- "log_id"

# --- Organize time related variable
daily_activity$activity_day <- mdy(daily_activity$activity_day)
daily_calories$activity_day <- mdy(daily_calories$activity_day)
daily_intensities$activity_day <- mdy(daily_intensities$activity_day)
daily_steps$activity_day <- mdy(daily_steps$activity_day)

heartrate_seconds$activity_second <- mdy_hms(heartrate_seconds$activity_second, tz = Sys.timezone())
hourly_calories$activity_hour <- mdy_hms(hourly_calories$activity_hour, tz = Sys.timezone())
hourly_intensities$activity_hour <- mdy_hms(hourly_intensities$activity_hour, tz = Sys.timezone())
hourly_steps$activity_hour <- mdy_hms(hourly_steps$activity_hour, tz = Sys.timezone())

minute_calories_narrow$activity_minute <- mdy_hms(minute_calories_narrow$activity_minute, tz = Sys.timezone())
minute_calories_wide$activity_hour <- mdy_hms(minute_calories_wide$activity_hour, tz = Sys.timezone())
minute_intensities_narrow$activity_minute <- mdy_hms(minute_intensities_narrow$activity_minute, tz = Sys.timezone())
minute_intensities_wide$activity_hour <- mdy_hms(minute_intensities_wide$activity_hour, tz = Sys.timezone())
minute_METs_narrow$activity_minute <- mdy_hms(minute_METs_narrow$activity_minute, tz = Sys.timezone())
minute_sleep$activity_minute <- mdy_hms(minute_sleep$activity_minute, tz = Sys.timezone())
minute_steps_narrow$activity_minute <- mdy_hms(minute_steps_narrow$activity_minute, tz = Sys.timezone())
minute_steps_wide$activity_hour <- mdy_hms(minute_steps_wide$activity_hour, tz = Sys.timezone())

sleep_day$activity_day <- mdy_hms(sleep_day$activity_day, tz = Sys.timezone())
weight_loginfo$activity_day <- mdy_hms(weight_loginfo$activity_day, tz = Sys.timezone())

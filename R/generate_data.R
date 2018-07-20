library("lubridate")

set.seed(15)

age_range <- 16:40

generate_data <- function(num_participants) {
  return(data.frame(
    id = 1:num_participants,
    age = base::sample(age_range, num_participants, replace=TRUE, prob=dnorm(age_range, mean=24, sd=6)),
    arm_id = base::sample(c("1.1", "1.2", "2.1", "2.2"), num_participants, replace=TRUE),
    expecteded_date_of_delivery = base::sample(seq(
      lubridate::today() + 1,
      lubridate::today() + 1 + dweeks(38),
      by="day"), num_participants, replace=TRUE),
    outcome = base::sample(c(TRUE, FALSE), num_participants, prob=c(0.2, 0.8), replace=TRUE)
  ))
}

# plot data
# ggplot(data=age_sample, aes(age_sample$age)) +
#   geom_histogram(binwidth=1)

generate_data_csv <- function(num_participants){
  write.csv(generate_data(num_participants), file="faked_data.csv", row.names=FALSE)
}

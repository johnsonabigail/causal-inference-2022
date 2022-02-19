# Builds a bar graph with total incarcerations on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.

read_csv(here("data/NLSY97_clean.csv")) %>%
  filter(total_time_incarcerated>0) %>%
  group_by(race, gender) %>%
  summarize(total_time_incarcerated = mean(total_time_incarcerated)) %>%
  ggplot(aes(race, total_time_incarcerated, fill = gender)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(
      x = "Race", 
      y = "Mean Months Incarcerated", 
      fill = "Gender",
      title = "Mean Months Incarcerated in 2002 by Race and Gender") +
    theme_minimal() +
    scale_fill_economist()

ggsave(here("figures/incarcerations_by_racegender.png"), width=8, height=4.5)

library(tidyverse)

download.file("https://ndownloader.figshare.com/files/11930600?private_link=fe0cd1848e06456e6f38",
              "data/surveys_complete.csv")
surveys_complete <- read_csv("data/surveys_complete.csv")
str(surveys_complete)

ggplot(data = surveys_complete)
p1 <- ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))+geom_point(alpha=0.1)


ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))+
    geom_point(alpha=0.1, color="blue")

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length, color="blue"))+
  geom_point(alpha=0.1)

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))+
    geom_point(alpha=0.1, color="blue")

ggplot(data = surveys_complete, aes(x = species_id, y = weight, color=plot_id))+
  geom_point()

ggplot(data = surveys_complete, aes(x = species_id, y = weight))+
  scale_y_log10() +
  geom_jitter(alpha=0.3, aes(color=factor(plot_id))) + 
  geom_violin()

ggplot(data = surveys_complete, aes(x = species_id, y= hindfoot_length))+
  geom_jitter(alpha=0.3, aes(color=factor(plot_id))) + 
  geom_boxplot()

str(surveys_complete)                                                                            

surveys_complete$plot_id <- factor(surveys_complete$plot_id)

ggplot(data = surveys_complete, aes(x = species_id, y= hindfoot_length))+
  geom_jitter(alpha=0.3, aes(color=factor(plot_id))) + 
  geom_boxplot()


yearly_count <- surveys_complete %>%
  group_by(year, species_id) %>%
  tally()

ggplot(data = yearly_count, aes(x=year, y=n)) +
  geom_line()

ggplot(data = yearly_count, aes(x=year, y=n, color=species_id)) +
  geom_line()

ggplot(data = yearly_count, aes(x = year, y=n))+
  geom_line()+
  facet_wrap(~ species_id)

yearly_sex_count <- surveys_complete %>%
  group_by(year, species_id,sex) %>%
  tally()

ggplot(data=yearly_sex_count, aes(x = year, y=n, color=sex))+
  geom_line()+
  facet_wrap(~species_id)

ggplot(data=yearly_sex_count, aes(x = year, y=n, color=sex))+
  geom_line()+
  facet_wrap(~species_id) +
  theme_bw() +
  theme(panel.grid = element_blank())

ggplot(data=yearly_sex_count, aes(x = year, y=n, color=sex))+
  geom_line()+
  facet_wrap(~species_id) +
  theme_bw() +
  theme(panel.grid = element_blank(), text= element_text(size=16),
        axis.text.x = element_text(color="grey20", size=12, angle=90)) +
  labs(title="Observed species over time",
             x= "Year of observation", y= "Number of observations")

grey_theme <- theme(panel.grid = element_blank(), text= element_text(size=16),
                    axis.text.x = element_text(color="grey20", size=12, angle=90))

ggplot(data=yearly_sex_count, aes(x = year, y=n, color=sex))+
  geom_line()+
  facet_wrap(~species_id) +
  theme_bw() +
  grey_theme +
  labs(title="Observed species over time",
       x= "Year of observation", y= "Number of observations")

my_plot <- ggplot(data=yearly_sex_count, aes(x = year, y=n, color=sex))+
  geom_line()+
  facet_wrap(~species_id) +
  theme_bw() +
  labs(title="Observed species over time",
       x= "Year of observation", y= "Number of observations")
my_plot
my_plot + grey_theme

ggsave("plots/my_first_plot.png", my_plot, width = 15, height = 10, dpi=300)

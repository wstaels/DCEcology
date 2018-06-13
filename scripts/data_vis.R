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

ggplot(data = yearly_count, aes(x=year, y=n, group=species_id)) +
  geom_line()

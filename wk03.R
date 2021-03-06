#package
ipak("RCurl")
ipak("tidyverse")
ipak("flexdashboard")

library(flexdashboard)
library('ggplot2')
library("RCurl")
library("tidyverse")


#Download data

download.file("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-15/launches.csv", 
              destfile = "wk03_launches.csv", method = "curl")

download.file("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-15/agencies.csv", 
              destfile = "wk03_agencies.csv", method = "curl")

#Load data
wk03_launches <- read.csv("~/Documents/R Macbook Pro/TidyTuestday/wk03_launches.csv", stringsAsFactors=FALSE)
wk03_agencies <- read.csv("~/Documents/R Macbook Pro/TidyTuestday/wk03_agencies.csv", stringsAsFactors=FALSE)


#Count launches by Year
launches.year <- wk03_launches %>%
  group_by(launch_year) %>%
  tally()

#Count launches by Mission
launches.mission <- wk03_launches %>%
  group_by(mission) %>%
  tally() %>%
  top_n(10) 



### by Type of Agency

ggplot(data = wk03_launches) +
  aes(x = launch_year) +
  geom_histogram(bins = 30, fill = '#1f9e89') +
  labs(title = '',
       x = 'Year',
       y = '# of Launches') +
  theme_bw() +
  facet_wrap(vars(agency_type))

### by Year

ggplot(data = launches.year) +
  aes(x = launch_year, y = n) +
  geom_line(color = '#1f9e89') +
  labs(x = 'Year',
       y = '# of Launches') +
  theme_classic()


### by Mission - Top 10

ggplot(data = launches.mission) +
  aes(x = reorder(mission,n), weight = n, label = n) +
  geom_bar(fill = '#1f9e89') +
  labs(x = 'Mission',
       y = '#of Launches') +
  theme_classic() +
  coord_flip() +
  geom_text(aes(y=n), position=position_dodge2(width=0.9), hjust = -0.25) 
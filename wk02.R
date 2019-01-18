
#package
ipak("RCurl")
ipak("tidyverse")
ipak("sqldf")


#Load data

download.file("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-08/IMDb_Economist_tv_ratings.csv", 
              destfile = "/cloud/project/wk02.csv", method = "curl")
#Set variable type
wk02$date <- as.Date(wk02$date)
wk02$title <- as.character(wk02$title)

#Filter the show data
law.order <- sqldf("SELECT * FROM wk02 where title = 'Law & Order' ")


law.order.graph <-ggplot(law.order, aes(x=date, y=av_rating, fill= av_rating, colour = av_rating)) +
  geom_line() + 
  geom_point() +
  ggtitle("The rating evolution of the show: Law & Order\n (1990-2010)") +
  xlab("SEASONS") +
  ylab("AVERAGE RATING") +
  theme_minimal() +
  scale_fill_gradient(low = "#56B1F7", high = "#132B43") +
  scale_color_gradient(low = "#56B1F7", high = "#132B43")

law.order.graph

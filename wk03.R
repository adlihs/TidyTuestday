#package
ipak("RCurl")
ipak("tidyverse")
ipak("sqldf")

#Load data

download.file("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-15/launches.csv", 
              destfile = "/cloud/project/wk03.csv", method = "curl")

wk03$launch_date <- as.POSIXlt(as.Date(wk03$launch_date))
w

total.launch <- sqldf("SELECT COUNT(*) Total_Launch, datepart('dd',launch_date) day FROM wk03 group by datepart(dd,launch_date)")

# plot with jitter
plot(jitter(total.launch$launch_date), total.launch$Total_Launch , pch=20, col=rgb(0.1, 0.2, 0.8, 0.3) , xlab="X", ylab="Y", bty="n" )

library(flexdashboard)
library('ggplot2')
library("RCurl")
library("tidyverse")

download.file("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-29/clean_cheese.csv", 
              destfile = "wk04_clean_cheese.csv", method = "curl")

download.file("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-29/fluid_milk_sales.csv", 
              destfile = "wk04_fluid_milk_sales.csv", method = "curl")

download.file("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-29/milk_products_facts.csv", 
              destfile = "wk04_milk_product_facts.csv", method = "curl")

download.file("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-29/milkcow_facts.csv", 
              destfile = "wk04_milkcow_facts.csv", method = "curl")

download.file("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-29/state_milk_production.csv", 
              destfile = "wk04_state_milk_production.csv", method = "curl")

#Load data
wk04_clean_cheese <- read.csv("~/Documents/R Macbook Pro/TidyTuestday/wk04_clean_cheese.csv", stringsAsFactors=FALSE)
wk04_fluid_milk_sales <- read.csv("~/Documents/R Macbook Pro/TidyTuestday/wk04_fluid_milk_sales.csv", stringsAsFactors=FALSE)
wk04_milk_product_facts <- read.csv("~/Documents/R Macbook Pro/TidyTuestday/wk04_milk_product_facts.csv", stringsAsFactors=FALSE)
wk04_milkcow_facts <- read.csv("~/Documents/R Macbook Pro/TidyTuestday/wk04_milkcow_facts.csv", stringsAsFactors=FALSE)
wk04_state_milk_production <- read.csv("~/Documents/R Macbook Pro/TidyTuestday/wk04_state_milk_production.csv", stringsAsFactors=FALSE)

#rm('launches.mission')

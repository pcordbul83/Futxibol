rm(list = ls())

#installing packages

library(tidyverse)
library(rvest)
library(broom)
library(purrr)
library(lubridate)

setwd("C:/Users/pablo/Documents/Data_analysis/Futxibol")

###N
link<-"https://www.oddschecker.com/football/belgium/jupiler-pro-league"
web<-read_html(link)
ready<-html_nodes(web,"table")
table<-html_table(ready[[1]],fill=TRUE)

table$X2<-str_remove(table$X2," FC")

table$test<-str_extract(table$X2,"^\\w+(?=[:upper:])|^\\w+\\s+\\w+(?=[:upper:])|^\\w+\\s+\\w+\\s+\\w+(?=[:upper:])|^\\w+[:punct:]\\w+(?=[:upper:])")
table$X2<-str_remove(table$X2,"^\\w+(?=[:upper:])|^\\w+\\s+\\w+(?=[:upper:])|^\\w+\\s+\\w+\\s+\\w+(?=[:upper:])|^\\w+[:punct:]\\w+(?=[:upper:])")


odds<-table%>%filter(!is.na(X7))%>%select(X1,X2,X3,X6,X7,X8,test)
odds$X3<-str_remove(odds$X3,"Belgian Pro League")
odds<-na_if(odds,"")
odds<-odds%>%fill(X3)%>%filter(!is.na(X1))
col_odds<-c("Time","AwayTeam","Date","Home","Draw","Away","HomeTeam")
colnames(odds)<-col_odds
col_order <- c("Date","Time","HomeTeam","AwayTeam","Home","Draw","Away")
odds<-odds[,col_order]

odds$Day<-str_extract(odds$Date,"\\d+(?=th)|\\d+(?=rd)")
odds$Year<-str_extract(odds$Date,"\\d{4}")
odds$Month<-str_extract(odds$Date,"(?<=th )\\w+|(?<=rd )\\w+")
odds<-odds%>%mutate(Date=ymd(paste(odds$Year, odds$Month, odds$Day, sep="-")))%>%
  mutate(Time=(as.POSIXct(Time,format="%H:%M")))
today<-Sys.Date()


write.csv(odds,paste0(".\\ODDS\\",today,"odds.csv"), row.names = FALSE)

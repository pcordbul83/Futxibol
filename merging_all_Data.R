#clearing console
rm(list=ls())
setwd("C:/Users/pablo/Documents/Data_analysis/football")
#installing packages
library(tidyverse)
library(plyr)
library(readr)
library(readxl)


#loading data
#loading odds - to genenerate a full dataset, you need to compile all odds extracted
setwd("C:/Users/pablo/Documents/Data_analysis/football/ODDS")
odds_full <- ldply(list.files(), read_csv)
#transforming odds into proportions



#loading belgium games
setwd("C:/Users/pablo/Documents/Data_analysis/football")
bel_full<-read_csv(".\\GAMES\\belgium_full.csv")
rounds<-bel_full%>%group_by(Round)

#loading reference table
ref<-read_excel('Ref_Table_Bel.xlsx')


#merging all the files

full_data<-left_join(bel_full,odds_full,by=c("Date","HomeTeam","AwayTeam"))%>%select(Round,Date,HomeTeam,AwayTeam,HowegoalsFT,
                                                                                     AwaygoalsFT,HomegoalsHT,AwaygoalsHT,Home,Draw,Away)

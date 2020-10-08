#clearing console
rm(list=ls())
setwd("C:/Users/pablo/Documents/Data_analysis/Futxibol")
#installing packages
library(tidyverse)
library(dyplr)
library(plyr)
library(readr)
library(readxl)


#loading data

#loading reference table
ref_odds<-read_excel('Ref_Table_Bel.xlsx',sheet="ODDS")
ref_games<-read_excel('Ref_Table_Bel.xlsx',sheet="GAMES")

#loading odds - to genenerate a full dataset, you need to compile all odds extracted
setwd("C:/Users/pablo/Documents/Data_analysis/Futxibol/ODDS")
odds_full <- ldply(list.files(), read_csv)
#add teams
odds_full<-odds_full%>%left_join(ref_odds,by="HomeTeam")%>%mutate(AwayTeam=AwayTeam.x,HomeRef=REF)%>%
  select(-c("AwayTeam.x","AwayTeam.y","REF"))%>%left_join(ref_odds,by="AwayTeam")%>%
  mutate(HomeTeam=HomeTeam.x,AwayRef=REF)%>%select(-c("HomeTeam.x","HomeTeam.y","REF"))%>%
  select(c( "Date","HomeRef","AwayRef","Home","Draw","Away"))

#transforming odds into proportions
odds_full<-odds_full%>%mutate(H1=as.numeric(str_extract(Home,"\\d+(?=[:punct:])")),H2=as.numeric(str_extract(Home,"(?<=[:punct:])\\d+")),
                              D1=as.numeric(str_extract(Draw,"\\d+(?=[:punct:])")),D2=as.numeric(str_extract(Draw,"(?<=[:punct:])\\d+")),
                              A1=as.numeric(str_extract(Away,"\\d+(?=[:punct:])")),A2=as.numeric(str_extract(Away,"(?<=[:punct:])\\d+")))

#I think the odds here are (for HOme) the H2 is whayt you bet and the H1 what you win
#so for every dollar invested you make H1/H2
odds_full<-odds_full%>%mutate(Home_p=H1/H2,Draw_p=D1/D2,Away_p=A1/A2)%>%
  select("Date","HomeRef","AwayRef","Home_p","Draw_p","Away_p")
  



#loading belgium games
setwd("C:/Users/pablo/Documents/Data_analysis/Futxibol")
bel_full<-read_csv(".\\GAMES\\belgium_full.csv")

bel_full<-bel_full%>%left_join(ref_games,by="HomeTeam")%>%mutate(AwayTeam=AwayTeam.x,HomeRef=REF)%>%
  select(-c("AwayTeam.x","AwayTeam.y","REF"))%>%left_join(ref_games,by="AwayTeam")%>%
  mutate(HomeTeam=HomeTeam.x,AwayRef=REF)%>%select(-c("HomeTeam.x","HomeTeam.y","REF"))%>%
  select(c( "Round","Date","HomeRef","AwayRef","HowegoalsFT","AwaygoalsFT","HomegoalsHT","AwaygoalsHT"))

#problem with STANDARD
bel_full$HomeRef[is.na(bel_full$HomeRef)] = "SANDARD"
bel_full$AwayRef[is.na(bel_full$AwayRef)] = "SANDARD"
 


#merging all the files

full_data<-left_join(bel_full,odds_full,by=c("Date","HomeRef","AwayRef"))

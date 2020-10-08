


setwd("C:/Users/pablo/Documents/Data_analysis/Futxibol")

library(tidyverse)
library(rvest)
library(broom)
library(purrr)
library(lubridate)

library(readr)



bel21<- read_csv("./europe-master/europe-master/belgium/2020-21/1-firstdivisiona-i.txt")
bel21<-bel21%>%select("= Belgian First Division A 2020/21")%>%rename(variable="= Belgian First Division A 2020/21")

#extract round
bel21$Round<-str_extract(bel21$variable,"^Round\\s+\\d+")
bel21$detect<-str_detect(bel21$variable,"^Round\\s+\\d+")
bel21<-bel21%>%fill(Round)%>%filter(detect=="FALSE")%>%select(-detect)


#extract date
bel21$Date<-str_extract(bel21$variable,"^\\[\\w{3}\\s{1}\\w{3}[:punct:]\\d+\\]")
bel21$detect<-str_detect(bel21$variable,"^\\[\\w{3}\\s{1}\\w{3}[:punct:]\\d+\\]")
bel21<-bel21%>%fill(Date)%>%filter(detect=="FALSE")%>%select(-detect)

#extract hour of the game
bel21$Time<-str_extract(bel21$variable,"^\\d{2}\\.\\d{2}")
bel21<-bel21%>%fill(Time)%>%mutate(variable=str_replace_all(variable,"^\\d{2}\\.\\d{2}",""))

#extract howeteam
bel21$HomeTeam<-str_extract(bel21$variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+")

bel21<-bel21%>%mutate(variable=str_remove(variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+"))
 
  


#extract home goals
bel21$HowegoalsFT<-str_extract(bel21$variable,"\\d")
#extract away goals
bel21$AwaygoalsFT<-str_extract(bel21$variable,"[:punct:]\\d")
bel21$AwaygoalsFT<-str_remove(bel21$AwaygoalsFT,"-")


#extract home goals HT
bel21$HomegoalsHT<-str_extract(bel21$variable,"\\(\\d")
bel21$HomegoalsHT<-str_remove(bel21$HomegoalsHT,"\\(")

#extract away goals HT
bel21$AwaygoalsHT<-str_extract(bel21$variable,"\\d\\)")
bel21$AwaygoalsHT<-str_remove(bel21$AwaygoalsHT,"\\)")

bel21$variable<-str_remove_all(bel21$variable,"\\d")

#extract away team
bel21$AwayTeam<-str_extract(bel21$variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+")
bel21<-bel21%>%mutate(variable=str_remove(variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+"))

bel21$AwayTeam[is.na(bel21$AwayTeam)] = "Waasland-Beveren"

bel21<-bel21%>%mutate(detect=ifelse(variable==variable[18],1,0))
bel21 <- transform(bel21, HomeTeam = ifelse(detect == 1, AwayTeam, HomeTeam), AwayTeam = ifelse(detect == 1, HomeTeam, AwayTeam))


bel21$Round<-str_remove_all(bel21$Round,"Round ")
bel21<-bel21%>%select(-c("variable","detect"))
 
###dates
bel21$Month<-str_extract(bel21$Date,"(?<=\\s)\\w{3}")
bel21$Day<-str_extract(bel21$Date,"\\d+")

year2020<-c("Aug","Sep","Oct","Nov","Dec")

bel21<-bel21%>%mutate(Year=ifelse(Month%in%year2020,2020,2021),Date=ymd(paste(Year, Month, Day, sep="-")))

write.csv(bel21,".\\GAMES\\season20-21.csv", row.names = FALSE)


###seson 19-20###
bel20<- read_csv("./europe-master/europe-master/belgium/2019-20/1-firstdivisiona-i.txt")
bel20<-bel20%>%select("= Belgian First Division A 2019/20")%>%rename(variable="= Belgian First Division A 2019/20")

#extract round
bel20$Round<-str_extract(bel20$variable,"^Round\\s+\\d+")
bel20$detect<-str_detect(bel20$variable,"^Round\\s+\\d+")
bel20<-bel20%>%fill(Round)%>%filter(detect=="FALSE")%>%select(-detect)


#extract date
bel20$Date<-str_extract(bel20$variable,"^\\[\\w{3}\\s{1}\\w{3}[:punct:]\\d+\\]")
bel20$detect<-str_detect(bel20$variable,"^\\[\\w{3}\\s{1}\\w{3}[:punct:]\\d+\\]")
bel20<-bel20%>%fill(Date)%>%filter(detect=="FALSE")%>%select(-detect)

#extract hour of the game
bel20$Time<-str_extract(bel20$variable,"^\\d{2}\\.\\d{2}")
bel20<-bel20%>%fill(Time)%>%mutate(variable=str_replace_all(variable,"^\\d{2}\\.\\d{2}",""))

#extract howeteam
bel20$HomeTeam<-str_extract(bel20$variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+")

bel20<-bel20%>%mutate(variable=str_remove(variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+"))




#extract home goals
bel20$HowegoalsFT<-str_extract(bel20$variable,"\\d")
#extract away goals
bel20$AwaygoalsFT<-str_extract(bel20$variable,"[:punct:]\\d")
bel20$AwaygoalsFT<-str_remove(bel20$AwaygoalsFT,"-")


#extract home goals HT
bel20$HomegoalsHT<-str_extract(bel20$variable,"\\(\\d")
bel20$HomegoalsHT<-str_remove(bel20$HomegoalsHT,"\\(")

#extract away goals HT
bel20$AwaygoalsHT<-str_extract(bel20$variable,"\\d\\)")
bel20$AwaygoalsHT<-str_remove(bel20$AwaygoalsHT,"\\)")

bel20$variable<-str_remove_all(bel20$variable,"\\d")

#extract away team
bel20$AwayTeam<-str_extract(bel20$variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+")
bel20<-bel20%>%mutate(variable=str_remove(variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+"))

bel20$AwayTeam[is.na(bel20$AwayTeam)] = "Waasland-Beveren"

bel20<-bel20%>%mutate(detect=ifelse(variable==variable[18],1,0))
bel20 <- transform(bel20, HomeTeam = ifelse(detect == 1, AwayTeam, HomeTeam), AwayTeam = ifelse(detect == 1, HomeTeam, AwayTeam))


bel20$Round<-str_remove_all(bel20$Round,"Round ")
bel20<-bel20%>%select(-c("variable","detect"))

###dates
bel20$Month<-str_extract(bel20$Date,"(?<=\\s)\\w{3}")
bel20$Day<-str_extract(bel20$Date,"\\d+")

year2019<-c("Jul","Aug","Sep","Oct","Nov","Dec")

bel20<-bel20%>%mutate(Year=ifelse(Month%in%year2019,2019,2020),Date=ymd(paste(Year, Month, Day, sep="-")))

write.csv(bel20,".\\GAMES\\season19-20.csv", row.names = FALSE)


###seson 18-19###
bel19<- read_csv("./europe-master/europe-master/belgium/2018-19/1-firstdivisiona-i.txt")
bel19<-bel19%>%select("= Belgian First Division A 2018/19")%>%rename(variable="= Belgian First Division A 2018/19")

#extract round
bel19$Round<-str_extract(bel19$variable,"^Round\\s+\\d+")
bel19$detect<-str_detect(bel19$variable,"^Round\\s+\\d+")
bel19<-bel19%>%fill(Round)%>%filter(detect=="FALSE")%>%select(-detect)


#extract date
bel19$Date<-str_extract(bel19$variable,"^\\[\\w{3}\\s{1}\\w{3}[:punct:]\\d+\\]")
bel19$detect<-str_detect(bel19$variable,"^\\[\\w{3}\\s{1}\\w{3}[:punct:]\\d+\\]")
bel19<-bel19%>%fill(Date)%>%filter(detect=="FALSE")%>%select(-detect)

#extract hour of the game
bel19$Time<-str_extract(bel19$variable,"^\\d{2}\\.\\d{2}")
bel19<-bel19%>%fill(Time)%>%mutate(variable=str_replace_all(variable,"^\\d{2}\\.\\d{2}",""))

#extract howeteam
bel19$HomeTeam<-str_extract(bel19$variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+")

bel19<-bel19%>%mutate(variable=str_remove(variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+"))




#extract home goals
bel19$HowegoalsFT<-str_extract(bel19$variable,"\\d")
#extract away goals
bel19$AwaygoalsFT<-str_extract(bel19$variable,"[:punct:]\\d")
bel19$AwaygoalsFT<-str_remove(bel19$AwaygoalsFT,"-")


#extract home goals HT
bel19$HomegoalsHT<-str_extract(bel19$variable,"\\(\\d")
bel19$HomegoalsHT<-str_remove(bel19$HomegoalsHT,"\\(")

#extract away goals HT
bel19$AwaygoalsHT<-str_extract(bel19$variable,"\\d\\)")
bel19$AwaygoalsHT<-str_remove(bel19$AwaygoalsHT,"\\)")

bel19$variable<-str_remove_all(bel19$variable,"\\d")

#extract away team
bel19$AwayTeam<-str_extract(bel19$variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+")
bel19<-bel19%>%mutate(variable=str_remove(variable,"\\w+\\s{1}\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+\\s{1}\\w+|\\w+\\s{1}\\w+|\\w+[:punct:]\\w+\\s{1}\\w+"))

bel19$AwayTeam[is.na(bel19$AwayTeam)] = "Waasland-Beveren"

bel19<-bel19%>%mutate(detect=ifelse(variable==variable[18],1,0))
bel19 <- transform(bel19, HomeTeam = ifelse(detect == 1, AwayTeam, HomeTeam), AwayTeam = ifelse(detect == 1, HomeTeam, AwayTeam))


bel19$Round<-str_remove_all(bel19$Round,"Round ")
bel19<-bel19%>%select(-c("variable","detect"))

###dates
bel19$Month<-str_extract(bel19$Date,"(?<=\\s)\\w{3}")
bel19$Day<-str_extract(bel19$Date,"\\d+")

year2018<-c("Jul","Aug","Sep","Oct","Nov","Dec")

bel19<-bel19%>%mutate(Year=ifelse(Month%in%year2018,2018,2019),Date=ymd(paste(Year, Month, Day, sep="-")))

write.csv(bel19,".\\GAMES\\season18-19.csv", row.names = FALSE)


####full_data_Belgium###
belgium_full<-bind_rows(bel19,bel20,bel21)
write.csv(belgium_full,".\\GAMES\\belgium_full.csv", row.names = FALSE)

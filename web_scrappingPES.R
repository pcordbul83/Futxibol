
## Script name:NBA_decade 
##
## scrap data from the sofifa website
##
## Author: pcb83
##
## Date Created: 2020-10-07
##
####################################################################################################"

#clear everything#
rm(list = ls())

#installing packages

library(tidyverse)
library(rvest)
library(broom)
library(purrr)
setwd("C:/Users/pablo/Documents/Data_analysis/Futxibol")


###################################
###from the pES website###########
##################################

##PES function
##the function###

fun_pes<-function(link){
  web<-read_html(link)
  ready<-html_nodes(web,"table")
  table<-html_table(ready[[1]],fill=TRUE)
  
}



##the links

base<-"https://pesdb.net/pes2021/?sort=id"
pages<-matrix(paste0(base,"&page=",c(2:456)),nrow=5)

n<-ncol(pages)


pes_data<-fun_pes(base)
Sys.sleep(30)
for(i in c(2:n)){
temp<-do.call("bind_rows",lapply(pages[,i],fun_pes))
pes_data<-bind_rows(pes_data,temp)
Sys.sleep(30)
}
  

today<-Sys.Date()
pes_data<-pes_data%>%mutate(Date=today)
write.csv(pes_data,paste0(".\\PES\\",today,"pes_full.csv"), row.names = FALSE)


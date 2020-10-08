
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

base<-"http://pesdb.net/pes2021/"
pages<-matrix(paste0(base,"?page=",c(2:451)),nrow=5)
extra<-c("",pages)



pes_data_1<-fun_pes(base)
pes_data_2<-do.call("bind_rows",lapply(pages[,2],fun_pes))
pes_data_3<-do.call("bind_rows",lapply(pages[,3],fun_pes))
pes_data_4<-do.call("bind_rows",lapply(pages[,4],fun_pes))
pes_data_5<-do.call("bind_rows",lapply(pages[,5],fun_pes))


###
pes_data_6<-do.call("bind_rows",lapply(pages[,6],fun_pes))
pes_data_7<-do.call("bind_rows",lapply(pages[,7],fun_pes))
pes_data_8<-do.call("bind_rows",lapply(pages[,8],fun_pes))
pes_data_9<-do.call("bind_rows",lapply(pages[,9],fun_pes))
pes_data_10<-do.call("bind_rows",lapply(pages[,10],fun_pes))

###
pes_data_11<-do.call("bind_rows",lapply(pages[,11],fun_pes))
pes_data_12<-do.call("bind_rows",lapply(pages[,12],fun_pes))
pes_data_13<-do.call("bind_rows",lapply(pages[,13],fun_pes))
pes_data_14<-do.call("bind_rows",lapply(pages[,14],fun_pes))
pes_data_15<-do.call("bind_rows",lapply(pages[,15],fun_pes))

###
pes_data_16<-do.call("bind_rows",lapply(pages[,16],fun_pes))
pes_data_17<-do.call("bind_rows",lapply(pages[,17],fun_pes))
pes_data_18<-do.call("bind_rows",lapply(pages[,18],fun_pes))
pes_data_19<-do.call("bind_rows",lapply(pages[,19],fun_pes))
pes_data_20<-do.call("bind_rows",lapply(pages[,20],fun_pes))


###
pes_data_21<-do.call("bind_rows",lapply(pages[,21],fun_pes))
pes_data_22<-do.call("bind_rows",lapply(pages[,22],fun_pes))
pes_data_23<-do.call("bind_rows",lapply(pages[,23],fun_pes))
pes_data_24<-do.call("bind_rows",lapply(pages[,24],fun_pes))
pes_data_25<-do.call("bind_rows",lapply(pages[,25],fun_pes))

###
pes_data_26<-do.call("bind_rows",lapply(pages[,26],fun_pes))
pes_data_27<-do.call("bind_rows",lapply(pages[,27],fun_pes))
pes_data_28<-do.call("bind_rows",lapply(pages[,28],fun_pes))
pes_data_29<-do.call("bind_rows",lapply(pages[,29],fun_pes))
pes_data_30<-do.call("bind_rows",lapply(pages[,30],fun_pes))

###
pes_data_31<-do.call("bind_rows",lapply(pages[,31],fun_pes))
pes_data_32<-do.call("bind_rows",lapply(pages[,32],fun_pes))
pes_data_33<-do.call("bind_rows",lapply(pages[,33],fun_pes))
pes_data_34<-do.call("bind_rows",lapply(pages[,34],fun_pes))
pes_data_35<-do.call("bind_rows",lapply(pages[,35],fun_pes))


###
pes_data_36<-do.call("bind_rows",lapply(pages[,36],fun_pes))
pes_data_37<-do.call("bind_rows",lapply(pages[,37],fun_pes))
pes_data_38<-do.call("bind_rows",lapply(pages[,38],fun_pes))
pes_data_39<-do.call("bind_rows",lapply(pages[,39],fun_pes))
pes_data_40<-do.call("bind_rows",lapply(pages[,40],fun_pes))


###
pes_data_41<-do.call("bind_rows",lapply(pages[,41],fun_pes))
pes_data_42<-do.call("bind_rows",lapply(pages[,42],fun_pes))
pes_data_43<-do.call("bind_rows",lapply(pages[,43],fun_pes))
pes_data_44<-do.call("bind_rows",lapply(pages[,44],fun_pes))
pes_data_45<-do.call("bind_rows",lapply(pages[,45],fun_pes))

###
pes_data_46<-do.call("bind_rows",lapply(pages[,46],fun_pes))
pes_data_47<-do.call("bind_rows",lapply(pages[,47],fun_pes))
pes_data_48<-do.call("bind_rows",lapply(pages[,48],fun_pes))
pes_data_49<-do.call("bind_rows",lapply(pages[,49],fun_pes))
pes_data_50<-do.call("bind_rows",lapply(pages[,50],fun_pes))

###
pes_data_51<-do.call("bind_rows",lapply(pages[,51],fun_pes))
pes_data_52<-do.call("bind_rows",lapply(pages[,52],fun_pes))
pes_data_53<-do.call("bind_rows",lapply(pages[,53],fun_pes))
pes_data_54<-do.call("bind_rows",lapply(pages[,54],fun_pes))
pes_data_55<-do.call("bind_rows",lapply(pages[,55],fun_pes))

####
pes_data_56<-do.call("bind_rows",lapply(pages[,56],fun_pes))
pes_data_57<-do.call("bind_rows",lapply(pages[,57],fun_pes))
pes_data_58<-do.call("bind_rows",lapply(pages[,58],fun_pes))
pes_data_59<-do.call("bind_rows",lapply(pages[,59],fun_pes))
pes_data_60<-do.call("bind_rows",lapply(pages[,60],fun_pes))


###
pes_data_61<-do.call("bind_rows",lapply(pages[,61],fun_pes))
pes_data_62<-do.call("bind_rows",lapply(pages[,62],fun_pes))
pes_data_63<-do.call("bind_rows",lapply(pages[,63],fun_pes))
pes_data_64<-do.call("bind_rows",lapply(pages[,64],fun_pes))
pes_data_65<-do.call("bind_rows",lapply(pages[,65],fun_pes))


###
pes_data_66<-do.call("bind_rows",lapply(pages[,66],fun_pes))
pes_data_67<-do.call("bind_rows",lapply(pages[,67],fun_pes))
pes_data_68<-do.call("bind_rows",lapply(pages[,68],fun_pes))
pes_data_69<-do.call("bind_rows",lapply(pages[,69],fun_pes))
pes_data_70<-do.call("bind_rows",lapply(pages[,70],fun_pes))

###
pes_data_71<-do.call("bind_rows",lapply(pages[,71],fun_pes))
pes_data_72<-do.call("bind_rows",lapply(pages[,72],fun_pes))
pes_data_73<-do.call("bind_rows",lapply(pages[,73],fun_pes))
pes_data_74<-do.call("bind_rows",lapply(pages[,74],fun_pes))
pes_data_75<-do.call("bind_rows",lapply(pages[,75],fun_pes))

###
pes_data_76<-do.call("bind_rows",lapply(pages[,76],fun_pes))
pes_data_77<-do.call("bind_rows",lapply(pages[,77],fun_pes))
pes_data_78<-do.call("bind_rows",lapply(pages[,78],fun_pes))
pes_data_79<-do.call("bind_rows",lapply(pages[,79],fun_pes))
pes_data_80<-do.call("bind_rows",lapply(pages[,80],fun_pes))

###
pes_data_81<-do.call("bind_rows",lapply(pages[,81],fun_pes))
pes_data_82<-do.call("bind_rows",lapply(pages[,82],fun_pes))
pes_data_83<-do.call("bind_rows",lapply(pages[,83],fun_pes))
pes_data_84<-do.call("bind_rows",lapply(pages[,84],fun_pes))
pes_data_85<-do.call("bind_rows",lapply(pages[,85],fun_pes))

###
pes_data_86<-do.call("bind_rows",lapply(pages[,86],fun_pes))
pes_data_87<-do.call("bind_rows",lapply(pages[,87],fun_pes))
pes_data_88<-do.call("bind_rows",lapply(pages[,88],fun_pes))
pes_data_89<-do.call("bind_rows",lapply(pages[,89],fun_pes))
pes_data_90<-do.call("bind_rows",lapply(pages[,90],fun_pes))

###
pes_data_91<-fun_pes(paste0(base,"?page=",452))
                     
###binding everything###

dfs<-lapply(ls(pattern="^pes_data_"),function(x)get(x))
pes_full<-bind_rows(dfs)
today<-Sys.Date()
write.csv(pes_full,paste0(".\\PES\\",today,"pes_full.csv"), row.names = FALSE)


#install shiny
install.packages("shiny")
require(shiny)
install.packages(foreign)
require(foreign)
library(foreign)
install.packages("dplyr")
require(dplyr)
library(dplyr)
library(readxl)
install.packages("data.table")
library(data.table)
install.packages("seasonal")
require("seasonal")
require(foreign)
install.packages("TTR")
library(TTR)
install.packages("tsoutliers")
require("tsoutliers")
library(ggplot2)
install.packages("seasonalview")
library(seasonalview)

#set WD
setwd("C:/Users/40050761/Desktop/Version 3/Univariate")
library(haven)
library(readxl)
merged_file_gdp_merged <- read_excel("merged file gdp merged.xlsx")
View(merged_file_gdp_merged)

#creating yearmon var as obs.
require(zoo)
library(zoo)

merged_file_gdp_merged$Obs <-
  as.yearmon(paste(
    merged_file_gdp_merged$year,
    merged_file_gdp_merged$month,
    sep = "-"
  ))
head(merged_file_gdp_merged$Obs)
plot(merged_file_gdp_merged$repayments ~ merged_file_gdp_merged$Obs)

install.packages("openxlsx")
library("openxlsx")
require(openxlsx)
write.xlsx(merged_file_gdp_merged,
           "C:/Users/40050761/Desktop/Version 3/Univariate")


##Adding value labels

merged_file_gdp_merged$enterprise <-
  factor(
    merged_file_gdp_merged$enterprise,
    levels = c(
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      31,
      32
    ),
    labels = c(
      "Small Agriculture",
      "Small Utilities",
      "Small Manufacturing",
      "Small Construction",
      "Small Trade",
      "Small Accomodation",
      "Small IT",
      "Small Finance",
      "Small Education",
      "Small Health",
      "Small Arts",
      "All Small",
      "Medium Agriculture",
      "Medium Utilities",
      "Medium Manufacturing",
      "Medium Construction",
      "Medium Trade",
      "Medium Accomodation",
      "Medium IT",
      "Medium Finance",
      "Medium Education",
      "Medium Health",
      "Medium Arts",
      "All Medium"
    )
  )

#generating new variable for Employment %.

#FT employment as % of all employment.
merged_file_gdp_merged$FT_pct <-
  merged_file_gdp_merged$ftemployment / merged_file_gdp_merged$employment

#Pt employment as % of all employees. This provides a robustness check and also a measure of the quality of employment.

merged_file_gdp_merged$PT_pct <-
  merged_file_gdp_merged$parttimeemployment / merged_file_gdp_merged$totalemployees

##attemping XT line variaent in R, facet-wrap.

ggplot(
  merged_file_gdp_merged,
  aes(x = merged_file_gdp_merged$Obs, y = merged_file_gdp_merged$new_loans_mn)
) + geom_line() + facet_wrap(~ merged_file_gdp_merged$enterprise, scales = "free_y")



#To drop all Small industry category:
Smallnoall <- merged_file_gdp_merged %>% slice(1:759)

#To drop the final "All" medium enterprise category.

mednoall <- merged_file_gdp_merged %>% slice(829:1587)

#To Show Small + medium enterprise category.

AllEnter <- merged_file_gdp_merged %>% slice(1657:2415)


#plots using only small. DV first then IV
#AWE

ggplot(Smallnoall,
       aes(x = Smallnoall$Obs, y = Smallnoall$averageweeklyearnings)) + geom_line() + facet_wrap(~
                                                                                                   Smallnoall$enterprise, scales = "free_y")

#geoawe

ggplot(Smallnoall, aes(x = Smallnoall$Obs, y = Smallnoall$avgwe1)) + geom_line() + facet_wrap(~
                                                                                                Smallnoall$enterprise, scales = "free_y")

#employment is by year
#employees
ggplot(Smallnoall,
       aes(x = Smallnoall$year, y = Smallnoall$totalemployees)) + geom_line() + facet_wrap(~
                                                                                             Smallnoall$enterprise, scales = "free_y")

#full time
ggplot(Smallnoall,
       aes(x = Smallnoall$year, y = Smallnoall$ftemployment)) + geom_line() + facet_wrap(~
                                                                                           Smallnoall$enterprise, scales = "free_y")
#partime
ggplot(Smallnoall,
       aes(x = Smallnoall$year, y = Smallnoall$parttimeemployment)) + geom_line() + facet_wrap(~
                                                                                                 Smallnoall$enterprise, scales = "free_y")
#total employment
ggplot(Smallnoall, aes(x = Smallnoall$year, y = Smallnoall$employment)) + geom_line() + facet_wrap(~
                                                                                                     Smallnoall$enterprise, scales = "free_y")

## employment %%
#FT pct
ggplot(Smallnoall, aes(x = Smallnoall$year, y = Smallnoall$FT_pct)) + geom_line() + facet_wrap(~
                                                                                                 Smallnoall$enterprise, scales = "free_y")
#pt pct
ggplot(Smallnoall, aes(x = Smallnoall$year, y = Smallnoall$PT_pct)) + geom_line() + facet_wrap(~
                                                                                                 Smallnoall$enterprise, scales = "free_y")

##Business Count data.
#nbus
ggplot(Smallnoall, aes(x = Smallnoall$year, y = Smallnoall$nbusiness)) + geom_line() + facet_wrap(~
                                                                                                    Smallnoall$enterprise, scales = "free_y")

#nbus banking
ggplot(Smallnoall,
       aes(x = Smallnoall$Obs, y = Smallnoall$nbusinessescoveredbydata)) + geom_line() + facet_wrap(~
                                                                                                      Smallnoall$enterprise, scales = "free_y")
#nloansissue

ggplot(Smallnoall,
       aes(x = Smallnoall$Obs, y = Smallnoall$loanfacilitiesapproved)) + geom_line() + facet_wrap(~
                                                                                                    Smallnoall$enterprise, scales = "free_y")

#repayments

ggplot(Smallnoall, aes(x = Smallnoall$Obs, y = Smallnoall$repayments)) + geom_line() + facet_wrap(~
                                                                                                    Smallnoall$enterprise, scales = "free_y")

#new loans


ggplot(Smallnoall, aes(x = Smallnoall$Obs, y = Smallnoall$new_loans_mn)) + geom_line() + facet_wrap(~
                                                                                                      Smallnoall$enterprise, scales = "free_y")

#Outstanding debt


ggplot(Smallnoall,
       aes(x = Smallnoall$Obs, y = Smallnoall$totaloutstanding)) + geom_line() + facet_wrap(~
                                                                                              Smallnoall$enterprise, scales = "free_y")

#Seasonally adjusted data
#repayments

ggplot(Smallnoall, aes(x = Smallnoall$Obs, y = Smallnoall$repaymentssa)) + geom_line() + facet_wrap(~
                                                                                                      Smallnoall$enterprise, scales = "free_y")

#new loans
ggplot(Smallnoall, aes(x = Smallnoall$Obs, y = Smallnoall$newloansmnsa)) + geom_line() + facet_wrap(~
                                                                                                      Smallnoall$enterprise, scales = "free_y")

#Outstanding debt

ggplot(Smallnoall,
       aes(x = Smallnoall$Obs, y = Smallnoall$totaloutstandingsa)) + geom_line() + facet_wrap(~
                                                                                                Smallnoall$enterprise, scales = "free_y")

####################################################################################

#Medium Businesses.

#nbus banking
ggplot(mednoall,
       aes(x = mednoall$Obs, y = mednoall$nbusinessescoveredbydata)) + geom_line() + facet_wrap(~
                                                                                                  mednoall$enterprise, scales = "free_y")
#nloansissue

ggplot(mednoall,
       aes(x = mednoall$Obs, y = mednoall$loanfacilitiesapproved)) + geom_line() + facet_wrap(~
                                                                                                mednoall$enterprise, scales = "free_y")

#repayments

ggplot(mednoall, aes(x = mednoall$Obs, y = mednoall$repayments)) + geom_line() + facet_wrap(~
                                                                                              mednoall$enterprise, scales = "free_y")

#new loans


ggplot(mednoall, aes(x = mednoall$Obs, y = mednoall$new_loans_mn)) + geom_line() + facet_wrap(~
                                                                                                mednoall$enterprise, scales = "free_y")

#Outstanding debt


ggplot(mednoall, aes(x = mednoall$Obs, y = mednoall$totaloutstanding)) + geom_line() + facet_wrap(~
                                                                                                    mednoall$enterprise, scales = "free_y")

#Seasonally adjusted data
#repayments

ggplot(mednoall, aes(x = mednoall$Obs, y = mednoall$repaymentssa)) + geom_line() + facet_wrap(~
                                                                                                mednoall$enterprise, scales = "free_y")

#new loans
ggplot(mednoall, aes(x = mednoall$Obs, y = mednoall$newloansmnsa)) + geom_line() + facet_wrap(~
                                                                                                mednoall$enterprise, scales = "free_y")

#Outstanding debt

ggplot(mednoall, aes(x = mednoall$Obs, y = mednoall$totaloutstandingsa)) + geom_line() + facet_wrap(~
                                                                                                      mednoall$enterprise, scales = "free_y")



#Data for ALL Category

#nbus banking
ggplot(AllEnter,
       aes(x = AllEnter$Obs, y = AllEnter$nbusinessescoveredbydata)) + geom_line() + facet_wrap(~
                                                                                                  AllEnter$enterprise, scales = "free_y")
#nloansissue

ggplot(AllEnter,
       aes(x = AllEnter$Obs, y = AllEnter$loanfacilitiesapproved)) + geom_line() + facet_wrap(~
                                                                                                AllEnter$enterprise, scales = "free_y")

#repayments

ggplot(AllEnter, aes(x = AllEnter$Obs, y = AllEnter$repayments)) + geom_line() + facet_wrap(~
                                                                                              mednoall$enterprise, scales = "free_y")

#new loans


ggplot(AllEnter, aes(x = AllEnter$Obs, y = AllEnter$new_loans_mn)) + geom_line() + facet_wrap(~
                                                                                                AllEnter$enterprise, scales = "free_y")

#Outstanding debt


ggplot(AllEnter, aes(x = AllEnter$Obs, y = AllEnter$totaloutstanding)) + geom_line() + facet_wrap(~
                                                                                                    AllEnter$enterprise, scales = "free_y")

#Seasonally adjusted data #not yet existing!
#repayments

ggplot(AllEnter, aes(x = AllEnter$Obs, y = AllEnter$repaymentssa)) + geom_line() + facet_wrap(~
                                                                                                AllEnter$enterprise, scales = "free_y")

#new loans
ggplot(AllEnter, aes(x = AllEnter$Obs, y = AllEnter$newloansmnsa)) + geom_line() + facet_wrap(~
                                                                                                AllEnter$enterprise, scales = "free_y")

#Outstanding debt

ggplot(AllEnter, aes(x = AllEnter$Obs, y = AllEnter$totaloutstandingsa)) + geom_line() + facet_wrap(~
                                                                                                      AllEnter$enterprise, scales = "free_y")


############################################################

#################Reproducing  stuff for write up with labels.##################################

merged_file_gdp_merged <- read_excel("merged file gdp merged.xlsx")
merged_file_gdp_merged$Obs <-
  as.yearmon(paste(
    merged_file_gdp_merged$year,
    merged_file_gdp_merged$month,
    sep = "-"
  ))


All_Industry <- merged_file_gdp_merged %>% slice(1657:2415)
#AWE
ggplot(All_Industry,
       aes(x = All_Industry$Obs, y = All_Industry$averageweeklyearnings)) + geom_line() + facet_wrap(~
                                                                                                       All_Industry$enterprise, scales = "free_y") + labs(title = "Average Weekly Earnings by Industry", x = "Month", y = "Pounds ?")


#geoawe
ggplot(All_Industry, aes(x = All_Industry$Obs, y = All_Industry$avgwe1)) + geom_line() + facet_wrap(~
                                                                                                      All_Industry$enterprise, scales = "free_y") + labs(title = "Geometric Average Weekly Earnings by Industry", x = "Month", y = "Pounds ?")

#correlation coeff
cor(All_Industry$averageweeklyearnings, All_Industry$avgwe1)

#employees
ggplot(All_Industry,
       aes(x = All_Industry$year, y = All_Industry$totalemployees)) + geom_line() + facet_wrap(~
                                                                                                 All_Industry$enterprise, scales = "free_y") + labs(title = "Total Employees By Industry Year", x = "Year", y = "Total Employees")
#total employment
ggplot(All_Industry,
       aes(x = All_Industry$year, y = All_Industry$employment)) + geom_line() + facet_wrap(~
                                                                                             All_Industry$enterprise, scales = "free_y") + labs(title = "Total Employment By Industry Year", x = "Year", y = "Total Employment")


#full time
ggplot(All_Industry,
       aes(x = All_Industry$year, y = All_Industry$ftemployment)) + geom_line() + facet_wrap(~
                                                                                               All_Industry$enterprise, scales = "free_y") + labs(title = "Total Full-Time Employment By Industry Year", x = "Year", y = "Full-time Employment")



## employment %%
#FT pct
ggplot(All_Industry,
       aes(x = All_Industry$year, y = All_Industry$FT_pct)) + geom_line() + facet_wrap(~
                                                                                         All_Industry$enterprise, scales = "free_y") + labs(title = "Full-Time Employment as a Percentage of All Employment", x = "Year", y = "Percentage Full-time Employment")

#partime
ggplot(All_Industry,
       aes(x = All_Industry$year, y = All_Industry$parttimeemployment)) + geom_line() + facet_wrap(~
                                                                                                     All_Industry$enterprise, scales = "free_y") + labs(title = "Part-Time Employment", x = "Year", y = "Part-time Employment")


#pt pct
ggplot(All_Industry,
       aes(x = All_Industry$year, y = All_Industry$PT_pct)) + geom_line() + facet_wrap(~
                                                                                         All_Industry$enterprise, scales = "free_y") + labs(title = "Part-Time Employment as a Percentage of All Employees", x = "Year", y = "Percentage Part-time Employment")


#nbus
ggplot(All_Industry,
       aes(x = All_Industry$year, y = All_Industry$nbusiness)) + geom_line() + facet_wrap(~
                                                                                            All_Industry$enterprise, scales = "free_y") + labs(title = "Number of Business Recorded", x = "Year", y = "Number of businesses")

#nbus banking
ggplot(All_Industry,
       aes(x = All_Industry$Obs, y = All_Industry$nbusinessescoveredbydata)) + geom_line() + facet_wrap(~
                                                                                                          All_Industry$enterprise, scales = "free_y") + labs(title = "Number of Business Recorded by Banks", x = "Year", y = "Number of businesses")

#nloansissue

ggplot(All_Industry,
       aes(x = All_Industry$Obs, y = All_Industry$loanfacilitiesapproved)) + geom_line() + facet_wrap(~
                                                                                                        All_Industry$enterprise, scales = "free_y") + labs(title = "Number of Loan Facilities Approved", x = "Year", y = "Number of Facilities Approved")

#repayments

ggplot(All_Industry,
       aes(x = All_Industry$Obs, y = All_Industry$repayments)) + geom_line() + facet_wrap(~
                                                                                            All_Industry$enterprise, scales = "free_y") + labs(title = "Value of Loan Repayments ?mn", x = "Year", y = "Loan Repayments ?mn")

#new loans


ggplot(All_Industry,
       aes(x = All_Industry$Obs, y = All_Industry$new_loans_mn)) + geom_line() + facet_wrap(~
                                                                                              All_Industry$enterprise, scales = "free_y") + labs(title = "Value of New Loans Issued ?mn", x = "Year", y = "Loans ?mn")

#Outstanding debt


ggplot(All_Industry,
       aes(x = All_Industry$Obs, y = All_Industry$totaloutstanding)) + geom_line() + facet_wrap(~
                                                                                                  All_Industry$enterprise, scales = "free_y") + labs(title = "Value of Outstanding Debt ?mn", x = "Year", y = "Outstanding Debt ?mn")

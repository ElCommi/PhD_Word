#Seasonal adjustment 

#loading packages 
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

merged_file_gdp_merged$Obs <- as.yearmon(paste(merged_file_gdp_merged$year, merged_file_gdp_merged$month, sep = "-"))
head(merged_file_gdp_merged$Obs)
plot(merged_file_gdp_merged$repayments ~merged_file_gdp_merged$Obs)

#Duplicating datafile.

SA<-merged_file_gdp_merged

#This produces a Subset from the main data for values of 1657:1725 "All Agriculture". 
Agri<- SA %>% slice(1657:1725)

#This produces a Subset from the main data for values of 1726:1794 "All Utilities". 
Utilities<- SA %>% slice(1726:1794)

#This produces a Subset from the main data for values of 1795:1863 "All Manufacturing". 
Manufacturing<- SA %>% slice(1795:1863)

#This produces a Subset from the main data for values of 1864:1932 "All Construction". 
Construction<- SA %>% slice(1864:1932)

#This produces a Subset from the main data for values of 1933:2001 "All Trade". 
Trade<- SA %>% slice(1933:2001)

#This produces a Subset from the main data for values of 2002:2070 "All Accomodation". 
Accommodation<- SA %>% slice(2002:2070)

#This produces a Subset from the main data for values of 2071:2139 "All IT". 
IT<- SA %>% slice(2071:2139)

#This produces a Subset from the main data for values of 2140:2208 "All Financial". 
Finance<- SA %>% slice(2140:2208)

#This produces a Subset from the main data for values of 2209:2277 "All Education". 
Education<- SA %>% slice(2209:2277)

#This produces a Subset from the main data for values of 2278:2346 "All Health". 

Health<- SA %>% slice(2278:2346)

#This produces a Subset from the main data for values of 2347:2415 "All Arts". 
Arts<- SA %>% slice(2347:2415)

#This produces a Subset from the main data for values of 2416:2484 "All". 
All<- SA %>% slice(2416:2484)


#Produces a TS object in R for Agri repayments
AgriRep<-ts(Agri$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
#plotting AgriRep 
plot(AgriRep)
#Sa
Sa_AgriRep<- seas(AgriRep,x11 = "")
#plotting SA 
plot(Sa_AgriRep)
#agri loans
Agriloan<- ts(Agri$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Agriloan)
SA_Agriloan<- seas(Agriloan,x11 = "")
plot(SA_Agriloan)

#agri outstanding
Agriout<- ts(Agri$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Agriout)
Sa_Agriout<- seas(Agriout,x11 = "")
plot(Sa_Agriout)

#loan facilities approved
Agriapp<- ts(Agri$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Agriapp)
Sa_Agriapp<- seas(Agriapp,x11 = "")
plot(Sa_Agriapp)

#nbusinessees covered by data 

Agrinbus<- ts(Agri$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Agrinbus)
Sa_Agrinbus<- seas(Agrinbus,x11 = "")
plot(Sa_Agrinbus)



#### Utilities 
#Produces a TS object in R for Utility repayments
Utilitiesrep<-ts(Utilities$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Utilitiesrep)
Sa_Utilitiesrep<- seas(Utilitiesrep,x11 = "")
plot(Sa_Utilitiesrep)

#New Loans
UtilitiyLoan<- ts(Utilities$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(UtilitiyLoan)
SA_UtilitiyLoan<- seas(UtilitiyLoan,x11 = "")
plot(SA_UtilitiyLoan)

#outstanding
UtilityOut<- ts(Utilities$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(UtilityOut)
Sa_UtilityOut<- seas(UtilityOut,x11 = "")
plot(Sa_UtilityOut)

#loan facilities approved
Utilityapp<- ts(Utilities$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Utilityapp)
Sa_Utilityapp<- seas(Utilityapp,x11 = "")
plot(Sa_Utilityapp)

#nbusinessees covered by data 

Utilitybus<- ts(Utilities$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Utilitybus)
Sa_Utilitybus<- seas(Utilitybus,x11 = "")
plot(Sa_Utilitybus)




#### Manufacturing 
#Produces a TS object in R for repayments
Manufacturingrep<-ts(Manufacturing$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Manufacturingrep)
Sa_Manufacturingrep<- seas(Manufacturingrep,x11 = "")
plot(Sa_Manufacturingrep)

#New Loans
ManufacturingLoan<- ts(Manufacturing$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(ManufacturingLoan)
SA_ManufacturingLoan<- seas(ManufacturingLoan,x11 = "")
plot(SA_ManufacturingLoan)

# outstanding
ManufacturingOut<- ts(Manufacturing$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(ManufacturingOut)
Sa_ManufacturingOut<- seas(ManufacturingOut,x11 = "")
plot(Sa_ManufacturingOut)

#loan facilities approved
Manufacturingapp<- ts(Manufacturing$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Manufacturingapp)
Sa_Manufacturingapp<- seas(Manufacturingapp,x11 = "")
plot(Sa_Manufacturingapp)

#nbusinessees covered by data 

Manufacturingbus<- ts(Manufacturing$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Manufacturingbus)
Sa_Manufacturingbus<- seas(Manufacturingbus,x11 = "")
plot(Sa_Manufacturingbus)

######Construction



#Produces a TS object in R for  repayments
Constructionrep<-ts(Construction$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Constructionrep)
Sa_Constructionrep<- seas(Constructionrep,x11 = "")
plot(Sa_Constructionrep)

#New Loans
Constructionloan<- ts(Construction$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Constructionloan)
SA_Constructionloan<- seas(Constructionloan,x11 = "")
plot(SA_Constructionloan)

# outstanding
Constructionout<- ts(Construction$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Constructionout)
Sa_Constructionout<- seas(Constructionout,x11 = "")
plot(Sa_Constructionout)

#loan facilities approved
Constructionapp<- ts(Construction$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Constructionapp)
Sa_Constructionapp<- seas(Constructionapp,x11 = "")
plot(Sa_Constructionapp)

#nbusinessees covered by data 

Constructionbus<- ts(Construction$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Constructionbus)
Sa_Constructionbus<- seas(Constructionbus,x11 = "")
plot(Sa_Constructionbus)


###Trade 
Traderep<-ts(Trade$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Traderep)
Sa_Traderep<- seas(Traderep,x11 = "")
plot(Sa_Traderep)

#New Loans
Tradeloan<- ts(Trade$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Tradeloan)
SA_Tradeloan<- seas(Tradeloan,x11 = "")
plot(SA_Tradeloan)

# outstanding
Tradeout<- ts(Trade$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Tradeout)
Sa_Tradeout<- seas(Tradeout,x11 = "")
plot(Sa_Tradeout)

#loan facilities approved
Tradeapp<- ts(Trade$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Tradeapp)
Sa_Tradeapp<- seas(Tradeapp,x11 = "")
plot(Sa_Tradeapp)

#nbusinessees covered by data 

Tradebus<- ts(Trade$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Tradebus)
Sa_Tradebus<- seas(Tradebus,x11 = "")
plot(Sa_Tradebus)



##Accomodation & Food 
Accommodationrep<-ts(Accommodation$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Accommodationrep)
Sa_Accommodationrep<- seas(Accommodationrep,x11 = "")
plot(Sa_Accommodationrep)

#New Loans
Accommodationloan<- ts(Accommodation$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Accommodationloan)
SA_Accommodationloan<- seas(Accommodationloan,x11 = "")
plot(SA_Accommodationloan)

# outstanding
Accommodationout<- ts(Accommodation$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Accommodationout)
Sa_Accommodationout<- seas(Accommodationout,x11 = "")
plot(Sa_Accommodationout)

#loan facilities approved
Accommodationapp<- ts(Accommodation$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Accommodationapp)
Sa_Accommodationapp<- seas(Accommodationapp,x11 = "")
plot(Sa_Accommodationapp)

#nbusinessees covered by data 

Accommodationbus<- ts(Accommodation$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Accommodationbus)
Sa_Accommodationbus<- seas(Accommodationbus,x11 = "")
plot(Sa_Accommodationbus)


#####IT & Transport

ITrep<-ts(IT$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(ITrep)
Sa_ITrep<- seas(ITrep,x11 = "")
plot(Sa_ITrep)

#New Loans
ITloan<- ts(IT$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(ITloan)
SA_ITloan<- seas(ITloan,x11 = "")
plot(SA_ITloan)

# outstanding
ITout<- ts(IT$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(ITout)
Sa_ITout<- seas(ITout,x11 = "")
plot(Sa_ITout)

#loan facilities approved
ITapp<- ts(IT$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(ITapp)
Sa_ITapp<- seas(ITapp,x11 = "")
plot(Sa_ITapp)

#nbusinessees covered by data 

ITbus<- ts(IT$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(ITbus)
Sa_ITbus<- seas(ITbus,x11 = "")
plot(Sa_ITbus)


####Financial Services 

Financerep<-ts(Finance$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Financerep)
Sa_Financerep<- seas(Financerep,x11 = "")
plot(Sa_Financerep)

#New Loans
Financeloan<- ts(Finance$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Financeloan)
SA_Financeloan<- seas(Financeloan,x11 = "")
plot(SA_Financeloan)

# outstanding
Financeout<- ts(Finance$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Financeout)
Sa_Financeout<- seas(Financeout,x11 = "")
plot(Sa_Financeout)

#loan facilities approved
Financeapp<- ts(Finance$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Financeapp)
Sa_Financeapp<- seas(Financeapp,x11 = "")
plot(Sa_Financeapp)

#nbusinessees covered by data 

Financebus<- ts(Finance$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Financebus)
Sa_Financebus<- seas(Financebus,x11 = "")
plot(Sa_Financebus)

#####Education 

Educationrep<-ts(Education$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Educationrep)
Sa_Educationrep<- seas(Educationrep,x11 = "")
plot(Sa_Educationrep)

#New Loans
Educationloan<- ts(Education$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Educationloan)
SA_Educationloan<- seas(Educationloan,x11 = "")
plot(SA_Educationloan)

# outstanding
Educationout<- ts(Education$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Educationout)
Sa_Educationout<- seas(Educationout,x11 = "")
plot(Sa_Educationout)

#loan facilities approved
Educationapp<- ts(Education$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Educationapp)
Sa_Educationapp<- seas(Educationapp,x11 = "")
plot(Sa_Educationapp)

#nbusinessees covered by data 

Educationbus<- ts(Education$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Educationbus)
Sa_Educationbus<- seas(Educationbus,x11 = "")
plot(Sa_Educationbus)


####Health
Healthrep<-ts(Health$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Healthrep)
Sa_Healthrep<- seas(Healthrep,x11 = "")
plot(Sa_Healthrep)

#New Loans
Healthloan<- ts(Health$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Healthloan)
SA_Healthloan<- seas(Healthloan,x11 = "")
plot(SA_Healthloan)

# outstanding
Healthout<- ts(Health$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Healthout)
Sa_Healthout<- seas(Healthout,x11 = "")
plot(Sa_Healthout)

#loan facilities approved
Healthapp<- ts(Health$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Healthapp)
Sa_Healthapp<- seas(Healthapp,x11 = "")
plot(Sa_Healthapp)

#nbusinessees covered by data 

Healthbus<- ts(Health$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Healthbus)
Sa_Healthbus<- seas(Healthbus,x11 = "")
plot(Sa_Healthbus)


#Arts 

Artsrep<-ts(Arts$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Artsrep)
Sa_Artsrep<- seas(Artsrep,x11 = "")
plot(Sa_Artsrep)

#New Loans
Artsloan<- ts(Arts$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Artsloan)
SA_Artsloan<- seas(Artsloan,x11 = "")
plot(SA_Artsloan)

# outstanding
Artsout<- ts(Arts$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Artsout)
Sa_Artsout<- seas(Artsout,x11 = "")
plot(Sa_Artsout)

#loan facilities approved
Artsapp<- ts(Arts$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Artsapp)
Sa_Artsapp<- seas(Artsapp,x11 = "")
plot(Sa_Artsapp)

#nbusinessees covered by data 

Artsbus<- ts(Arts$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Artsbus)
Sa_Artsbus<- seas(Artsbus,x11 = "")
plot(Sa_Artsbus)



#ALL 

#All 

Allrep<-ts(All$repayments, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Allrep)
Sa_Allrep<- seas(Allrep,x11 = "")
plot(Sa_Allrep)

#New Loans
Allloan<- ts(All$new_loans_mn, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Allloan)
SA_Allloan<- seas(Allloan,x11 = "")
plot(SA_Allloan)

# outstanding
Allout<- ts(All$totaloutstanding, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Allout)
Sa_Allout<- seas(Allout,x11 = "")
plot(Sa_Allout)

#loan facilities approved
Allapp<- ts(All$loanfacilitiesapproved, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Allapp)
Sa_Allapp<- seas(Allapp,x11 = "")
plot(Sa_Allapp)

#nbusinessees covered by data 

Allbus<- ts(All$nbusinessescoveredbydata, start = c(2011,7), end = c(2017,3), frequency = 12)
plot(Allbus)
Sa_Allbus<- seas(Allbus,x11 = "")
plot(Sa_Allbus)



###Combined Plot for SA_Repayments 

par(mfrow=c(3,4))
plot(Sa_AgriRep)
plot(Sa_Utilitiesrep)
plot(Sa_Manufacturingrep)
plot(Sa_Constructionrep)
plot(Sa_Traderep)
plot(Sa_Accommodationrep)
plot(Sa_ITrep)
plot(Sa_Financerep)
plot(Sa_Educationrep)
plot(Sa_Healthrep)
plot(Sa_Artsrep)
plot(Sa_Allrep)


###combined plot for SAnew loans 
par(mfrow=c(3,4))
plot(SA_Agriloan)
plot(SA_UtilitiyLoan)
plot(SA_ManufacturingLoan)
plot(SA_Constructionloan)
plot(SA_Tradeloan)
plot(SA_Accommodationloan)
plot(SA_ITloan)
plot(SA_Financeloan)
plot(SA_Educationloan)
plot(SA_Healthloan)
plot(SA_Artsloan)
plot(SA_Allloan)


###Combined plot for SAoutstanding 
par(mfrow=c(3,4))
plot(Sa_Agriout)
plot(Sa_UtilityOut)
plot(Sa_ManufacturingOut)
plot(Sa_Constructionout)
plot(Sa_Tradeout)
plot(Sa_Accommodationout)
plot(Sa_ITout)
plot(Sa_Financeout)
plot(Sa_Educationout)
plot(Sa_Healthout)
plot(Sa_Artsout)
plot(Sa_Allout)


##combined plot for SAloan facilities approved 

par(mfrow=c(3,4))
plot(Sa_Agriapp)
plot(Sa_Utilityapp)
plot(Sa_Manufacturingapp)
plot(Sa_Constructionapp)
plot(Sa_Tradeapp)
plot(Sa_Accommodationapp)
plot(Sa_ITapp)
plot(Sa_Financeapp)
plot(Sa_Educationapp)
plot(Sa_Healthapp)
plot(Sa_Artsapp)
plot(Sa_Allapp)
 
#combined plot for SA n bus covered 
par(mfrow=c(3,4))
plot(Sa_Agrinbus)
plot(Sa_Utilitybus)
plot(Sa_Manufacturingbus)
plot(Sa_Constructionbus)
plot(Sa_Tradebus)
plot(Sa_Accommodationbus)
plot(Sa_ITbus)
plot(Sa_Financebus)
plot(Sa_Educationbus)
plot(Sa_Healthbus)
plot(Sa_Artsbus)
plot(Sa_Allbus)


##The below can be used to test for seasonality. 
#Creates a data.frame of the SA manufacturingapp 
test1<- as.data.frame(Sa_Manufacturingapp)
#lets us view it 
View(test1)
# produces a month plot of the detrended data for manufacturingapp 
monthplot(test1$seasonaladj)



#A further test for seasonality is  findfrequency(x)


#combined findfrequency for Repayments

findfrequency(AgriRep)
findfrequency(Utilitiesrep)
findfrequency(Manufacturingrep)
findfrequency(Constructionrep)
findfrequency(Traderep)
findfrequency(Accommodationrep)
findfrequency(ITrep)
findfrequency(Financerep)
findfrequency(Educationrep)
findfrequency(Healthrep)
findfrequency(Artsrep)
findfrequency(Allrep)


###combined findfrequency for  new loans 
findfrequency(Agriloan)
findfrequency(UtilitiyLoan)
findfrequency(ManufacturingLoan)
findfrequency(Constructionloan)
findfrequency(Tradeloan)
findfrequency(Accommodationloan)
findfrequency(ITloan)
findfrequency(Financeloan)
findfrequency(Educationloan)
findfrequency(Healthloan)
findfrequency(Artsloan)
findfrequency(Allloan)



###Combined findfrequency for  outstanding 
findfrequency(Agriout)
findfrequency(UtilityOut)
findfrequency(ManufacturingOut)
findfrequency(Constructionout)
findfrequency(Tradeout)
findfrequency(Accommodationout)
findfrequency(ITout)
findfrequency(Financeout)
findfrequency(Educationout)
findfrequency(Healthout)
findfrequency(Artsout)
findfrequency(Allout)


##combined findfrequency for loan facilities approved 
findfrequency(Agriapp)
findfrequency(Utilityapp)
findfrequency(Manufacturingapp)
findfrequency(Constructionapp)
findfrequency(Tradeapp)
findfrequency(Accommodationapp)
findfrequency(ITapp)
findfrequency(Financeapp)
findfrequency(Educationapp)
findfrequency(Healthapp)
findfrequency(Artsapp)
findfrequency(Allapp)



#combined findfrequency for n bus covered 
findfrequency(Agrinbus)
findfrequency(Utilitybus)
findfrequency(Manufacturingbus)
findfrequency(Constructionbus)
findfrequency(Tradebus)
findfrequency(Accommodationbus)
findfrequency(ITbus)
findfrequency(Financebus)
findfrequency(Educationbus)
findfrequency(Healthbus)
findfrequency(Artsbus)
findfrequency(Allbus)

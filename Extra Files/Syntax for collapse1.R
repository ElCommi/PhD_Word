##Installing the requried packages! 

install.packages(foreign)
require(foreign)
library(foreign)
library(dplyr)
library(readxl)

#reading file
Renamed_Bank_Recode <- read_excel("E:/Renamed Bank Recode.xlsx")
attach(Renamed_Bank_Recode)

install.packages("data.table")
library(data.table)
#creating a new version of my datafile
Test1<- data.table(Renamed_Bank_Recode, key="ID1")

#making a new test file.  Then collapsing values by ID1. summing Repayments, total outstanding, loan approved, n business.
#Keeping month, size, year, the same
Test4<- Test1[, list(`New Loans £mn` = sum(`New Loans £mn`),
              Month=Month,
              Year=Year,
              Size=Size,
              Enterprise=Enterprise,
              repayments=sum(repayments),
             `Total Outstanding`=sum(`Total Outstanding`),
             `Loan Facilities Approved`=sum(`Loan Facilities Approved`),
             `N Businesses covered by data`=sum(`N Businesses covered by data`)), by=ID1,]
#this creates duplicate entries.  In order to remove duplicates. 
test5<- Test3[!duplicated(ID1),]


write.csv(BankFinal, "BankFinal.csv"
          
#making new file for AWE
require(foreign)
install.packages(foreign)  
library(readxl)
AWE_Recoded <- read_excel("E:/Ready to collapse/AWE Recoded.xls")
attach(AWE_Recoded)
AWE1<- data.table(AWE_Recoded, key="ID1")
          ####dont forget geometric average####
          #Made a function for Geometric mean#

gm_mean = function(x, na.rm=TRUE){
  exp(sum(log(x[x > 0]), na.rm=na.rm) / length(x))
}

            #Adding 2nd AWE variable
            AWE1$AvgWE1<- `Average Weekly Earnings`
            attach(AWE1)
            
            AWE2<- AWE1[, list (`Average Weekly Earnings`= mean(`Average Weekly Earnings`),
                                AvgWE1=gm_mean(`Average Weekly Earnings`),
                                Month=Month,
                                Year=Year,
                                Enterprise=Enterprise), by=ID1,]
            AWE3<- AWE2[!duplicated(ID1),]
            
            write.csv (AWE3, "AWEFinal.CSV")
                      
                      
                      
                      
                      #Similiar file for Buscount. 
                      
                      #Bus Count 
                      
                      library(readxl)
                      UK_Business_Count <- read_excel("E:/Ready to collapse/UK Business Count.xlsx")
                      detach(AWE_Recoded)
                      attach(UK_Business_Count)
                      Bus1<-data.table(UK_Business_Count, key="ID3")
                      Bus2<- Bus1[, list (`N All Business`= sum(`N All Business`),
                                          `N Small bus`= sum(`N Small bus`),
                                          `N Medium Bus`= sum(`N Medium Bus`),
                                          Year=Year,
                                          Industry=Industry), by=ID3,]
                      Bus3<- Bus2[!duplicated(ID3),]
                      
                      write.csv(Bus3, "BUSFinal.csv")
                                
                                #employment
                                REcode_Employment <- read_excel("E:/Ready to collapse/REcode Employment.xlsx")
                                View(REcode_Employment) 
                                Empl1<- data.table(REcode_Employment, key="Id3")
                                detach(recode_buscount)
                                attach(Empl1)
                                
                                Empl2<- Empl1[, list (`Total Employees`= sum(`Total Employees`),
                                                      `FT Employment`= sum(`FT Employment`),
                                              `Part-Time Employment`= sum(`Part-Time Employment`),
                                              Employment= sum(Employment),
                                                      Year=Year,
                                                      Enterprise=Enterprise), by=Id3,]
                                Empl3<- Empl2[!duplicated(Id3),]
                                write.csv(Empl3, "emplFinal.csv")
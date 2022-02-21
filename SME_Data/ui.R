

# merged_file_gdp_merged$Obs <-
#   as.yearmon(paste(
#     merged_file_gdp_merged$year,
#     merged_file_gdp_merged$month,
#     sep = "-"
#   ))
# head(merged_file_gdp_merged$Obs)
# plot(merged_file_gdp_merged$repayments ~ merged_file_gdp_merged$Obs)
# 
# install.packages("openxlsx")
# library("openxlsx")
# require(openxlsx)
# write.xlsx(merged_file_gdp_merged,
#            "C:/Users/40050761/Desktop/Version 3/Univariate")
# 
# 
# ##Adding value labels
# 
# merged_file_gdp_merged$enterprise <-
#   factor(
#     merged_file_gdp_merged$enterprise,
#     levels = c(
#       1,
#       2,
#       3,
#       4,
#       5,
#       6,
#       7,
#       8,
#       9,
#       10,
#       11,
#       12,
#       21,
#       22,
#       23,
#       24,
#       25,
#       26,
#       27,
#       28,
#       29,
#       30,
#       31,
#       32
#     ),
#     labels = c(
#       "Small Agriculture",
#       "Small Utilities",
#       "Small Manufacturing",
#       "Small Construction",
#       "Small Trade",
#       "Small Accomodation",
#       "Small IT",
#       "Small Finance",
#       "Small Education",
#       "Small Health",
#       "Small Arts",
#       "All Small",
#       "Medium Agriculture",
#       "Medium Utilities",
#       "Medium Manufacturing",
#       "Medium Construction",
#       "Medium Trade",
#       "Medium Accomodation",
#       "Medium IT",
#       "Medium Finance",
#       "Medium Education",
#       "Medium Health",
#       "Medium Arts",
#       "All Medium"
#     )
#   )


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))

library(shinydashboard)
ui <- dashboardPage(
  dashboardHeader(title = "SME Data"),
  dashboardSidebar(),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      box(selectInput(
        "business_type",
        label = h3("Select Business Type"),
        choices = list(
          "Small Agriculture" = "Small Agriculture",
          "Small Utilities" = "Small Utilities",
          "Small Manufacturing" = "Small Manufacturing",
          "Small Construction" = "Small Construction",
          "Small Trade" = "Small Trade",
          "Small Accomodation" = "Small Accomodation",
          "Small IT" = "Small IT",
          "Small Finance" = "Small Finance",
          "Small Education" = "Small Education",
          "Small Health" = "Small Health",
          "Small Arts" = "Small Arts",
          "All Small" = "All Small",
          "Medium Agriculture" = "Medium Agriculture",
          "Medium Utilities" = "Medium Utilities",
          "Medium Manufacturing" = "Medium Manufacturing",
          "Medium Construction" = "Medium Construction",
          "Medium Trade" = "Medium Trade",
          "Medium Accomodation" = "Medium Accomodation",
          "Medium IT" = "Medium IT",
          "Medium Finance" = "Medium Finance",
          "Medium Education" = "Medium Education",
          "Medium Health" = "Medium Health",
          "Medium Arts" = "Medium Arts",
          "All Medium" = "All Medium"
        ),
        selected = 1
      ),
      
      selectInput("finance_type",label = h3("Select Finance Variable"),
                  choices = list("Repayments" = "repayments",
                                 "Total Outstanding Loans" = "totaloutstanding",
                                 "Loan Facilities Approved" = "loanfacilitiesapproved",
                                 "New Loans £mn" = "new_loans_mn"
                  )),
      
      selectInput("smoothing_applied", label = h3("Apply Smoothing"), 
                  choices = list("No" = 1, "Yes" = 2), 
                  selected = 1)
      ),
      box(plotOutput("time_series_finance")),
      box(selectInput("employment_variable",label = h3("Select Earnings Variable"),
                      choices = list("Average Weekly Earnings" = "averageweeklyearnings",
                                     "Adjusted Average Weekly Earnings" = "avgwe1"
                      )),
          
          selectInput("smoothing_applied1", label = h3("Apply Smoothing"), 
                      choices = list("No" = 1, "Yes" = 2), 
                      selected = 1)),
      box(plotOutput("earnings"))
      
    )
  )
)

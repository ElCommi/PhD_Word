


# Tab 1: SME Lending Data Uni Variate -------------------------------------

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  #theme = shinytheme("flatly"), Themescurrently broken, check back later.
  
  
  # Application title
  titlePanel("SME Lending Data"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(sidebarPanel(
    selectInput(
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
  # Show a plot of the generated distribution
  mainPanel(plotOutput("time_series")))
))

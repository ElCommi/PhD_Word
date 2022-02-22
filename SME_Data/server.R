# Load Packages -----------------------------------------------------------
package_list <-
  list(
    "data.table",
    "dplyr",
    "foreign",
    "gganimate",
    "ggplot2",
    "ggthemes",
    "haven",
    "openxlsx",
    "readxl",
    "plotly",
    "seasonalview",
    "shiny",
    "shinythemes",
    "TTR",
    "zoo"
  )

library_packages_for_app <- function(package_list = package_list)
{
  for (package in package_list) {
    library(package, character.only = TRUE)
  }
}
library_packages_for_app(package_list)


# Wrangling Data ----------------------------------------------------------

merged_file_gdp_merged =
  read_dta("merged file gdp merged.dta")
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


merged_file_gdp_merged$Obs <-
  as.yearmon(paste(
    merged_file_gdp_merged$year,
    merged_file_gdp_merged$month,
    sep = "-"
  ))

bankdata <- merged_file_gdp_merged %>% slice(1:1656)




# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  filtered_bankdata = reactive({
    bankdata %>%
      filter(enterprise == input$business_type)
  })
  
  output$time_series =
    renderPlot({
      ggplot(filtered_bankdata(),
             aes_string(x = "Obs",
                        y = input$finance_type)) +
        geom_line(colour = "blue", show.legend = TRUE) +
        geom_smooth(show.legend = TRUE) +
        labs(
          title =  sprintf("%s For %s", input$finance_type, input$business_type),
          x = "Year Month",
          y = sprintf("%s %s", input$finance_type, 
                      if (input$finance_type != "loanfacilitiesapproved") 
            {
            "£mn"
          } else {
            ""
          })
        ) +
        theme_hc()
    })
  
})

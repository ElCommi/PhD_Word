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
    "TTR",  
    "zoo"
  )

library_packages_for_app(package_list)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

})

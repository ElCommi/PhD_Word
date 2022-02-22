
# Package Installation ----------------------------------------------------
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
    "zoo",
    "shiny_themes"
  )

install_packages_for_app <- function(package_list = package_list)
{
  for (package in package_list) {
    if (!package %in% installed.packages())
    {
      install.packages(package)
    }
  }
}

library_packages_for_app <- function(package_list = package_list)
{
  for (package in package_list) {
    library(package, character.only = TRUE)
  }
}

install_packages_for_app(package_list)
library_packages_for_app(package_list)



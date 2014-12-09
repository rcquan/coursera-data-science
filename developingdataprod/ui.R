require(shiny)
require(maps)
require(mapproj)
require(ggplot2)

dat <- read.csv("CHR_outcomes.csv")
map_county <- map_data("county")
map_county$region <- map_county$subregion
state_map <- map_data("state")
measures <-names(dat[,c(6:68)])

shinyUI(fluidPage(
        titlePanel("Mapping US Health Outcomes by County"),
        
        sidebarLayout(
                sidebarPanel(width = 3,
                        p("In this Shiny app, we will be mapping county health outcomes
                          and demographic data aggregated from sites across the United States,
                          using the dataset provided by",
                          a("County Health Rankings,", href = "http://www.countyhealthrankings.org/rankings/data"),
                          "a Robert Wood Johnson Foundation program."),
                        p("In the GitHub directory, you will find the pre-processing R script that prepared the",
                          a("2014 CHR CSV Analytic Data", href = "http://www.countyhealthrankings.org/sites/default/files/2014%20CHR%20analytic%20data.csv"),
                          "for mapping with", code("ggplot2"), "."),
                        p("For more information on the outcome measures, please check out the",
                          a("codebook", href = "http://www.countyhealthrankings.org/sites/default/files/2014%20CHR%20analytic%20data%20documentation.pdf"),
                          "on CHR's website."),
                        br(),
                        helpText("To begin, choose a health outcome or demographic measure to map."),
                        selectInput(inputId = 'measures',
                                    label = 'Measurement:',
                                    choices = measures)
                        ),
                
                mainPanel(
                        h3("2014 US County Health Rankings Map"),
                        textOutput('text'),
                        plotOutput('plotmap', height = "600px")))
        ))
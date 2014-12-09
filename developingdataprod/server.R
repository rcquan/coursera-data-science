require(shiny)
require(maps)
require(mapproj)
require(ggplot2)

dat <- read.csv("CHR_outcomes.csv")
map_county <- map_data("county")
map_county$region <- map_county$subregion
state_map <- map_data("state")
measures <- names(dat[,c(6:68)])

plot_map <- function(outcome){
        
        usmap <- ggplot(outcome, aes(map_id = region)) + 
                geom_map(map = map_county, aes(fill = measure)) + 
                expand_limits(x = map_county$long, y = map_county$lat) +
                # change map projection
                coord_map("polyconic", xlim = c(-120, -71)) + 
                scale_fill_gradient(high = "#132B43", low = "#56B1F7",
                                    name = "value") +
                theme(axis.text=element_blank(),
                      axis.ticks=element_blank(),
                      axis.title=element_blank(),
                      panel.grid.major=element_blank(),
                      panel.background=element_blank()) +
                # put borders around state
                geom_path(data = state_map, aes(x = long, y = lat), 
                          colour = "black") 
        
        print(usmap)

}

shinyServer(function(input, output){
        
        output$text <- renderText({
                paste("You have chosen to map", input$measures, ". Missing values \n
                      are marked in gray.")
        })
        # create new data frame upon new selectInput
        plot_data <- reactive({
                data.frame(region = dat$county,
                           measure = dat[, input$measures],
                           stringsAsFactors = FALSE)
        })
        
        output$plotmap <- renderPlot({
                plot_map(plot_data())
        })
        
})
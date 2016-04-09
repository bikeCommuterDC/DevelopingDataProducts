library(shiny)
library(ggplot2)


shinyServer(function(input, output){
        
        selectedData <- reactive({
                mtcars[,c(input$xcol,input$plotColor,"mpg")]
        })

        output$plot <- renderPlot({
                
                data <- selectedData()
                
                names(data) <- c("Selected.Variable","Plot.Color","Miles.Per.Gallon")
                
                ggplot(data, aes(Selected.Variable,Miles.Per.Gallon))+
                        geom_point(aes(color = Plot.Color),size = 5)+
                        geom_smooth(method = lm)+
                        theme(axis.text.x = element_text(size = 14),
                              axis.text.y = element_text(size = 14),
                              axis.title.x = element_text(size = 14),
                              axis.title.y = element_text(size = 14))
                
        })
        
        output$text1 <- renderText({
                lm1 <- lm(selectedData())
                
                paste0("The r-squared value is: ",round(summary(lm1)$r.squared, digits = 4))
        })

        
})
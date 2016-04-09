library(shiny)
library(ggvis)

shinyUI(pageWithSidebar(
        headerPanel('Modeling MPG with Mtcar Variables'),
        sidebarPanel(
                h3("Documentation"),
                h5('This application allows the user to model mpg using other variables in the mtcars dataset.
                   To select the independent variable for modeling, use the "Select indpendent variable" dropdown.
                   The "Select plot color variable" dropdown allows the user to see the relationship of a third variable in relation to 
                   mpg and the independent variable.'),
                selectInput('xcol', 'Select independent variable:', names(mtcars), selected = 'wt'),
                selectInput('plotColor', 'Select plot color variable:', names(mtcars), selected = 'cyl'),
                textOutput('text1')
        ),
       mainPanel(
                plotOutput("plot")
        )
))


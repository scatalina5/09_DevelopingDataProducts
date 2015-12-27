library(shiny)
library(datasets)
library(ggplot2)
library(data.table)
library(markdown)

data(mtcars)
data_var <- colnames(mtcars)

shinyServer(
  function(input, output) {

   output$owt1  <- renderPrint({input$iwt[1]})
   output$owt2  <- renderPrint({input$iwt[2]})
   output$ocyl  <- renderPrint({input$icyl})
   output$oam   <- renderPrint({input$iam})
   output$ogear <- renderPrint({input$igear})

   select.mtcars <- reactive({
	mtcars_sel <- subset(mtcars, mtcars$cyl %in% input$icyl & mtcars$am %in% input$iam & mtcars$gear %in% input$igear
		& mtcars$wt >= input$iwt[1]/1000 & mtcars$wt <= input$iwt[2]/1000)
	mtcars_sel
   })
 
   output$owtmean <- renderPrint({
	data <- select.mtcars()
	mean(data$wt)*1000
   })

   output$ompgmean <- renderPrint({
	data <- select.mtcars()
	mean(data$mpg)
   })

   output$cartable = renderDataTable({
  	select.mtcars()
   }, options = list(bFilter = FALSE, paging = FALSE))

   output$mtcars_mpg <- renderPlot(
    	{
    	data <- select.mtcars()
      
    	title <- paste("mtcars DataSet")
	g <- ggplot(data = data, aes(y = mpg, x = wt,))
	g <- g + geom_point(size = 4)
	g <- g + labs(x = "Weight (lbs/1000)") + labs(y = "Miles per (US) Gallon") 
	g <- g + labs(title = title)
	print(g)
  })
  
})

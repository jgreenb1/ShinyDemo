library(shiny)

ui<-fluidPage(
	h1("I am Jon"),
	sidebarLayout(
		sidebarPanel(
			selectInput("variable1","Choose a dataset:",
				choices=ls(package:datasets),
				selected="pressure")),
		mainPanel(
			tabsetPanel(
				tabPanel("Str",verbatimTextOutput("dump")),
				tabPanel("Plot",plotOutput("plot")),
				tabPanel("Table",tableOutput("table"))
				)
			)
		)
)

server<-function(input,output,session)
	{
	output$dump<-renderPrint({
		dataset<-get(input$variable1,"package:datasets",inherit=FALSE)
		str(dataset)})

	output$plot<-renderPlot({
		dataset<-get(input$variable1,"package:datasets",inherit=FALSE)
		plot(dataset)})

	output$table<-renderTable({
		dataset<-get(input$variable1,"package:datasets",inherit=FALSE)
		dataset})
	}

shinyApp(ui,server)
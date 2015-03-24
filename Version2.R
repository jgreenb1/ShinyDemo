library(shiny)

ui<-"I am Jon"

server<-function(input,output,session){}

shinyApp(ui,server)library(shiny)

ui<-fluidPage(
	h1("I am Jon"),
	sidebarLayout(
		sidebarPanel(
			selectInput("dataset","Choose a dataset:",
				choices=ls(package:datasets),
				selected="pressure")),
		mainPanel(
			verbatimTextOutput("dump"),
			plotOutput("plot")))
)

server<-function(input,output,session)
	{
	output$dump<-renderPrint({
		dataset<-get(input$dataset,"package:datasets",inherit=FALSE)
		str(dataset)})
	}

shinyApp(ui,server)
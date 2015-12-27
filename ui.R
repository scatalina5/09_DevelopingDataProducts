shinyUI(
  navbarPage("MTCARS Dataset Explorer",
	tabPanel("Data",
             	sidebarPanel(
			sliderInput("iwt", "Weight", min = 1500, max = 5500, value = c(1500, 5500), step = 10),
			checkboxGroupInput("icyl", "Cylinders", c("4" = 4, "6" = 6, "8" = 8), selected = c(4,6,8), inline=TRUE),
			checkboxGroupInput("iam", "Transmission", c("auto (0)" = 0, "man (1)" = 1), selected = c(0,1), inline=TRUE),			checkboxGroupInput("igear", "Gears", c("3" = 3, "4" = 4, "5" = 5), selected = c(3,4,5), inline=TRUE)
			),
                      
  		mainPanel(
			h4('Inputs Variables'),
			h5('Weight Range'),verbatimTextOutput("owt1"),verbatimTextOutput("owt2"),
			h5('Cylinders Selected'),verbatimTextOutput("ocyl"),
			h5('Transmissions Selected'),verbatimTextOutput("oam"),
			h5('Gears Selected'),verbatimTextOutput("ogear"),
			
			h4('Mean Weight for Selected Cars'),verbatimTextOutput("owtmean"),
			h4('Mean MPG for Selected Cars'),verbatimTextOutput("ompgmean"),

			h4('Plot of weight vs MPG'),plotOutput("mtcars_mpg"),

			h4('Table of Selected mtcars Data'),dataTableOutput(outputId="cartable")
            		
		)
	),
                                                     
  	tabPanel("README",mainPanel(includeMarkdown("README.md"))
	)
  )
)

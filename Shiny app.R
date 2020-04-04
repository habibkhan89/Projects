#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)


# Header
header <- dashboardHeader(title= "Dashboard", dropdownMenuOutput("msgOutput"), # dropdownMenuOutput helps to import messages automatically

                          # Creating notifications
                          dropdownMenu(type = "notifications",
                                       notificationItem(
                                         text= "2 new tabs were added to the dashboard",
                                         icon = icon("dashboard"),
                                         status = "success"
                                       ))
# Manual Messages
                          # dropdownMenu(
                          #   type = "message",
                          #   messageItem(from= "Finance update", message = "Budget needs to be revised"),
                          #   messageItem(from= "Supply chain dept", message= "We are out of stock", icon= icon("bar-chart")),
                          #   messageItem(from= "Sales update", message = "Sales meeting at 6 PM on Monday", icon= icon("handshake-o"), time= Sys.time()) # fontawesome.io/icons for icons
                          # )
                          )


# Sidebar
sidebar <- dashboardSidebar(
  sidebarMenu( # This creates menu option for "options" listed below
    sidebarSearchForm("SearchText1", "buttonsearch1", "Search here"),
  menuItem("Dashboard", tabName = "dashboard_tn", icon = icon("dashboard")), # Icon function inserts icons. Use ?icon to search
    menuSubItem("D1", tabName = "D1_tn"),
    menuSubItem("D2", tabName= "D2_tn"),
  menuItem("Detailed Analysis", badgeLabel = "New_1", badgeColor = "green"), # Badge functions are used to highlight if required(optional)
  menuItem("Raw Data"),
  sliderInput("bins1", "Number of Breaks", 1, 100, 50), # Connect this in server with db to search from file
  textInput("text_input", "Search Opportunities", value= " ") # Connect this in server with db to search from file
))


# Body
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard_tn",

            ## Creating KPIs
  fluidRow(
    infoBox("sales", 1000, icon= icon("thumbs-up")),
    infoBox("Number of People Hired", 13, icon = icon("check-circle")),
    infoBox("Sales Target in %", paste("20%"), icon= icon("handshake"))
  ),
  fluidRow(
      box(title = "Histogram of faithful dataset", status = "primary", solidHeader = TRUE,  plotOutput("histogram1")), # Check status and solidheader if don't remember
      box(title = "Controls for Dashboard", status= "warning", solidHeader = TRUE, tableOutput("Summary1"))
      )),
    tabItem(tabName = "D1_tn", 
      h1("Dashboard for D1")),
    tabItem(tabName= "D2_tn",
      h1("Dashboard for D2"))
    )
  )


# Create the UI using the header, sidebar, and body
ui <- dashboardPage(header, sidebar, body)




# Server
server <- function(input, output) {
  output$histogram1 <- renderPlot({
    hist(faithful$eruptions, col= "red", breaks= input$bins1)
    
  })
  output$Summary1 <- renderTable(head(faithful))

  # Creating function to read messages directly from file 
  output$msgOutput <- renderMenu({
    msgs_file <- apply(read.csv("messages.csv"), 1, function(row){
      messageItem(from= row[["from"]], message= row[["message"]])
    })
  
  # Now let's convert the messages as dropdown to show them as list on right side
  dropdownMenu(type= "messages", .list = msgs_file) # .list will read all the messages and we don't have to show each message one by one
    
  })
}

shinyApp(ui, server)


# Created plot for testing

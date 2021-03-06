# shinyUI(fluidPage(
#   titlePanel(fluidRow(column(12,"Fog Detection from Camera Images"))),
#   sidebarLayout(
#     sidebarPanel(
#       fileInput(inputId = 'file', 
#                 label = 'Select an Image',
#                 multiple = TRUE,
#                 accept=c('image/png', 'image/jpeg')),
#      h5(strong("Analyze the image selected")),
#       actionButton("goButton", "Analyze the image")
#       #look here fr enable/disable buttons
#       #https://stackoverflow.com/questions/40621393/disabling-buttons-in-shiny
#     ),
#     mainPanel(
#       h4("The app works as follows..."),
#       tableOutput('files'),
#       uiOutput('images')
#     )
#   )   
# ))


library(shinydashboard)


dashboardPage(
  
  dashboardHeader(title = "Fog Detection from Camera Images", titleWidth = 500),
  dashboardSidebar(width = 500,  h4("The goal of this app is to illustrate 
                                    the detection of fog conditions from camera images DataLab project."),
                   h5("Select a file in the upload menu below and then click \"Analyze the image\" 
                      to have an automatic answer of the presence of fog." ),
    fluidRow(
     #shinyjs::useShinyjs(),
      #sess <- getSession(),
      #id <- sess$ns(id),
      #shinyjs::toggleState('goButton'),
      
      #shinyjs::disable("goButton"),
     
    res<-fileInput(inputId = 'file', 
              label = 'Select an Image',
              multiple = TRUE,
              accept=c('image/png', 'image/jpeg'))
    #if(){
              
    #}
    #look here fr enable/disable buttons
    #https://stackoverflow.com/questions/40621393/disabling-buttons-in-shiny
  ),
  
  
  
  #print(output$file),
  conditionalPanel(condition='output.visButton!=0',
  h5(strong("Analyze the image selected")),
  actionButton("goButton", "Analyze the image"),
  h6("The fog condion is considered when the visibility is less than 250m according to the reference measurement of the MOR 
     horizontal scatterometer."))
  
  
  
  #enable this text once the image is selected
  
  ),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    tabsetPanel(
      tabPanel("Analysis",tableOutput('files'),
               fluidRow(column(12,uiOutput('images')
               )),
               fluidRow(column(12,
               uiOutput("FOG")))
               ),
      tags$style(type='text/css', "#FOG { margin-top: 300px; text-align: center; font-size: 80px; font-family: Comic Sans MS, cursive, sans-serif;}"),
      
      
      
      tabPanel("Approach description", 
               h4("The analysis to determine the presence of fog is done using a supervised machine learning approach. In such approach first a set of", 
                  strong("features"), "are identified that are used to discriminate a foggy situation.", 
                  p("In this case typical element of an image are used as features:"),
                 HTML("<li>Mean Edges: for finding the boundaries of objects within images. It works by detecting discontinuities in the image (e.g., foreground and background elements).</li>
<li>Mean Brightness: perception of a source of radiating/reflecting light.</li>
<li>Mean Saturation: is a measure of the purity of the color. The purest (most saturated) color is achieved by using just one wavelength, less pure come from a combination at different wavelengths.</li>
<li>Mean HUE: perception of a source of being similar to one of the perceived colors: red, yellow, green, and blue, or to a combination of two of them.</li>
<li>Fractal Dimension: self similarity in filling space.</li>
<li>Transmission smoothness: transmission of the darkchannel of the image (smoothed indicator).</li>
<li>Transmission changepoint: horizontal point where the transmission of the dark channel is subject to change.</li>"),
                 p(HTML("Once the features are extracted from the images, a Random Forest classifier is trained using as 
                   labels for the fog/no fog classification the observations of the meteorological optical range 
                   through a  forward scatterometer. <strong>The label fog is assigned when the visibility is less than 250m, 
                   whereas the label no-fog is assigned otherwise. </strong>")
                  ),
                 p("For this applicaiton the Random Forest method is applied to train the model on the data from 2016 of the De Bilt 
                   camera (+23000 pictures). To test the model, the pictures provided in the analysis directory
                   are a subset of the pictures of 2015.")
    )
    
           
    )
  )
)
)
#)






# fluidPage(
#   
#   title = "Diamonds Explorer",
#   
#   plotOutput('plot'),
#   
#   hr(),
#   
#   fluidRow(
#     column(3,
#            h4("Diamonds Explorer"),
#            sliderInput('sampleSize', 'Sample Size', 
#                        min=1, max=nrow(dataset), value=min(1000, nrow(dataset)), 
#                        step=500, round=0),
#            br(),
#            checkboxInput('jitter', 'Jitter'),
#            checkboxInput('smooth', 'Smooth')
#     ),
#     column(4, offset = 1,
#            selectInput('x', 'X', names(dataset)),
#            selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
#            selectInput('color', 'Color', c('None', names(dataset)))
#     ),
#     column(4,
#            selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
#            selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
#     )
#   )
# )
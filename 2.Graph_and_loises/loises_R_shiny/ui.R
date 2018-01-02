
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # Заголовок для визуализации
  titlePanel("Циркуляция лайков на иканаме"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      helpText("Хотите узнать кто кого лайкает?"),
      
      textInput("name", h5("Введите имя или id пользователя"), 
                value = "Гусевская Алина"),
      
      selectInput("var_L", 
                  label = "Что будем изучать?",
                  choices = c('Все лайки', 'Все лайкопосты', 'Стена лайки',
                              'Стена лайкопосты', 'Фотки лайки', 'Фотки лайкопосты'),
                  selected = 'лайки')
      
    ),
    
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot1",width = '800px',height = "350px"),
      br(),
      plotOutput(outputId = "distPlot2",width = '800px',height = "350px")
      
    )
  )
)




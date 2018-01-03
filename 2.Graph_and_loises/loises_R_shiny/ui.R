
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # Заголовок для визуализации
  titlePanel("Циркуляция лайков на иканаме"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      helpText("Хотите узнать кто кого лайкает? Введите ниже либо имя человека, 
                которое он указал на своей странице, либо номер его id."),
      
      textInput("name", h5("Введите имя или id пользователя"), 
                value = "Beerman Dr"),
      
      selectInput("var_L", 
                  label = "Что будем изучать?",
                  choices = c('Все лайки', 'Все лайкопосты', 'Стена лайки',
                              'Стена лайкопосты', 'Фотки лайки', 'Фотки лайкопосты'),
                  selected = 'Все лайки'),
      

      
      br(),
      "Визуализация сделана в рамках",
      a(href="https://fulyankin.github.io/ekenam_grand_research/","Иканам гранд рисёрча."),
      "Хочешь больше? Переходи по ссылке!",
      br()
      
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




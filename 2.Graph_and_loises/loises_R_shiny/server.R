# Эта часть скрипта контролирует интерфейс

library('shiny')
library('ggplot2')

# Соответствие id именам 
uid_names <- read.delim("uid_names.csv", header=FALSE, stringsAsFactors=FALSE)

library('RcppCNPy')
L <- npyLoad("L.npy")
L_abs <- npyLoad("L_abs.npy")
L_wall <- npyLoad("L_wall.npy")
L_wall_abs <- npyLoad("L_wall_abs.npy")
L_photo <- npyLoad("L_photo.npy")
L_photo_abs <- npyLoad("L_photo_abs.npy")

# Подгружаем вспомогательные функции 
source("helper.R")


# Серверные вычисления и всё такое... 
server <- function(input, output) {
  
output$distPlot1 <- renderPlot({
  
  # Выбираем матрицу
  if(input$var_L == 'Все лайки'){
    L_cur <- L_abs
  } else if(input$var_L == 'Все лайкопосты'){
    L_cur <- L
  } else if(input$var_L == 'Стена лайки'){
    L_cur <- L_wall_abs
  } else if(input$var_L == 'Стена лайкопосты'){
    L_cur <- L_wall
  } else if(input$var_L == 'Фотки лайки'){
    L_cur <- L_photo_abs
  } else if(input$var_L == 'Фотки лайкопосты'){
    L_cur <- L_photo
  }
  
  name <- input$name 
  
   # Делаем рассчёты
  lst = like_me(name, uid_names, L_cur)
  likes_plot(lst[[1]], paste(name,'ставит лайки',sep=' '))
})

output$distPlot2 <- renderPlot({
  
  # Выбираем матрицу
  if(input$var_L == 'Все лайки'){
    L_cur <- L_abs
  } else if(input$var_L == 'Все лайкопосты'){
    L_cur <- L
  } else if(input$var_L == 'Стена лайки'){
    L_cur <- L_wall_abs
  } else if(input$var_L == 'Стена лайкопосты'){
    L_cur <- L_wall
  } else if(input$var_L == 'Фотки лайки'){
    L_cur <- L_photo_abs
  } else if(input$var_L == 'Фотки лайкопосты'){
    L_cur <- L_photo
  }
  
  name <- input$name 
  
  # Делаем рассчёты
  lst = like_me(name, uid_names, L_cur)
  likes_plot(lst[[2]], paste(name,'получает лайки',sep=' '))
})
    
  
}




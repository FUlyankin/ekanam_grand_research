
library('ggplot2')
library('repr')
options(repr.plot.width=10, repr.plot.height=3)


like_me <- function(name, uid_names, L){
  # id по имени
  if(length(strsplit(name, ' ')[[1]]) == 2){
    user = uid_names[1,][uid_names[2,] == name]
  }else{
    # id по id
    user = name
  }
  
  # Определяем интересующую нас позицию 
  i = which(uid_names[1,] == user)
  
  li = L[i,] # лайкаю я 
  df_i <- data.frame(t(rbind(uid_names[2,], li)))
  names(df_i) <- c('users','loises')
  df_i$loises <- as.numeric(as.vector(df_i$loises))
  df_i <- df_i[order(df_i$loises,decreasing = TRUE),]
  
  
  lj = L[,i] # лайкают меня
  df_j <- data.frame(t(rbind(uid_names[2,], lj)))
  names(df_j) <- c('users','loises')
  df_j$loises <- as.numeric(as.vector(df_j$loises))
  df_j <- df_j[order(df_j$loises,decreasing = TRUE),]
  
  return( list(df_i, df_j))
}


likes_plot <- function(df_ii, title){
  ggplot(df_ii[1:30,], aes(x=reorder(users, -loises),  y=loises)) + 
    geom_bar(stat="identity", width=.8, fill="#377EB8") + 
    labs(title= title, 
         x = ' ',
         y = ' '
    ) +
    theme(axis.text.x = element_text(angle=90, vjust=0.3,size=12),
          plot.title = element_text(hjust = 0.5, size = 20))
}






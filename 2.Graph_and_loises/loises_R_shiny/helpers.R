


percent_map <- function(var1,var2,russia_df,alldata,subj_id){

  # Выделяем какой-нибудь один продукт 
  curent_data <- alldata[alldata$X.3 == var1,][-1,]
  stat <- data.frame( )
  I_want_some_data <- paste0('curent_data$','"',var2,'"')
  stat <- data.frame('NAME' = as.vector(curent_data$X.1),'TEST_DATA'= eval(parse(text = I_want_some_data)))
  
  map.data <- merge(stat,subj_id,by='NAME')
  
  ids <- unique(russia_df$id)
  
  all_names <- c()
  all_numbers <- c()
  
  for(i in 1:length(ids)){
    current_df <- russia_df[russia_df$id == ids[i],]
    n <- nrow(current_df)
    new_elements <- map.data[map.data$ID == ids[i],]
    new_name <- rep(new_elements[1,1],n)
    new_number <- rep(new_elements[1,2],n)
    all_names <- c(all_names,as.vector(new_name))
    all_numbers <- c(all_numbers,as.vector(new_number))
  }
  map.df <- mutate(russia_df,'NAME' = all_names,'DATA' = all_numbers)

palette <- colorRampPalette(brewer.pal(11, 'RdYlBu')[10:2])

p <- ggplot() +
    geom_polygon(data = map.df, mapping = aes(x=long, y=lat, group = group, fill = DATA),
                 colour= 'grey',size = 0.01 )+
    scale_fill_gradientn(colours = palette(100), na.value='grey80', name = 'рублей')+
    coord_fixed(2.2) +
    theme(axis.line=element_blank(),
          axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          axis.title.x=element_blank(),
          axis.title.y=element_blank(),          
          legend.position = 'right',
          legend.text = element_text(colour = 'grey50',size = 10),
          legend.title = element_text(colour = 'grey50',size = 14),
          panel.spacing = unit(c(0,0,0,0), 'cm'),
          axis.ticks.length = unit(0.001, 'cm'),
          plot.margin = unit(c(-1,0,0,-0.8), 'cm'),
          panel.grid = element_blank(),
          panel.background = element_blank()
    ) +
    labs(x=NULL, y = NULL) 

p

# # Всякие разные заголовки для нашей карты 
# text.title <- 'Что-то там для чего-то там в таком-то году'
# 
# # Деление карты на две части - приближенную и уменьшенную
# p1 <- p + coord_map(projection = 'azequidist', 
#                     orientation = c(90, -10, 105), 
#                     xlim = c(26, 57), 
#                     ylim=c(47.5, 67))
# p2 <- p + coord_map(projection = 'azequidist', 
#                     orientation = c(90, 5, 95), 
#                     xlim = c(79, 155), 
#                     ylim=c(47, 90))
# p2 <- p2 + theme(legend.position = 'bottom',
#                  legend.text = element_text(colour = 'grey50'),
#                  legend.title = element_text(colour = 'grey50', 
#                                              size = 15)
# )
# 
# 
# # Setting up final graph. regions
# title = viewport(x = .5, y = .86, width = .5, height = .03)
# zoomed = viewport(x = .25, y = .47, width = .5, height = .9)
# regular = viewport(x = .75, y = .47, width = .5, height = .9)
# 
# # Прорисовка
# print(p1, vp=zoomed)
# print(p2, vp=regular)
# 
# grid.text(text.title, gp=gpar(fontsize=20, col='grey50', fontface='bold'), vp = title)
# 
# 
# grid.lines(x = c(.5, .5), y = c(.05, .8), gp=gpar(col='grey70'))
# 

}






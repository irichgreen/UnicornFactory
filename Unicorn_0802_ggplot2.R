library(ggplot2)
library(gtable)
library(grid)
p1 <- ggplot(data=df330) + geom_line(aes(x=time,y=OS.Force.Actual), color='darkred') + 
    scale_y_continuous(name="Elevation (m)") #,limits=c(75,125))

p2 <- ggplot(data=df330, colour = "RED") + 
    geom_line(aes(x=time,y=df330$Thickness.Deviation.Absolut),color='darkblue') + 
    scale_y_continuous(name="Elevation2 (m)") # + geom_point(color='darkblue')

#extract gtable
g1<-ggplot_gtable(ggplot_build(p1))
g2<-ggplot_gtable(ggplot_build(p2))

#overlap the panel of the 2nd plot on that of the 1st plot

pp<-c(subset(g1$layout, name=="panel", se=t:r))
g<-gtable_add_grob(g1, g2$grobs[[which(g2$layout$name=="panel")]], pp$t, pp$l, pp$b, pp$l)

ia <- which(g2$layout$name == "axis-l")
ga <- g2$grobs[[ia]]
ax <- ga$children[[2]]
ax$widths <- rev(ax$widths)
ax$grobs <- rev(ax$grobs)
ax$grobs[[1]]$x <- ax$grobs[[1]]$x - unit(1, "npc") + unit(0.15, "cm")
g <- gtable_add_cols(g, g2$widths[g2$layout[ia, ]$l], length(g$widths) - 1)
g <- gtable_add_grob(g, ax, pp$t, length(g$widths) - 1, pp$b)

# draw it
grid.draw(g)





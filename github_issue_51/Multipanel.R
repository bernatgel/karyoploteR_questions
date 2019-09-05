library(karyoploteR)
library(ggplotify)

pp <- getDefaultPlotParams(1)
pp$topmargin <- 500

library(cowplot)
  p1 <- as.ggplot(expression(kp <- plotKaryotype(main="Human (hg19)", plot.params = pp), kpDataBackground(kp), kpAbline(kp, h=0.5, col="red")))
  p2 <- as.ggplot(expression(kp <- plotKaryotype(genome="hg38", main="Human (hg38)", plot.params = pp), kpDataBackground(kp), kpAbline(kp, h=0.5, col="blue")))
  p3 <- as.ggplot(expression(plotKaryotype(genome = "mm10", main="Mouse", plot.params = pp)))
  p4 <- as.ggplot(expression(plotKaryotype(genome = "dm6", main="Fruit fly")))
  save_plot("Multipanel_cowplot.png", plot_grid(p1, p2, p3, p4, ncol=2, labels=LETTERS[1:9]), base_height=10)

##https://user-images.githubusercontent.com/919489/64335084-59ec7680-cfda-11e9-9976-53416bf89ed8.png

library(grid)
  p1 <- as.grob(expression(kp <- plotKaryotype(main="Human (hg19)", plot.params = pp, cex=1.5), kpDataBackground(kp), kpAbline(kp, h=0.5, col="red")))
  p2 <- as.grob(expression(kp <- plotKaryotype(genome="hg38", main="Human (hg38)", plot.params = pp), kpDataBackground(kp), kpAbline(kp, h=0.5, col="blue")))

png("Multipanel_grid.png", width=1000, height=1000)  
  grid.newpage()
  grid.draw(p1)
  vp = viewport(x=.75, y=.35, width=.4, height=.4)
  pushViewport(vp)
  grid.draw(p2)
  upViewport()
dev.off()


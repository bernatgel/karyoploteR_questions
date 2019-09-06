library(karyoploteR)
library(ggplotify)

pp <- getDefaultPlotParams(1)
pp$topmargin <- 500

library(cowplot)
p1 <- as.ggplot(expression(plotKaryotype(main="Human (hg19)", plot.params = pp)))
p2 <- as.ggplot(expression(plotKaryotype(genome="hg38", main="Human (hg38)", plot.params = pp)))
p3 <- as.ggplot(expression(plotKaryotype(genome = "mm10", main="Mouse", plot.params = pp)))
p4 <- as.ggplot(expression(plotKaryotype(genome = "dm6", main="Fruit fly")))
save_plot("Multipanel_cowplot_only_karyotypes.png", plot_grid(p1, p2, p3, p4, ncol=2, labels=LETTERS[1:9]), base_height=10)


library(cowplot)
p1 <- as.ggplot(expression(plotKaryotype(main="Human (hg19)", plot.params = pp)))
p2 <- as.ggplot(expression(plotKaryotype(genome = "mm10", main="Mouse (mm10)", plot.params = pp)))
save_plot("Multipanel_cowplot_only_karyotypes.png", plot_grid(p1, p2, ncol=2, labels=LETTERS[1:9]), base_height=5, base_aspect_ratio = 1.8)



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






library(karyoploteR)
library(ggplotify)
library(cowplot)

p1 <- as.ggplot(expression(plotKaryotype(main="Human (hg19)")))
p2 <- as.ggplot(expression(plotKaryotype(genome="hg38", main="Human (hg38)")))
p3 <- as.ggplot(expression(plotKaryotype(genome = "mm10", main="Mouse")))
p4 <- as.ggplot(expression(plotKaryotype(genome = "dm6", main="Fruit fly")))
plot_grid(p1, p2, p3, p4, ncol=2, labels=LETTERS[1:9])


library(karyoploteR)
library(ggplotify)
library(cowplot)

p1 <- as.ggplot(expression(plotKaryotype(main="Human (hg19)")))
p2 <- as.ggplot(expression(plotKaryotype(genome = "mm10", main="Mouse (mm10)")))
plot_grid(p1, p2, ncol=2, labels=LETTERS)



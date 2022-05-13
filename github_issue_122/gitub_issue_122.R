library(karyoploteR)

#Create a fake dataset
set.seed=(1234) #For reproducibility, make the random number generator return always the same number sequence
CN <- createRandomRegions(nregions=40, length.mean = 10e6, length.sd = 2e6, mask = NA)
CN$CNV_level1 <- runif(n=40, min=0, max=4)
CN$CNV_level2 <- runif(n=40, min=0, max=4)


png("github_issue_122.png", width=1200, height=500)

#Add space for the legend on the right margin
pp <- getDefaultPlotParams(4)
pp$rightmargin <- 0.20

#Create the plot
kp <- plotKaryotype(plot.type = 4, plot.params = pp, ideogram.plotter = NULL, labels.plotter = NULL)
kpAddCytobandsAsLine(kp)
kpAddChromosomeNames(kp, srt=45, cex=1)

at <- autotrack(current.track = 1, total.tracks = 2)
kpDataBackground(kp, r0=at$r0, r1=at$r1)
kpAddLabels(kp, labels = "CN1", r0=at$r0, r1=at$r1, cex=1.5, side="right")
kp <- kpHeatmap(kp, data=CN, y=CN$CNV_level1, ymin=0, ymax = 4,  colors = c("red", "white", "blue"), r0=at$r0, r1=at$r1, cex=0.3)

at <- autotrack(current.track = 2, total.tracks = 2)
kpDataBackground(kp, r0=at$r0, r1=at$r1)
kpAddLabels(kp, labels = "CN2", r0=at$r0, r1=at$r1, cex=1.5, side="right")
kp <- kpHeatmap(kp, data=CN, y=CN$CNV_level2, ymin=0, ymax = 4,  colors = c("red", "white", "blue"), r0=at$r0, r1=at$r1, cex=0.3)


#Add the legend

#Simulate a continuous legend with a tightly packed discrete legend
#with fake data
#temporarily remove all margins, so we can control with precision where to plot the legend
pars.old <- graphics::par(no.readonly = TRUE) #Save the old arams
graphics::par(mar = c(0, 0, 0, 0)+0.1, oma = c(0,0,0,0))

lgd_ = rep(NA, 101) #The legend will be created with 101 color boxes
lgd_[c(101, 50, 1)] = c(0, 2, 4) #Add the legend labels to the top, center and bottom elements
legend(x = "right",  #legend positioning (stadard base R legend, accepts named positions or numeric positions)
       legend = lgd_,
       fill = colorRampPalette(colors = c("red", "white", "blue"))(101),
       border = NA, box.lwd = NA, box.col = transparent("white", 1),
       y.intersp = 0.07,
       cex=2) #set the length of the legend

graphics::par(pars.old) #reset the original pars

dev.off()

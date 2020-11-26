library(karyoploteR)
cont.length <- sort(runif(n = 1000, min = 10000, max=100000), decreasing = TRUE)
gg <- toGRanges(data.frame(paste0("c", 1:1000), rep(1, 1000), cont.length))

pp <- getDefaultPlotParams(plot.type = 4)
pp$ideogramlateralmargin <- 0
pp$leftmargin <- 0.07

png("plot.type.4.png", width=1000, height = 300)
  kp <- plotKaryotype(genome = gg,  plot.type=4, ideogram.plotter = NULL, labels.plotter = NULL, plot.params = pp)
  kpAddCytobandsAsLine(kp)
  kpDataBackground(kp)
  kpText(kp, chr="c350", x=1, y=0.5, labels = "Your data goes here")

dev.off()

rr <- createRandomRegions(nregions = 30000, length.mean = 5000, length.sd = 2000, genome=gg, non.overlapping = FALSE)

png("plot.type.4.dens.png", width=1000, height = 300)
  kp <- plotKaryotype(genome = gg,  plot.type=4, ideogram.plotter = NULL, labels.plotter = NULL, plot.params = pp)
  kpAddCytobandsAsLine(kp)
  kpAddLabels(kp, "Contigs", data.panel = "ideogram")
  kpDataBackground(kp)
  kpAddLabels(kp, "Data Density", srt=90)
  kpPlotDensity(kp, data=rr, col="#BB22FF", window.size = 1000, border=NA)
dev.off()



png("plot.type.4.dens.filt.png", width=1000, height = 300)
  kp <- plotKaryotype(genome = gg, chromosomes=c("c1", "c2", "c3", "c10"), plot.type=4, ideogram.plotter = NULL, labels.plotter = NULL, plot.params = pp)
  kpAddCytobandsAsLine(kp)
  kpAddChromosomeNames(kp, srt=45)
  kpAddLabels(kp, "Contigs", data.panel = "ideogram")
  kpDataBackground(kp)
  kpAddLabels(kp, "Data Density", srt=90)
  kpPlotDensity(kp, data=rr, col="#BB22FF", window.size = 1000, border=NA)
  kpAddChromosomeSeparators(kp, col="blue")
dev.off()

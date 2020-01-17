library(karyoploteR)

nsamples <- 40

regs <- lapply(1:nsamples, function(i) {
  r <- createRandomRegions(length.mean=5e6, length.sd=5e6, non.overlapping=TRUE)
  r$val <- runif(length(r))
  return(r)
})

png("pseudoheatmap.png", width=1500, height = 800)
  kp <- plotKaryotype(plot.type=4)
  for(i in 1:nsamples) {
    kpPlotRegions(kp, regs[[i]], 
                  col=colByValue(value = regs[[i]]$val, colors = c("red", "white", "blue"), min = 0, max = 1),
                  r0=autotrack(i, nsamples))
  }
dev.off()



png("pseudoheatmap_enhanced.png", width=1500, height = 800)
  pp <- getDefaultPlotParams(4)
  pp$bottommargin <- 10
  pp$leftmargin <- 0.02
  pp$data1inmargin <- 3
  pp$topmargin <- 15
  kp <- plotKaryotype(plot.type=4, ideogram.plotter = NULL, labels.plotter = NULL, plot.params = pp)
  kpDataBackground(kp, col=colByChr(kp$genome, colors = c("#EEEEEE", "#999999")), data.panel = "ideogram")
  kpText(kp, chr=kp$chromosomes, x=mid(kp$genome), y=0.5, labels = gsub("chr", "", kp$chromosomes), data.panel = "ideogram")
  kpAddChromosomeSeparators(kp)
  chrY.len <- kp$chromosome.lengths["chrY"]
  for(i in 1:nsamples) {
    at <- autotrack(i, nsamples)
    kpRect(kp, chr="chrY", x0=chrY.len+25e6, x1=chrY.len+50e6, y0=0.1, y1=0.9, r0=at, col=rainbow(nsamples)[i], border=NA)
    kpAbline(kp, h=0, col="lightgray", r0=at)
    kpAddLabels(kp, labels = paste0("S", i), side = "right", r0=at, cex=1.3, label.margin = 0.02)
    kpPlotRegions(kp, regs[[i]], 
                  col=colByValue(value = regs[[i]]$val, colors = c("red", "white", "blue"), min = 0, max = 1),
                  r0=at)
  }
dev.off()
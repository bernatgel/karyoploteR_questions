


png("issue_60.png", width=800, height = 800)
  pp <- getDefaultPlotParams(6)
  pp$data2outmargin <- 100

  kp <- plotKaryotype(plot.type = 6, plot.params = pp)
  kpAddBaseNumbers(kp)
dev.off()

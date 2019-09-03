library(karyoploteR)


png("Figure1.png", width = 800, height=800)
  kp <- karyoploteR::plotKaryotype('mm10')
  granges1 <- GenomicRanges::GRanges(c('chr1', 'chr2'), c('100-200', '100-200'))
  granges2 <- GenomicRanges::GRanges(c('chr3', 'chr4'), c('100-200', '100-200'))
  karyoploteR::kpPlotRegions(kp, granges1, col = "red")
  karyoploteR::kpPlotRegions(kp, granges2, col = "green")
  
  legend(x = "bottomright", fill = c("red", "green"), legend = c("Ranges1", "Ranges2"))
dev.off()



legend(x = 0.7, y=0.15, fill = c("red", "green"), legend = c("Ranges1", "Ranges2"), border=FALSE)

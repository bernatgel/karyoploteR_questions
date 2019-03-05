library(karyoploteR)


regions <- toGRanges("regions.txt")
seqlevelsStyle(regions) <- "UCSC"

png("plot.png", width=800, height=400)
kp <- plotKaryotype(chromosomes="chr2")
kpPlotRegions(kp, data=regions)
dev.off()

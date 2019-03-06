library(karyoploteR)

gene_bed_GR <- 

Chr_sizes_GR <- toGRanges("Chr_sizes")



kp <- plotKaryotype(genome = Chr_sizes_GR, plot.type=4, ideogram.plotter = NULL, labels.plotter = NULL)
kpAddCytobandsAsLine(kp)
kpAddChromosomeNames(kp, srt=45)

ordered <- DEG_GR[order(DEG_GR$FDR, na.last = TRUE),]
fc.ymax=ceiling(max(abs(DEG_GR$logFC.GenotypeBb)))
fc.ymin=0

kpAxis(kp, ymax=fc.ymax, ymin=fc.ymin,side = 1,cex=0.5,r0 = 0.1, r1 = 0.45)
kpPlotDensity(kp, DEG_GR,r0 = 0.1,r1=0.45)
kpAddMainTitle(kp,main=title)
kpPlotRegions(kp,data = supergene_GR,col="red", r0=0,r1=0.05)
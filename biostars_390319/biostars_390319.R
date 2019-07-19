library(karyoploteR)

#read the genes data
genes.to.plot <- read.table("genes.txt", header=TRUE, sep="\t", stringsAsFactors=FALSE)
#change to order of columns and create a GRanges
genes.to.plot <- toGRanges(genes.to.plot[c(2,3,4,1)])

#Create a custom genome with only your chromosome
custom.genome <- toGRanges("4:1-135060000")

png("whole.chr.png", width=800, height=500)
  #start plotting
  kp <- plotKaryotype(genome = custom.genome)
  
  #plot genes as rectangles
  kpPlotRegions(kp, data = genes.to.plot, r0=0, r1=0.1)
  
  #and as "markers"
  kpPlotMarkers(kp, data = genes.to.plot, labels = genes.to.plot$gene, r0=0.15, r1=1)
dev.off()


png("zoom.png", width=800, height=500)
  #start plotting
  kp <- plotKaryotype(genome = custom.genome, zoom="4:1-10000")
  
  #plot genes as rectangles
  kpPlotRegions(kp, data = genes.to.plot, r0=0, r1=0.1)
  kpPlotNames(kp, data = genes.to.plot, y0=0, y1=1, labels = genes.to.plot$gene, position = "top", r0=0, r1=0.1)
  
  #and as "markers"
  kpPlotMarkers(kp, data = genes.to.plot, labels = genes.to.plot$gene, r0=0.25, r1=0.8)
dev.off()

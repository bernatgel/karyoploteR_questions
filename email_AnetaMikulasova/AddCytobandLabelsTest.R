library(karyoploteR)

png("./cytobandsLabelsTest.png", width = 800, height = 800)
  kp <- plotKaryotype(chromosomes = "chr21")
  kpAddBaseNumbers(kp)
  kpAddCytobandLabels(kp, cex=2)
dev.off()
  
png("./cytobandsLabelsTest.forceAll.png", width = 800, height = 800)
  kp <- plotKaryotype(chromosomes = "chr21")
  kpAddBaseNumbers(kp)
  kpAddCytobandLabels(kp, cex=2, force.all=TRUE)
dev.off()




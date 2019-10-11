library(karyoploteR)
library(regioneR)

BiocManager::install("BSgenome.Osativa.MSU.MSU7")

#Create 5000 regions as mock genes
genes <- createRandomRegions(5000, length.mean=3000, genome="MSU7")

kp <- plotKaryotype(genome="MSU7", plot.type=2, cex=1.6)
kp <- kpPlotDensity(kp, data=genes, col="dodgerblue")
kpAxis(kp, ymin=0, ymax=kp$latest.plot$computed.values$max.density)
kpPlotRegions(kp, data=genes, data.panel=2, col="#00000044")

png("biostars_136665.png", width=1200, height=1200)
  kp <- plotKaryotype(genome="MSU7", plot.type=2, cex=1.6)
  kp <- kpPlotDensity(kp, data=genes, col="dodgerblue")
  kpAxis(kp, ymin=0, ymax=kp$latest.plot$computed.values$max.density)
  kpPlotRegions(kp, data=genes, data.panel=2, col="#00000044")
dev.off()

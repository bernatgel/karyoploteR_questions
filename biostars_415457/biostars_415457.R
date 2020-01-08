library(karyoploteR)

#BiocManager::install("BSgenome.Athaliana.TAIR.TAIR9")

set.seed(1234)

#Simulate data
cpgs <- unlist(tileGenome(seqlengths(BSgenome.Athaliana.TAIR.TAIR9), tilewidth = 1000000))
cpgs$mean.meth <- runif(n = length(cpgs), min=0,max=1)

#You should use
#cpgs <- toGRanges("your.data.file.txt")

#Start the plot
png("biostars_415457.png", width=1000, height=1000)
  kp <- plotKaryotype(genome="TAIR9", main="Methylation level per Mb")
  kpAddBaseNumbers(kp, tick.dist = 5000000, minor.tick.dist = 1000000, add.units = TRUE, cex = 0.8)
  kpLines(kp, data=cpgs, y=cpgs$mean.meth, col="gray50")
  kpPoints(kp, data = cpgs, y=cpgs$mean.meth, cex=1.2)
  kpAxis(kp, ymin=0, ymax=100)
dev.off()

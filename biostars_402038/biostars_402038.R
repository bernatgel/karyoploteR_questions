#biostars_402038

library(karyoploteR)

#Read the data
vars <- read.table("data.txt", comment.char = "", header = TRUE)

#Build a GRanges and convert chromosome names from "1" to "chr1" 
vars <- toGRanges(vars[,c(1,2,2,3:length(vars))])
seqlevelsStyle(vars) <- "UCSC"

#Plot SNPs as Points
kp <- plotKaryotype(genome="hg19")
kpPoints(kp, data=vars, y=0.5)

#Plot SNPs as density
kp <- plotKaryotype(genome="hg19")
kpPlotDensity(kp, data=vars)




#Create images with random vars
vars <- createRandomRegions(nregions = 10000, length.mean = 1, length.sd = 0)

png("points.png", width=1000, height=1000) 
  kp <- plotKaryotype(genome="hg19")
  kpPoints(kp, data=vars, y=0.5)
dev.off()


png("density.png", width=1000, height=1000) 
  #Plot SNPs as density
  kp <- plotKaryotype(genome="hg19")
  kpPlotDensity(kp, data=vars)
dev.off()
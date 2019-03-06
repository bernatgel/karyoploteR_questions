library(karyoploteR)

png("example.png") 

custom.genome <- GRanges(seqnames="chr12",ranges=IRanges(1,300000),strand=NULL)
custom.coverage <- GRanges(seqnames=c("chr12","chr12","chr12"), ranges=c(IRanges(150000,200000),IRanges(150000,200000),IRanges(250000,260000)), strand=c("+","+","+"))
kp <- plotKaryotype(genome = custom.genome)
kpPlotCoverage(kp, data=custom.coverage)

dev.off()
kpPlotCoverage(kp, data=custom.coverage, show.0.cov=FALSE, r1=0.5)
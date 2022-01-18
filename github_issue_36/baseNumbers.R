custom.genome <- GRanges(seqnames="chr12",ranges=IRanges(300000000,300000100),strand=NULL)
custom.coverage <- GRanges(seqnames=c("chr12","chr12","chr12"), ranges=c(IRanges(300000010,300000040),IRanges(300000050,300000055),IRanges(300000070,300000095)), strand=c("+","+","+")) 

kp <- plotKaryotype(plot.type=1, genome = custom.genome)
kpPlotCoverage(kp, data=custom.coverage, show.0.cov=FALSE)
kpAddBaseNumbers(kp, tick.dist = 5, tick.col="red", minor.tick.dist = 1, minor.tick.col = "gray")


kpPoints(kp, chr="chr12", x=300000000, y=0.5)
kpAbline(kp, chr="chr12", v=300000000, data.panel = "all")


gg <- toGRanges("chr1:0,10")
kp <- plotKaryotype(genome = gg)
kpAddBaseNumbers(kp, tick.dist = 1)

gg <- toGRanges("chr1:1,10")
kp <- plotKaryotype(genome = gg)
kpAddBaseNumbers(kp, tick.dist = 2, minor.tick.dist = 1)
rr <- toGRanges("chr1", 1:10, 1:10)
kpPlotRegions(kp, rr, col=rainbow(10))
kpRect(kp, chr="chr1", x0=1, x1=2, y0=0, y1=1)
kpPoints(kp, chr="chr1", x=1, y=0.5)


kp <- plotKaryotype(genome = "hg19")
kpAddBaseNumbers(kp)


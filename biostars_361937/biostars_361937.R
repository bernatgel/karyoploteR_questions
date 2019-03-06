# https://www.biostars.org/p/361937/

# I  was wondering if there is a package or script which may visualize 
# multi-panel CNV just IGV does but with more flexibility from a cohort
# of bedgraph files? preferably in R? Sushi R package does not have a 
# point based visualization otherwise might have been perfect.

library(karyoploteR)
library(Sushi)


#Load 3 example bedgraphs from the datasets in the Sushi package
data(list=c("Sushi_DNaseI.bedgraph","Sushi_ChIPSeq_CTCF.bedgraph",
            "Sushi_ChIPExo_CTCF.bedgraph"), package="Sushi")

dd <- list(CTCF_Exo=Sushi_ChIPExo_CTCF.bedgraph,
           CTCF_Chip=Sushi_ChIPSeq_CTCF.bedgraph,
           DNase=Sushi_DNaseI.bedgraph)

png("bedgraphPlot.png", width = 1500, height = 1000)
kp <- plotKaryotype(zoom="chr11:1643216-2359707", main = "BedGraphs", cex=3)
kpAddBaseNumbers(kp, tick.dist = 10e4, add.units = TRUE, cex=1.8)
for(i in seq_len(length(dd))) {
  names(dd[[i]]) <- c("chr", "start", "end", "value") 
  gr <- toGRanges(dd[[i]])

  at <- autotrack(i, length(dd), margin = 0.1)
  kpPoints(kp, data=gr, ymax=max(gr$value), r0=at$r0, r1=at$r1, col=rainbow(10)[i])
  kpAddLabels(kp, labels = names(dd)[i], r0=at$r0, r1=at$r1, cex=2)
}
dev.off()


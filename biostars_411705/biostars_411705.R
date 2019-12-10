library(regioneR)
library(karyoploteR)
library(CopyNumberPlots)
#Create example data
#Randomly partition the genome
hg19 <- filterChromosomes(getGenome("hg19"), organism = "hg", chr.type = "canonical")
rr <- regioneR::createRandomRegions(nregions = 15, length.mean = 40e6, length.sd = 30e6, genome=hg19, mask=NA, non.overlapping = TRUE)                    
rr <- sort(c(rr, subtractRegions(hg19, rr)))

#Assign copy number states
rr$cn <- sample(size = length(rr), x = c(0,rep(1,2), rep(2,10), rep(3,3), rep(4,2)), replace = TRUE)

#Create the points (not very efficient nor elegant, but works)
tiles <- unlist(tileGenome(setNames(end(hg19), seqnames(hg19)), tilewidth = 2e6))
tiles$lrr <- rnorm(length(tiles), mean = 2, sd = 0.3)
for(i in 1:length(tiles)) {
  tiles$lrr[i] <- tiles$lrr[i] + subsetByOverlaps(rr, tiles[i])$cn - 2
}

#Plot it
png("biostars_411705_simple.png", width=1000, height = 800)
  kp <- plotKaryotype("hg19", plot.type = 4, main="Random Data, 2Mb resolution", cex=2)
  plotLRR(kp, tiles, ymin=0, ymax=5, add.axis = FALSE, labels=NA)
  plotCopyNumberCallsAsLines(kp, cn.calls = rr, ymin=0, ymax=5, labels="ploidy")
dev.off()



#Plot it
png("biostars_411705.png", width=2500, height = 800)
  kp <- plotKaryotype("hg19", plot.type = 4, labels.plotter = NULL, main="Random Data, 2Mb resolution", cex=3.2)
  kpAddChromosomeNames(kp, srt=45, cex=2.2)
  plotLRR(kp, tiles, ymin=-1, ymax=5, labels = NA,  points.col = "#AAAAAAAA", line.at.0 = FALSE, points.cex = 3, add.axis = FALSE)
  plotCopyNumberCallsAsLines(kp, cn.calls = rr, ymin=-1, ymax=5, lwd=3, add.axis=FALSE, labels = NA)
  kpAddChromosomeSeparators(kp, lwd=2, col = "#666666")
  kpAxis(kp, ymin = -1, ymax=5, tick.pos = 0:4, cex=2.2)
  kpAddLabels(kp, labels = "ploidy", cex=3, srt=90, pos=3, label.margin = 0.025)
dev.off()

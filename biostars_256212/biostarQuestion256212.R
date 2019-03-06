library(karyoploteR) 

library(GenomeInfoDb)
library(GenomicRanges)
custom.genome <- toGRanges(data.frame(chr=c("1"), start=c(1), end=c(15232102)))
AK <- plotKaryotype(genome=custom.genome) 
my.genes <- toGRanges("myband.txt")
my.genes <- createRandomRegions(nregions = 1000, genome=custom.genome)
kpPlotDensity(AK, data=my.genes, r0=0, r1=0.5)


AK$chromosomes
AK$chromosome.lengths



custom.genome <- toGRanges(data.frame(chr=c("chr1"), start=c(1), end=c(15232102)))
my.genes <- toGRanges("My-gene-data.txt")

png(filename = "GeneDensity_default.png", width=1000, height=500)
  AK <- plotKaryotype(genome=custom.genome) 
  kpPlotDensity(AK, data=my.genes)
dev.off()

png(filename = "GeneDensity_500K.png", width=1000, height=500)
  AK <- plotKaryotype(genome=custom.genome) 
  kpPlotDensity(AK, data=my.genes, window.size = 500000)
dev.off()  
  
png(filename = "GeneDensity_50K.png", width=1000, height=500)
  AK <- plotKaryotype(genome=custom.genome) 
  kpPlotDensity(AK, data=my.genes, window.size = 50000)
dev.off()

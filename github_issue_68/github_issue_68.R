library(karyoploteR)
library(BSgenome.Scerevisiae.UCSC.sacCer3)
library(TxDb.Scerevisiae.UCSC.sacCer3.sgdGene)

kp <- plotKaryotype(genome = BSgenome.Scerevisiae.UCSC.sacCer3)
all.genes <- genes(TxDb.Scerevisiae.UCSC.sacCer3.sgdGene)
kpPlotDensity(kp, data=all.genes, window.size = 10000)

library(karyoploteR)


hmel <- toGRanges("./Hmel2pt5Genome.bed")

kp <- plotKaryotype(genome=hmel)


kp <- plotKaryotype(genome=hmel, chromosomes = c("chr1", "chr2", "chr3"))


kp <- plotKaryotype(genome="hg19", chromosomes = c("chr1", "chr2", "chr3"))

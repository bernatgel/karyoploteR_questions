library(karyoploteR)


sessionInfo()


gg <- toGRanges("genes.txt")

data <- read.table("genes.txt", header = TRUE)
chromosomes <- unique(data$chr)
gene_ranges <- makeGRangesFromDataFrame(data, keep.extra.columns = TRUE)

chromosomes <- as.character(chromosomes)

png("Chromosome Plot - Distribution.png", width = 1920, height = 1080)
kp <- plotKaryotype(genome="hg19", chromosomes = chromosomes)
kpPlotDensity(kp, gene_ranges)
dev.off()
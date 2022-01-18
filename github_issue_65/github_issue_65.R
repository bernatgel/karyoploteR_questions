library(karyoploteR)

#BiocManager::install("bernatgel/regioneR")

sessionInfo()

kp <- plotKaryotype(plot.type=4, genome="hg38", chromosomes=c(paste0("chr", 1:22), "chrX"))

filterChromosomes(getGenome("hg38"), keep.chr = c(paste0("chr", 1:22), "chrX"))
filterChromosomes(karyoploteR:::data.cache$genomes$hg38, keep.chr = c(paste0("chr", 1:22), "chrX"))


getGenome("hg38")
karyoploteR:::data.cache$genomes$hg38

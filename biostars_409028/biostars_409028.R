library(karyoploteR)

my.data <- createRandomRegions(nregions = 4000, genome = "hg19", length.mean = 1, length.sd = 0)
my.data$frag <- rnorm(n = length(my.data), mean = 60, sd = 10)


png("biostars_409028.png", width=1000, height=1000)
  kp <- plotKaryotype("hg19")
  kpAxis(kp, ymin = 0, ymax=100)
  kpPoints(kp, my.data, y=my.data$frag, ymin=0, ymax=100)
dev.off()

png("biostars_409028_chr1.png", width=1000, height=500)
  kp <- plotKaryotype("hg19", chromosomes = "chr1", main="Chromosome 1")
  kpAxis(kp, ymin = 0, ymax=100)
  kpPoints(kp, my.data, y=my.data$frag, ymin=0, ymax=100)
dev.off()

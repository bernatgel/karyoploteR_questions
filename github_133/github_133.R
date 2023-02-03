library(karyoploteR)

png("custom_hg19_no_filtering_no_cytobands.png", width=1000, height = 1000)
  my.hg19 <- getGenome("hg19")
  kp <- plotKaryotype(genome=my.hg19)
dev.off()


png("custom_hg19_filtering_no_cytobands.png", width=1000, height = 1000)
  my.hg19 <- getGenome("hg19")
  my.hg19 <- filterChromosomes(my.hg19, organism = "hg", chr.type = "canonical")
  kp <- plotKaryotype(genome=my.hg19)
dev.off()


png("custom_hg19_filtering_cytobands.png", width=1000, height = 1000)
  my.hg19 <- getGenome("hg19")
  my.hg19 <- filterChromosomes(my.hg19, organism = "hg", chr.type = "canonical")
  my.cytobands <- getCytobands("hg19")
  kp <- plotKaryotype(genome=my.hg19, cytobands = my.cytobands)
dev.off()

png("custom_hg19_filtering_cytobands_no_chr.png", width=1000, height = 1000)
  my.hg19 <- getGenome("hg19")
  my.hg19 <- filterChromosomes(my.hg19, organism = "hg", chr.type = "canonical")
  seqlevelsStyle(my.hg19) <- "Ensembl"
  my.cytobands <- getCytobands("hg19")
  seqlevelsStyle(my.cytobands) <- "Ensembl"
  kp <- plotKaryotype(genome=my.hg19, cytobands = my.cytobands)
dev.off()


library(karyoploteR)


#Create the example file
random.genes <- createRandomRegions(nregions = 400, length.mean = 20000, length.sd = 5000)
write.table(toDataframe(random.genes)[,1:3], file = "genes.file.bed", sep="\t", col.names = FALSE, row.names = FALSE, quote = FALSE)



#Read the genes
genes <- toGRanges("genes.file.bed")

png("Example_400_genes_positioned_on_genome.png", width=1000, height = 1000)
  kp <- plotKaryotype(genome="hg19")
  kpPlotRegions(kp, data=genes)
dev.off()
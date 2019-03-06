 #This code is a response to the biostars question https://www.biostars.org/p/262937

library(karyoploteR)

snps <- read.table(file = "SNPs.txt", sep = "\t", header=TRUE, stringsAsFactors = FALSE)

calbicans.genome <- toGRanges(data.frame(chr=c("chr1A", "chr1B", "chr2A", "chr2B", "chr3A", "chr3B", "chr4A", "chr4B", "chr5A", "chr5B", "chr6A", "chr6B", "chr7A", "chr7B", "chrRA", "chrRB"),
                              start=rep(1, 16),
                              end=c(3188341, 3188396, 2231883, 2231750, 1799298, 1799271, 1603259, 1603311, 1190869, 1190991, 1033292, 1033212, 949580, 949611, 2286237, 2285697)))

png(filename = "calbicans.png", width=2000, height=1500)
kp <- plotKaryotype(genome=calbicans.genome, plot.type=4, ideogram.plotter = NULL, labels.plotter = NULL)
kpAddCytobandsAsLine(kp)
kpAddChromosomeNames(kp, srt=45)

max.freq <- max(snps$Frequency)

kpAddLabels(kp, "SNP Frequency", srt=90, pos=3)
kpAxis(kp, ymin = 0, ymax=max.freq)
kpPoints(kp, chr=snps$Chr, x=snps$Pos, y=snps$Frequency, ymin=0, ymax=max.freq)
dev.off()


snps <- createRandomRegions(genome=calbicans.genome, nregions = 5000, length.mean = 1, length.sd = 0)
mcols(snps) <- rnorm(n = 5000, mean = 3, sd=0.5)


png(filename = "calbicans.png", width=2000, height=1000)
kp <- plotKaryotype(genome=calbicans.genome, plot.type=4, ideogram.plotter = NULL, labels.plotter = NULL)
kpAddCytobandsAsLine(kp)
kpAddChromosomeNames(kp, srt=45, cex=2)

max.freq <- 7

kpAddLabels(kp, "SNP Frequency", srt=90, pos=3, label.margin = 0.03, cex=2)
kpAxis(kp, ymin = 0, ymax=max.freq, numticks = 8, cex=1.8)
kpPoints(kp, chr=as.character(seqnames(snps)), x=start(snps), y=snps$X, ymin=0, ymax=max.freq)
dev.off()



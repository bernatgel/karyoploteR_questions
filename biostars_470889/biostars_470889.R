library(karyoploteR)

set.seed(12345)

#simulate the data
snps <- sort(createRandomRegions(nregions = 5000, length.mean = 1, length.sd = 0))
seqlevelsStyle(snps) <- "Ensembl"
snps$SNP <- paste0("rs", 1:5000)
snps$group <- c(1,2)

#Set random pvals and create a significant region  with
#all significant snps in the same group
snps$log10_Pval <- abs(rnorm(n = 5000, mean = 0.5, sd = 1))
sig.region <- toGRanges("3:20000000-30000000")
in.sig.region <- overlapsAny(snps, sig.region)
snps[in.sig.region]$group <- 2
snps[in.sig.region]$log10_Pval <- snps[in.sig.region]$log10_Pval + runif(n = length(which(in.sig.region)), min = 1, max = 8)

#compute the "original" p-value
snps$pval <- 10^(-1*snps$log10_Pval)

#Transform into a data.frame
dd <- toDataframe(snps)[,c("group", "pval", "log10_Pval", "chr", "start", "SNP")]
names(dd) <- c("Group", "P_val", "-log10_Pval", "CHR", "BP", "SNP")

head(dd)


#Now, make a GRanges from this data.frame
snps.gr <- toGRanges(dd[,c(4,5,5,6,1,2,3)])
#and set the chromosome names to UCSC style
seqlevelsStyle(snps.gr) <- "UCSC"

png("manhattan_2groups.png", width = 1000, height = 800)
  kp <- plotKaryotype(plot.type=4)
  kpAxis(kp, ymin = 0, ymax = 10)
  kpPlotManhattan(kp, data = snps.gr, pval = snps.gr$`-log10_Pval`, logp = FALSE, ymin=0, ymax=10, points.col=colByCategory(snps$group, colors = c("red", "blue")))
dev.off()


png("manhattan_2groups_annotated_top.png", width = 1000, height = 800)
  pp <- getDefaultPlotParams(4)
  pp$ideogramheight <- 3
  pp$data1inmargin <- 2
  pp$bottommargin <- 10
  kp <- plotKaryotype(plot.type=4, labels.plotter = NULL, ideogram.plotter = NULL, plot.params = pp)
  kpAddMainTitle(kp, "Manhattan Plot - 2 Groups", cex=3)
  kpAddCytobandsAsLine(kp)
  kpAddChromosomeNames(kp, srt=45)
  kpAxis(kp, ymin = 0, ymax = 10)
  kpPlotManhattan(kp, data = snps.gr, pval = snps.gr$`-log10_Pval`, logp = FALSE, ymin=0, ymax=10, points.col=colByCategory(snps$group, colors = c("red", "blue")))
  top <- snps.gr[which.max(snps.gr$`-log10_Pval`)]
  kpText(kp, top, y=top$`-log10_Pval`, ymin=0, ymax=10, labels = top$SNP, pos=4)
dev.off()

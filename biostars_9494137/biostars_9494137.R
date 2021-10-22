library(karyoploteR)


set.seed(1234)
snps <- createRandomRegions(nregions = 1000, length.mean = 1, length.sd = 0, mask=NA, genome=getGenome("hg19")) 
snps$rs <- paste0("rs", round(runif(1000, min = 1000, max = 200000)))
#Trait 1
snps$pval1 <- 10^(-1*abs(rnorm(n = 1000, 1,sd = 4 )))
top1 <- which.min(snps$pval1)
top1.y <- -1 * log10(snps[top1]$pval1)
#Trait 2
snps$pval2 <- 10^(-1*abs(rnorm(n = 1000, 1,sd = 4 )))
top2 <- which.min(snps$pval2)
top2.y <- -1 * log10(snps[top2]$pval2)


png("one.manhattan.png", width=1200, height=600)
  kp <- plotKaryotype(genome="hg19", plot.type=4)
  
  kpPlotManhattan(kp, data = snps, pval = snps$pval1, ymin=0, ymax=18)
  kpPoints(kp, data=snps[top1], y = top1.y, pch=1, cex=2, col="red", ymin=0, ymax=18)
  kpText(kp, data = snps[top1], y=top1.y, labels = snps[top1]$rs, pos=2, ymin=0, ymax=18)
dev.off()


png("two.manhattan.png", width=1200, height=800)
  
  kp <- plotKaryotype(genome="hg19", plot.type=4)
  
  kpAddLabels(kp, labels = "Trait1", r0=autotrack(1,2))
  kpPlotManhattan(kp, data = snps, pval = snps$pval1, ymin=0, ymax=18, r0=autotrack(1,2))
  kpPoints(kp, data=snps[top1], y = top1.y, pch=1, cex=2, col="red", ymin=0, ymax=18, r0=autotrack(1,2))
  kpText(kp, data = snps[top1], y=top1.y, labels = snps[top1]$rs, pos=2, ymin=0, ymax=18, r0=autotrack(1,2))
  
  kpAddLabels(kp, labels = "Trait2", r0=autotrack(2,2))
  kpPlotManhattan(kp, data = snps, pval = snps$pval2, ymin=0, ymax=18, r0=autotrack(2,2))
  kpPoints(kp, data=snps[top2], y = top2.y, pch=1, cex=2, col="red", ymin=0, ymax=18, r0=autotrack(2,2))
  kpText(kp, data = snps[top2], y=top2.y, labels = snps[top2]$rs, pos=2, ymin=0, ymax=18, r0=autotrack(2,2))
  
dev.off()


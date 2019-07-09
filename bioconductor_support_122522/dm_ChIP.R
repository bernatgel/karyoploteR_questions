library(pasillaBamSubset)
library(karyoploteR)
library(TxDb.Dmelanogaster.UCSC.dm6.ensGene)
library(org.Dm.eg.db)


png("karyoploteR_dm6_ChIP_BAMs.png", width=1000, height=1000)
  kp <- plotKaryotype(genome="dm6", zoom="chr4:1-60000", main="D. melanogaster BAM coverage")
  
  genes.data <- makeGenesDataFromTxDb(karyoplot = kp, txdb = TxDb.Dmelanogaster.UCSC.dm6.ensGene)
  #This line will only work with karyoploteR 1.10.4 or above
  genes.data <- addGeneNames(genes.data, orgDb = org.Dm.eg.db, keytype = "ENSEMBL")
  
  kpPlotGenes(kp, genes.data, r0=0, r1=0.3)
  
  kp <- kpPlotBAMCoverage(kp, untreated1_chr4(), r0=0.4, r1=0.65, col="darkolivegreen1")
  kpAxis(kp, r0=0.4, r1=0.65, ymax=kp$latest.plot$computed.values$max.coverage)
  kp <- kpPlotBAMCoverage(kp, untreated3_chr4(), r0=0.75, r1=1, col="cadetblue2")
  kpAxis(kp, r0=0.75, r1=1, ymax=kp$latest.plot$computed.values$max.coverage)
dev.off()

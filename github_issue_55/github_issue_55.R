library(karyoploteR)

cn.regs <- sort(createRandomRegions(nregions = 100))

cyto <- getCytobands(genome="hg19")
#remove the unneded cytobands
cyto <- cyto[overlapsAny(cyto, cn.regs)]

png(file="selected.cytobands.png", width=1000, height=300)
  kp <- plotKaryotype(chromosomes = c("chr15", "chr16", "chr17"))
  kpPlotRegions(kp, cn.regs)
  kpText(kp, data=cyto, y=0.5, labels = cyto$name, data.panel = "ideogram", cex=0.8)
dev.off()

png(file="selected.cytobands.out.of.ideogram.png", width=1000, height=300)
  kp <- plotKaryotype(chromosomes = c("chr15", "chr16", "chr17"))
  kpPlotRegions(kp, cn.regs)
  kpText(kp, data=cyto, y=0, labels = cyto$name, data.panel = "ideogram", cex=0.8, srt=45, pos=1)
dev.off()
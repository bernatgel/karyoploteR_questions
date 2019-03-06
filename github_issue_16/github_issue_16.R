library(karyoploteR)



regs <- filterChromosomes(createRandomRegions(nregions = 400, length.mean = 1e6, length.sd = 0, mask = NA, genome="hg19"))
regs <- joinRegions(regs)
regs$name <- runif(length(regs), 100, 1000)
regs

wgsregs <- unlist(tileGenome(kp$chromosome.lengths, tilewidth = 1e6))
wgsregs$cov <- rnorm(length(wgsregs), 400, 80)


png("issue16.png", width=800, height=800)
kp <- plotKaryotype()
kpBars(kp, regs, y0 = 0, y1=regs$name, ymax=max(regs$name), col="blue", border=NA)
dev.off()

names(mcols(regs)) <- "y1"
kpBars(kp, regs, ymax=max(regs$y1), col="blue", border=NA)


kp <- plotKaryotype(plot.type=2)
kpBars(kp, regs, y0 = 0, y1=regs$name, ymax=max(regs$name), col="blue", border=NA)
kpBars(kp, wgsregs, y0 = 0, y1=wgsregs$cov, ymax=max(regs$name), col="gray", border=NA, data.panel=2)


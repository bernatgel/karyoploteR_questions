library(karyoploteR)

pp <- getDefaultPlotParams(plot.type = 4)
pp$data1max <- 1
kp <- plotKaryotype(zoom = toGRanges(data.frame("chr1", 1, 1e6)),
                    main = "",
                    plot.params = pp,
                    cytobands = NULL)
kpDataBackground(kp, data.panel = 1, col = "#FFFFFF")

sessionInfo()

library(TxDb.Hsapiens.UCSC.hg19.knownGene)
par(mar=c(1,1,1,1))
plot.new()
pp <- getDefaultPlotParams(plot.type = 3)
pp$data1max <- 10
pp$data2max <- 10
kp <- plotKaryotype(zoom = toGRanges(data.frame("chr1", 1, 1e6)),
                    plot.type = 3,
                    main = "",
                    plot.params = pp,
                    ideogram.plotter = NULL)
kpDataBackground(kp, data.panel = 1, col = "#FFFFFF")
kpAxis(kp, r1 = 10, ymin = 0, ymax = 10, numticks = 5, cex = 1, data.panel = 1, side = 1)
kpPlotGenes(kp, data = TxDb.Hsapiens.UCSC.hg19.knownGene, plot.transcripts = TRUE, data.panel = 1, r0 = 1, r1 = 3)



kp <- plotKaryotype(genome="hg19",plot.type=2)
kpAddBaseNumbers(kp)


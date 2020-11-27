library(karyoploteR)

Chr_no <- "Chr_22"

zoom.start <- 42121077
zoom.end <- 42131157
zoom.region <- toGRanges(data.frame(Chr_no, zoom.start,zoom.end))


genome_file <- 'genome.txt'
cytoband_file <- read.table('cyto.txt', header=TRUE)
custom.genome <- toGRanges(genome_file)
cyto.target <- cytoband_file[c(1,2,3),]
cyto.chr <- cytoband_file[(4),]
custom.cyto.target <- toGRanges(cyto.target)
custom.cyto.chr <- toGRanges(cyto.chr)

jpeg('karyoploteR.jpg', width=2400,height=1800, res=300)
kp <- plotKaryotype(genome = custom.genome, cytobands = custom.cyto.chr, chromosomes=Chr_no, zoom=zoom.region, plot.type = 5, labels.plotter=NULL)
par(new=TRUE)
kp <- plotKaryotype(genome = custom.genome, cytobands = custom.cyto.target, chromosomes=Chr_no, zoom=zoom.region, plot.type = 5, labels.plotter=NULL)
kpAddCytobandLabels(kp, force.all = TRUE, cex=0.75)


#Updated Version
Chr_no <- "Chr_22"

zoom.start <- 42121077
zoom.end <- 42131157
zoom.region <- toGRanges(data.frame(Chr_no, zoom.start,zoom.end))

genome_file <- 'genome.txt'
custom.genome <- toGRanges(genome_file)

regs <- toGRanges('cyto.txt')[1:3] #The fourth line is no longer needed
cyto.cols <- getCytobandColors()
regs$color <- cyto.cols[regs$gieStain]

#Create the karyoplot. Setting cytobands=NULL will plot the ideograms as gray boxes (the background you needed)
png("github_issue_95.png", width=1000, height=800)
  kp <- plotKaryotype(genome = custom.genome, cytobands = NULL, zoom=zoom.region, plot.type = 5, labels.plotter=NULL)
  kpRect(kp, data = regs, y0=0, y1=1, col=regs$color, data.panel="ideogram")
  kpText(kp, data=regs, y=0.5, labels = regs$name, data.panel="ideogram")
dev.off()

png("github_issue_95_2.png", width=1000, height=800)
  kp <- plotKaryotype(genome = custom.genome, cytobands = NULL, zoom=zoom.region, plot.type = 5, labels.plotter=NULL)
  kpRect(kp, data = regs, y0=0, y1=1, col=c("dodgerblue", "gold", "gold"), data.panel="ideogram")
  kpText(kp, data=regs, y=1.1, pos=1, labels = regs$name, data.panel="ideogram", clipping=FALSE)
dev.off()

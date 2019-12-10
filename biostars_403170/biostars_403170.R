library(karyoploteR)
library(Biostrings)

#Read the fasta
seqs <- Biostrings::readDNAStringSet("seqs.fa")

#read the ranges
regs <- list(Bed1=toGRanges("Bed1.txt"), Bed2=toGRanges("Bed2.txt"))

#Define the plotting parameters (margins, etc...)
pp <- getDefaultPlotParams(1)
pp$ideogramheight <- 0
pp$data1inmargin <- 0
pp$bottommargin <- 20
pp$topmargin <- 20

for(i in seq_along(seqs)) {
  s <- seqs[i]
  seq.name <- names(s)
  seq.len <- width(s)
  seq.chars <- strsplit(x=as.character(s), "")[[1]]

  png(paste0(seq.name, ".png"), width=10*seq.len, height=300)
    #Plot with a custom genome
    custom.genome <- toGRanges("Cust", 1, seq.len)
    kp <- plotKaryotype(genome=custom.genome, ideogram.plotter = NULL, labels.plotter = NULL, plot.params = pp)
    kpAddBaseNumbers(kp, tick.dist = 50, minor.ticks = FALSE, cex = 1)
    
    #Add the sequence
    kpAddLabels(kp, labels = seq.name, r0 = 0, r1=0.1, cex=1.8)
    for(j in seq_len(seq.len)) {
      kpText(kp, chr="Cust", x = j, y=0.05, labels = seq.chars[j])
    }
    
    #Add the ranges
    for(j in seq_along(regs)) {
      at <- autotrack(j, length(regs), r0=0.2)
      kpAddLabels(kp, labels = names(regs)[j], r0=at, cex=1.4)
      kpRect(kp, data=regs[[j]], y0=0, y1=1, r0=at, col="#AAAAAA", border="#666666")  
      kpPlotNames(kp, data=regs[[j]], labels = mcols(regs[[j]])[,1], position = "center", y0=0, y1=1, r0=at)
    }
   
  dev.off()
}


library(karyoploteR)
set.seed(1234)
#create fake GC cont data
gc.cont <- toGRanges(data.frame("chr1", 1:247*1000000, 1:247*1000000+999999))  #Create the ranges
gc.cont$gc <- runif(247) #Assign random GC values
gc.cont$gc[2:99] <- (gc.cont$gc[1:98] + gc.cont$gc[2:99] + gc.cont$gc[3:100])/3 #smooth them a bit
  
#gc.cont <- toGRanges("your_bed_file.bed")  

#create the plot
png("biostars_488503_1.png", width=1000, height=500)
  kp <- plotKaryotype(genome = "hg19", chromosomes = "chr1")
  kpHeatmap(kp,data=gc.cont, y=gc.cont$gc, col=c("blue", "white", "red"))
dev.off()


#create the plot
png("biostars_488503_2.png", width=1000, height=500)
  kp <- plotKaryotype(genome = "hg19", chromosomes="chr1", main="GC content in Chromosome 1")
 
  kpAddLabels(kp, labels = "Combined", r0=autotrack(1,4), label.margin = 0.04)
  kpAxis(kp, r0=autotrack(1,4), cex=0.8)
  kpBars(kp,data=gc.cont, y0=0.5, y1 = gc.cont$gc, r0=autotrack(1,4), col=colByValue(gc.cont$gc, colors = c("blue", "white", "red")), border=NA)
  
  kpAddLabels(kp, labels = "Heatmap", r0=autotrack(2,4), label.margin = 0.04)
  kpHeatmap(kp,data=gc.cont, y=gc.cont$gc, col=c("blue", "white", "red"),r0=autotrack(2,4))
  
  kpAddLabels(kp, labels = "Bars", r0=autotrack(3,4), label.margin = 0.04)
  kpAxis(kp, r0=autotrack(3,4), cex=0.8)
  kpBars(kp,data=gc.cont, y0=0, y1 = gc.cont$gc, r0=autotrack(3,4), col="blue", border=NA)
  
  kpAddLabels(kp, labels = "Line", r0=autotrack(4,4), label.margin = 0.04)
  kpAxis(kp, r0=autotrack(4,4), cex=0.8)
  kpLines(kp,data=gc.cont, y=gc.cont$gc, r0=autotrack(4,4))
  
dev.off()

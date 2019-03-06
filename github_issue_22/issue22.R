library(karyoploteR)


cust.genome <- toGRanges(data.frame(c("1A", "1B", "4A"), c(1, 1,1), c(8e8, 8e8, 4e8)))

rr <- createRandomRegions(100, length.mean = 40e6, length.sd = 10e6, genome = cust.genome)

plotKaryotype(genome = cust.genome, cytobands = rr)

myregions <- toGRanges("mycytobands.txt")

kp <- plotKaryotype(genome = cust.genome, cytobands = cc)

kp <- plotKaryotype(genome=cust.genome)
kpPlotRegions(kp, data=myregions)

```
cust.genome <- toGRanges(data.frame(c("1A", "1B", "4A"), c(1, 1,1), c(8e8, 8e8, 4e8)))
myregions <- toGRanges("mycytobands.txt")   
kp <- plotKaryotype(genome=cust.genome)
kpRect(kp, data=myregions, y0=0, y1=1)
``` 
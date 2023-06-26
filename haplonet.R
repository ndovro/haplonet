setwd("/mnt/14C608D4C608B7CE/blast/run11072020/haplotype/R/")
#setwd("/mnt/14C608D4C608B7CE/blast/run11072020/coihaplo")

library(ape)
#MAKE SURE ALL SEQUENCES ARE SAME LENGTH (MUSCLE)
reads1<-read.dna("al.fasta", format="fasta")
rownames(reads1)


reads1


library(pegas)

haps<-haplotype(reads1,indels="sic")



reads2<-haplotypes::read.fas("al.fasta")

h<-haplotypes::haplotype(reads2,indels="sic")

d<-h@d

net<-haploNet(haps,d=d)


ind.hap<-with(
  stack(setNames(attr(haps, "index"), rownames(haps))), 
  table(hap=ind, pop=rownames(reads1)[values])
)



plot(net,bty = 'L', xpd = FALSE, labels = T, show.mutation = 1,scale.ratio = 1.5,cex = 1,
     size = attr(net, "freq"))

legend("topright", colnames(ind.hap), col=rainbow(ncol(ind.hap)), pch=15, ncol=2)







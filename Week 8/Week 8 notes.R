library(GEOquery)
library(limma)

gset = getGEO(GEO = "GSE180594")

dim(gset)
class(gset)
names(gset) # it's a list with 1 element (1 Gene expression set)

eset = gset[[1]]
dim(eset)

head(pData(eset))
view(pData(eset))
table(eset$'infection status:ch1')

head(fData(eset))

View(exprs(eset))
boxplot(exprs(eset)) # want them to be somewhat similar

#we want control gorup to be first
eset$Group = factor (eset$`infection status:ch1`, 
                     levels = c("Healthy Control", "Acute COVID19", "Post COVID19"))
table(eset$Group)

# set up comparisoin for analysis
design = model.matrix(~1 + eset$Group)
head(design) 

colnames(design)[2:3] = c("Acute","Post")
head(design)

limmaFit = lmFit(eset, design)
limma_results = eBayes(limmaFit)

names(limma_results)

res_tab = topTable(limma_results, coef= "Acute", number = 20)
View(res_tab)

#Tutorial for multivariable 


### Demonstrate expression differences between groups

rownames(res_tab)
head(rownames(eset))

heatmap_data = exprs(eset)[rownames(res_tab),]
dim(heatmap_data)

library(pheatmap)

pheatmap(heatmap_data)

annotation_data = data.frame(row.names = colnames(eset),
                             Group = eset$Group)
head(annotation_data)

pheatmap(heatmap_data,
         annotation_col =  annotation_data)

# Rename gene symbols
rownames(heatmap_data) = res_tab$ORF

pheatmap(heatmap_data,
         annotation_col = annotation data,
         scale = "row")


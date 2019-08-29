
# dataset: the data.frame of the RNA-seq gene expression of interest, with samples in rows and genes in colums (limma50 genes must be present)
# chosen_sample: the row of the sample to be processed or 0 for all the samples
# normalization: 0 for RSEM, 1 for FPKM
# BWE=FALSE for limma50, BWE=TRUE for limma50_BWE


library(sjmisc)

  
results<<-NULL
predictions<-NULL


if (chosen_sample!=0){
  sample<-dataset[chosen_sample,]
  
  
  #FPKM, limma50
  if (normalization==1 & !BWE){
    source("WebService_FPKM_limma50.R")}
  
  #FPKM, limma50_BWE
  if (normalization==1 & BWE){
    source("WebService_FPKM_limma50_BWE.R")}
  
  #RSEM, limma50
  if (normalization==0 & !BWE){
    source("WebService_RSEM_limma50.R")}
  
  #RSEM, limma50_BWE
  if (normalization==0 & BWE){
    source("WebService_RSEM_limma50_BWE.R")}
  
  results<<-result
  prediction<-substr(result, nchar(result)-11, nchar(result)-4)
  predictions<-prediction
  
}else{
  
  for (i in 1:nrow(dataset)){
    sample<-dataset[i,]
    
    
    #FPKM, limma50 (1,FALSE)
    if (normalization==1 & !BWE){
      source("WebService_FPKM_limma50.R")}
    
    #FPKM, limma50_BWE (1,TRUE)
    if (normalization==1 & BWE){
      source("WebService_FPKM_limma50_BWE.R")}
    
    #RSEM, limma50 (0,FALSE)
    if (normalization==0 & !BWE){
      source("WebService_RSEM_limma50.R")}
    
    #RSEM, limma50_BWE (0,TRUE)
    if (normalization==0 & BWE){
      source("WebService_RSEM_limma50_BWE.R")}
    
    
    results<<-paste(results, result)
    prediction<-substr(result, nchar(result)-11, nchar(result)-4)
    predictions<- paste(predictions, prediction)
    
  }# salva l'output appendendo 
}

x<-scan(text=gsub('\\s+', ' ', predictions), sep='', what='')
x2<-gsub('"','',x)
x3<-gsub("\'",'',x2)
x4<-gsub(":",'',x3)
seq<-is_empty(x4, first.only=FALSE)
ordered_subtypes<<-x4[which(seq==FALSE)]



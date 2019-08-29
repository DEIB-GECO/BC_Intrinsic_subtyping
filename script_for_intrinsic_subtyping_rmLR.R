#R script  for requiring the BRCA intrinsic subtyping web service of interest



# mlrBCsubFun(path_parameter, chosen_sample_parameter, normalization_parameter, BWE_parameter)
# path_parameter: the path of the RNA-seq gene expression dataset of interest, in csv format, having samples in rows and genes in columns. At least limma50 or limma50_BWE genes must be present in the dataset; ID column or other metadata columns are allowed; for GATA.AS1 DOT FORMAT is mandatory (GATA-AS1 is not accepted) 
#NB 
# chosen_sample_parameter: Insert the row number of the sample to be processed or 0 for all the samples
# normalization_parameter: Insert 0 for RSEM, 1 for FPKM
# BWE_parameter=FALSE for limma50, BWE=TRUE for limma50_BWE


#Here below, we provide an example which uses a FPKM dataset as input to be processed with the limma50-based multiclass logistic regression.

source("mlrBCsubFun.R")
mlrBCsubFun("test_set_FPKM_webService_gse96058.csv", 0, 1, FALSE)






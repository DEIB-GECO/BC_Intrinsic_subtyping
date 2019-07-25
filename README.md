# BRCA_Intrsinic_subtyping

Here we provide the R-code to connect to each one of the Machine Learning Web Service in charge of providing the intrinsic subtype of a breast cancer RNA-Seq profile under evaluation. The code is authenticated to the Azure Machine Learning service with an API key and uses the RCurl, rjson and sjmisc libraries to make the request and process suitably the returned JSON response. 

Each service is a classification process performed by a L1-L2-regularized multiclass logistic regression working on a specific gene signature of interest to assign one of the five breast cancer intrinsic subtypes (Luminal A, Luminal B, Basal, Her2-enriched or Normal-like) to each RNA-Seq profile under study. Two are the signature/gene sets of interest: limma50 and limma50_BWE. This latter is a subset of the previous one.

Notice that two services are available for each signature: one is developed for RSEM RNA-Seq profiles and the other one for FPKM RNA-seq profiles. In both cases, the user needs to pass the gene expression values of the signature of interest according to the required normalization procedure (RSEM or FPKM).

A single function, *mlrBCsubFun*, must be called to perform BRCA intrinsic subtyping according to user proper choices.
The function indeed requires as parameter the path of a csv dataset, including at least one sample and having the samples in each row and all the profiled genes or other data on the columns. Notice that the columns must include at least the genes of the signature of interest, indicated with the expected gene name, in case of aliases. 
Additionally to the mentioned path, the user must provide the choices concerning the sample/s to be processed, their normalization (RSEM or FPKM) and the gene signature to be used (limma50 or limma50_bwe). Eventually, the code processes one or all the samples based on the parameters set by the user and provides as outcome the intrisic subtype or an ordered list of intrisic subtypes associated with the sample/s under examination.
Here below the signature of the *mlrBCsubFun* function is reported together with a brief explanation of the needed parameters. Following a couple of lines are provided as an example.

*mlrBCsubFun(path_parameter, chosen_sample_parameter, normalization_parameter, bwe_parameter)*

**path_parameter**: the path of the RNA-seq gene expression dataset of interest, having samples in rows and genes in colums. At least limma50_bwe or limma50 genes must be present and for GATA.AS1, dot format is mandatory (GATA-AS1 is not accepted)

**chosen_sample_parameter**: Insert the row number of the sample to be processed or 0 for all the samples

**normalization_parameter**: Insert 0 for RSEM, 1 for FPKM

**bwe_parameter**:FALSE for limma50, TRUE for limma50_bwe


source("mlrBCsubFun.R")

mlrBCsubFun("test_set_FPKM_webService_gse96058.csv", 0, 1, FALSE)

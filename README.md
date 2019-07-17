# BRCA_Intrsinic_subtyping

Here we provide the R-code to connect to each one of the Machine Learning Web Service in charge of providing the intrinsic subtype of a breast cancer RNA-Seq profile under evaluation. The code is authenticated to the Machine Learning service with an API key and uses the RCurl, rjson and sjmisc libraries to make the request and process suitably the returned JSON response. 

Each service is a classification process performed by a L1-L2-regularized multiclass logistic regression working on a specific gene signature of interest to assign one of the five breast cancer intrinsic subtypes (Luminal A, Luminal B, Basal, Her2-enriched or Normal-like) to each RNA-Seq profile under study. Two are the signature/gene sets of interest: limma50 and limma50_BWE. This latter is a subset of the previous one.

Notice that two services are available for each signature: one is developed for RSEM RNA-Seq profiles and the other one for FPKM RNA-seq profiles. In both cases, the user needs to pass the gene expression values of the signature of interest according to the required normalization procedure (RSEM or FPKM).

A single function, called 

The code requires the path of a csv dataset, including at least one sample and having the samples in each row and all the profiled genes or other data on the columns. Notice that the columns must include at least the genes of the signature of interest, indicated with the expected gene name, in case of aliases. 

Additionally to the mentioned path, the user must provide the choices concerning the sample(/s) to be processed, their normalization (RSEM or FPKM) and the gene signature to be used (limma50 or limma50_bwe). Eventually, the code processes one or all the samples based on the user choice and provides the ordered list of intrisic subtypes associated with the samples under examination.

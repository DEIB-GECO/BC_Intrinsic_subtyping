# BRCA_Intrsinic_subtyping

Here we provide the R-code to connect to each one of the Machine Learning Web Service in charge of providing the intrinsic subtype of a breast cancer RNA-Seq profile under evaluation. The code is authenticated to the Machine Learning service with an API key and uses the RCurl and rjson libraries to make the request and process the returned JSON response. 

Each service is a classification process performed by a L1-L2 regularized multiclass logistic regression working on a specifical gene signature of interest to assign one of the five breast cancer intrinsic subtypes (Luminal A, Luminal B, Basal, Her2-enriched or Normal-like) to each RNA-Seq profile under study. Two are the signature/gene sets of interest: limma50 and limma50_BWE. This latter is a subset of the previous one.

Notice that two services are available for each signature: one is developed for RSEM RNA-Seq profiles and the other one for FPKM RNA-seq profiles. In both cases, the user needs to pass the gene expression values of the signature of interest according to the required normalization procedure (RSEM or FPKM).

The code requires a csv dataset, with at least one sample, built according to a specified schema. Then it processes one or more samples based on the user choice, 

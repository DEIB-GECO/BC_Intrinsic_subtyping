# AWCA references for PAM50 breast cancer *Intrinsic* subtyping

Here, we provide the R-codes to use AWCA-based PAM50 classifications. Each classification process assigns one of the five breast cancer *intrinsic* subtypes (*Luminal A, Luminal B, Basal, Her2-enriched, or Normal-like*) to each gene expression sample under study, after normalizing its PAM50 gene expression data against a reference sample.  
Specifically, **PAM50__AWCA_varying_dimensionality_ERsubset** folder can be downloaded and used to perform multiple runs of standard PAM50 classification and corresponding but more robust AWCA-based PAM50 classification, after generating averages-of-within-class-averages references for the gene expression dataset of interest.
Alternatively, in folder **PAM50_gen_AWCA** we provide also a generalized AWCA-based PAM50 classification approach for RNA-seq (RSEM or FPKM) gene expression profiles, using external references, previously computed and tested. Notice that such approach provides a single-sample classification, for each profiles in a dataset of interest. Moreover, in order to find robust and reliable results, we strongly encourage to chose and use FPKM or RSEM external reference on similarly normalized exression data. Notice that, 'canonical' raw counts or TPM data can be easily converted to FPKM (RPKM for single-end RNA-seq) before using the corresponding reference. Conversely, for RSEM summarization, we provide an ad-hoc reference for the commonly used RSEM values scaled by the Upper Quartile of the sample; since RSEM values are 'expected' counts obtained through an Expectation-Maximization algorithm that estimates maximum likelihood expression levels, they are not directly comparable to raw counts. Consequently, also their TPM_rsem (and possibly an FPKM-version) should not be fully comparable with FPKM data from raw counts, as we experienced also in cross-comparison analysis.


INPUT DATASET: A CSV FILE WITH LOG2 GENE EXPRESSION VALUES.

	AT LEAST THE PAM50 GENES MUST BE ALONG THE COLUMNS. 
	LOG2 GENE EXPRESSION VALUES SHOULD BE ALL FINITE VALUES.
	THE SAMPLES MUST BE ON THE ROWS, WITH FIRST CALLED 'SAMPLE.ID'
	SAMPLE IDs CAN BE ALPHANUMERICAL STRING, ALSO INCLUDING DOTS.

USED PAM50 GENES ALIASES ARE THE FOLLOWING IN COMPLIANCE WITH BOTH GENCODE HG19-GRCH38.

	PAM50 GENE ALIASES = {"ACTR3B","ANLN","BAG1","BCL2","BIRC5","BLVRA","CCNB1","CCNE1","CDC20","CDC6","CDH3","CENPF","CEP55",
	"CXXC5","EGFR","ERBB2","ESR1","EXO1","FGFR4","FOXA1","FOXC1","GPR160","GRB7","KIF2C","KRT14","KRT17","KRT5","MAPT","MDM2",
	"MELK","MIA","MKI67","MLPH","MMP11","MYBL2","MYC","NAT1","NDC80","NUF2","ORC6","PGR","PHGDH","PTTG1","RRM2","SFRP1","SLC39A6",
	"TMEM45B","TYMS","UBE2C","UBE2T"}
	
CSV FILES FOR DIFFERENT ALIASES-ENTREZ.ID CONVERSION ARE ALSO PROVIDED.

PAM50_817_RNA-SEQ_RSEM_LOG2.csv IS HERE PROVIDED AS AN EXAMPLE OF INPUT DATASET.
CELL2015_BRCA_cut_metadata.csv IS HERE PROVIDED AS AN EXAMPLE OF METADATA DATASET, INCLUDING AT LEAST ER-STATUS.


**SOURCE CODES FOR AWCA REFERENCE GENERATION AND CLASSIFICATION ARE IN THE FOLDER '*PAM50__AWCA_varying_dimensionality_ERsubset/PAM50_EMULATION_SCRIPTS_ERsubsets+AWCAint*'** 

The folder includes three scripts, henceforth referred as *script_0, script_1* and *script_2*.
 
	script_0_ERsubsets_median+varyingDIM_dimStudy.R provides 10 standard PAM50 classifications, after normalizing wrt to the 	
	medians of 10 properly balanced ER_subsets of a fixed dimension dim. The dimension can be set in the code at line 5.
	Last line can be uncommented to launch directly script_1.


	script_1_ERsubsets_AWCAint_dimStudy.R provides 10 PAM50_AWCA classifications, each one using a built-in AWCA
 	reference based on the samples previously selected for the corresponding ER_subset. Please, consider the dimension of
	interest to retrieve the corresponding ER subsets previously created by script_0. The dimension is inherited from script_0, 
	when script_1 is automatically lauched at the end of script_0; otherwise the dimension can be set in the code at line 5.


	script_2_ERsubsets_AWCAint_dimStudy.R is automatically launched by script_1. Please verify lines 60-65 according to your 
	needs and whole dataset composition. Uncomment line 70 to save in a csv file each generated AWCA reference. 


Please, set the working directory according to the absolute path towards the 'PAM50__AWCA_varying_dimensionality_ERsubset' folder 
and replace input dataset relative paths or names accordingly, to refer the datasets of interest. (lines 10-20, script_0, script_1)

Please set dimension of the 10 random but properly balanced ER_subset to be built. (line 5, script_0, script_1)


**SOURCE CODE FOR PAM50 CLASSIFICATION WITH PRE-COMPUTED EXTERNAL AWCA REFERENCES (FOR RSEM OR FPKM DATA) IS IN THE FOLDER '*PAM50_gen_AWCA*'**

Please, set the working directory according to the absolute path towards the 'PAM50_gen_AWCA' folder 
and replace input dataset relative paths or names accordingly, to refer the data of interest. (lines 10-20)
Please, set summarization/normalization choice, according to the expression values of the sample(/s) of interest. (line 5)

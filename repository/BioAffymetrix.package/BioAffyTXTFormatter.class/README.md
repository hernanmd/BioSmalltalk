Formatter for Affymetrix full TXT export.

Currently includes methods to extract specific columns from the report (i.e. #buildSNP_AllelesAB)

Details
======

Axiom full TXT reports currently starts with a header of 5 lines, example:

##package-file=\\FS3\data\Outputs\Run2\Batch3.suitcase
##annotation-file=C:\Users\Public\Documents\AxiomAnalysisSuite\Library\Axiom_GW_Bos_SNP_1.r3\Axiom_GW_Bos_SNP_1.na35.annot.db
##export-txt-file=C:\Users\Public\Documents\AxiomAnalysisSuite\Export\Exported_Forward-Strand-Base-Call.txt
##snp-count=5585
##samples-per-snp=94

Number of header lines to skip is configurable by setting headerLineCount

BioAffyTXTFormatter new
	inputFile: 'AFFY_TXT-Report.txt';
	readHeader.

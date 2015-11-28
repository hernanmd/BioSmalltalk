examples
example1

	| snpWriter pedFile alleleFqs   |

	pedFile := self testFilesFullDirectoryName / 'sample_strs.ped'.
	" allele frequencies from MSTools plugin "
	alleleFqs := self testFilesFullDirectoryName / 'sample_allele_fqs.csv'.

	snpWriter := BioEigenStratWriter new
				alleleFqs: alleleFqs;
				outputFilename: 'eig_output.snp';
				pedFile: alleleFqs;
				yourself.
	snpWriter writeAsEigenStrat.
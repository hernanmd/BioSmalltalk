examples
example04
	" Example with FORMAT and INFO records "

	| genotypes |
	genotypes := { 
		BioVCFRecordSample example01 .
		BioVCFRecordSample example02 }.
	^ BioVCFRecord new
		chromosome: 20;
		position: 14370;
		id: #('rs6054257');
		refBase: 'G';
		altBase: 'A';
		quality: 29;
		setFilterAsPASSED;
		setInfoNS: 3;
		setInfoDP: 14;
		setInfoAF: 0.5;
		setInfoDB;
		setInfoH2;
		addFormatGT;
		addFormatGQ;
		addFormatDP;
		addFormatHQ;
		addGenotypes: genotypes;
		yourself;
		inspect
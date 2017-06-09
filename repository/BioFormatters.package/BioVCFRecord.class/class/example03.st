examples
example03
	" Example with FORMAT and INFO records "
	
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
		yourself;
		inspect
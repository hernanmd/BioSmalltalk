examples
example1

	BioAffyProbeSetFormatter new
		extractGeneAnnot: true;		fieldNrGeneAnnot: 377;
		extractAX: true;				fieldNrAXId: 1;
		extractMinAlleleFrqs: true;	fieldNrAlleleFqy: 384;
											fieldNrRS: 365;
		extractAlleleFrqs: false;
		outputFilename: 'allele_frequencies.csv';
		fromFileNamed: '/usr/local/data/proyectos/microarray_igevet_2016/data/BOS1_Placas-1_4/Placas1-4_Step-1.txt'
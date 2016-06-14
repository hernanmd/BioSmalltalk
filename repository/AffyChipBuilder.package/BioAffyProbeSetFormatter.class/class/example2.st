examples
example2

	BioAffyProbeSetFormatter new
		fieldNrAlleleFqy: 384;
		fieldNrRS: 365;
		extractAX: true;
		fieldNrAXId: 1;
		extractMinAlleleFrqs: true;
		extractAlleleFrqs: false;
		outputFilename: 'allele_frequencies.csv';
		fromFileNamed: '/usr/local/data/proyectos/microarray_igevet_2016/data/BOS1_Placas-1_4/Placas1-4_Step-1.txt'
examples
example03

	26 to: 29 do: [ :chrNumber | 

		| inputFilename outputFilename |
		inputFilename := 'chr_' , chrNumber asString , '_-test.brang.brah.rsb.txt'.
		outputFilename := 'brang.brah.peaks_chr' , chrNumber asString , '.bed'.

		BioRehhLogPValueCollector new
			cwd: (BioObject testFilesFullDirectoryName / 'rehh') fullName;
			ylim: 2.0;
			nbases: 1000000;
			chrNumber: chrNumber;
			inputFile: inputFilename;
			outputFilename: outputFilename;
			collectPeaks;
			dumpAsEnsembleBedFileBothStrands ]
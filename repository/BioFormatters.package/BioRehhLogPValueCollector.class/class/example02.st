examples
example02

	1 to: 29 do: [ : chrNumber |
		| inputFilename outputFilename |
		inputFilename := 'chr_' , chrNumber asString , '_-test.brang.brah.rsb.txt'.
		outputFilename := 'ENS_brang.brah.peaks_chr' , chrNumber asString , '.bed'.
		BioRehhLogPValueCollector new
			cwd: 'c:\IGEVET\MHC-BoLA\Analisis\EHH-iHS\rehh\r1\run_chr-all';
			ylim: 2.0;
			nbases: 1000000;
			chrNumber: chrNumber;
			inputFile: inputFilename;
			outputFilename: outputFilename;
			collectPeaks;
			dumpAsEnsembleBedFile ]
examples
example03

	| minChr maxChr cwd nbases |

	minChr := 1.
	maxChr := 29.
	cwd := 'c:\IGEVET\MHC-BoLA\Analisis\EHH-iHS\rehh\r1\run_chr-all'.
	nbases := 1000000.
	minChr to: maxChr do: [ :chrNumber | 
		| inputFilename outputFilename |
		inputFilename := 'chr_' , chrNumber asString , '.rsb.txt'.
		outputFilename := 'peaks_chr' , chrNumber asString , '.bed'.
		BioRehhLogPValueCollector new
			cwd: cwd;
			ylim: 2.0;
			nbases: nbases;
			chrNumber: chrNumber;
			inputFile: inputFilename;
			outputFilename: outputFilename;
			collectPeaks;
			dumpAsEnsembleBedFileBothStrands ]
examples
examplePlotHistogram

	(BioParser parseMultiFastaFile: BioObject testFilesDirectoryName asFileReference / 'ls_orchid.fasta') 
		plotHistogramBins: 20 
		xAxisLabel: 'Sequence lengths (bp)'
		yAxisLabel: 'Count' 
		color: Color red
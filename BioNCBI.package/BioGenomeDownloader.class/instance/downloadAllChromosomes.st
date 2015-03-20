accessing
downloadAllChromosomes
	" Download all chromosomes found for the receiver "

	1 to: self maxChr do: [ : chrNum | self downloadChromosome: chrNum ].
eUtilities-search-fetch
exampleDLoopSheep
	" 
	Download and save into a FASTA file the d-loop sequence for Sheep
	"
	| fastaRecord |
	fastaRecord := (BioEntrezClient new nuccore
		webEnv: (BioEntrezClient new nuccore
			term: 'L29055';
			setUseHistory;
			search);
		setFasta;			
		fetch) contents asFastaRecord.
	(fastaRecord sequence copyFrom: 670 to: 1858) dumpToFileNamed: 'e-nuccore-sheep-dloop.fa'.

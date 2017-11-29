eUtilities-search-fetch
exampleDLoopPig
	" 
	Download and save into a FASTA file the d-loop sequence for Sus scrofa. From: Complete nucleotide sequence of pig (Sus scrofa) mitochondrial genome and dating evolutionary divergence within Artiodactyla. Chich-Sheng et al. Gene 236 (1999) 107–114
	"

	| fastaRecord |
	fastaRecord := (BioEntrezClient new nuccore
		webEnv: (BioEntrezClient new nuccore
			term: 'AF034253';
			setUseHistory;
			search);
		setFasta;
		fetch) contents asFastaRecord.
	(fastaRecord sequence copyFrom: 1 to: 1175) dumpToFileNamed: 'e-nuccore-sus_scrofa-dloop.fa'.
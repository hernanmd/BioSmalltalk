accessing
buildHaplotypesList: params title: groupTitle

	| bioA31HaplotypeSection |
	
	bioA31HaplotypeSection := self haplotypesSubsection.
	bioA31HaplotypeSection
			addSampleData: (BioA31SampleCollection forDNA
					identifiers: params identifiers;
					sequences: params haplotypeSequences;
					yourself);
			yourself.
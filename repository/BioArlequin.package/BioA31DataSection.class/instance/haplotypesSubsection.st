subsections
haplotypesSubsection
	" Answer a samples subsection object for adding and removing samples "

	^ self 
		at: self notation
		ifAbsentPut: [ 
			BioA31SamplesSection 
				named: BioA31HaplotypeSection notation
				on: self iniFile ].
	

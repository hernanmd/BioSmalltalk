subsections
haplotypesSubsection
	" Answer a samples subsection object for
	adding and removing samples "

	^ self 
		at: self notation
		ifAbsentPut: [ BioA31HaplotypeSection new ].
	

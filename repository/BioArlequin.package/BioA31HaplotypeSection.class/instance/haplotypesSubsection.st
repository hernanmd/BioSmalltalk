subsections
haplotypesSubsection
	" Answer a samples subsection object for adding and removing samples "

	^ self 
		at: self class notation
		ifAbsentPut: [ 
			BioA31HaplotypeSection 
				named: BioA31HaplotypeSection notation
				on: self iniFile ].
	
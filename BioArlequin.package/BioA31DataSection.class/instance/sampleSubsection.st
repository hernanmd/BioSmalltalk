subsections
sampleSubsection
	" Answer a samples subsection object for adding and removing samples "

	^ self 
		at: self class notation
		ifAbsentPut: [ 
			BioA31SamplesSection 
				named: BioA31SamplesSection notation
				on: self iniFile ].
	

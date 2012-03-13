subsections
structureSubsection
	" Answer a samples subsection object for adding and removing samples "

	^ self 
		at: self class notation
		ifAbsentPut: [ 
			BioA31StructureSection 
				named: BioA31StructureSection notation
				on: self iniFile ].
	

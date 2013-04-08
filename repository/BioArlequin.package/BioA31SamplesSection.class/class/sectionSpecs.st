accessing
sectionSpecs
	" Answer a Collection with raw data related with the Arlequin input format "
	
	^ Array 
		with: (BioA31Spec newTitle: self sampleNameId isMandatory: true defaultValue: String new)
		with: (BioA31Spec newTitle: self sampleSizeId isMandatory: true defaultValue: 0)
		with: (BioA31Spec newTitle: self sampleDataId isMandatory: true defaultValue: String new format: '{}')
private
sectionSpecs
	" Answer a Collection with raw data related with the
	Arlequin input format "
	
	(ArlequinDataTypes isNil or: [ ArlequinLocusSeparators isNil ])
		ifTrue: [ self initialize ].
	^ { (self specClass newTitle: self titleId isMandatory: true defaultValue: String new format: $") .
		(self specClass newTitle: self sampleNumberId isMandatory: true defaultValue: nil range: (0 to: 1000)) .
		(self specClass newTitle: self dataTypeId isMandatory: true defaultValue: (ArlequinDataTypes anyOne) range: ArlequinDataTypes) .		
		(self specClass newTitle: self genotypicDataId isMandatory: true defaultValue: 'Genotypic' range: {'Haplotypic' . 'Genotypic'}) .				
		(self specClass newTitle: self locusSeparatorId  isMandatory: false defaultValue: Character space range: ArlequinLocusSeparators) .
		(self specClass newTitle: self gameticPhaseId isMandatory: false defaultValue: 'Known' range: {'Known' . 'Unknown'}) .	" Inducido por los archivos de ejemplo "
		(self specClass newTitle: self recessiveDataId isMandatory: false defaultValue: 'Co-dominant data' range: {'Co-dominant data' . 'Recessive data'}) .				
		(self specClass newTitle: self recessiveAlleleId isMandatory: false defaultValue: '""' format: $") .										
		(self specClass newTitle: self missingDataId isMandatory: false defaultValue: '?') .		
		(self specClass newTitle: self frequencyId isMandatory: false defaultValue: (ArlequinFrequencies anyOne) range: ArlequinFrequencies) .		
		(self specClass newTitle: self frequencyThresholdId isMandatory: false defaultValue: 1e-5 range: (1e-2 to: 1e-7)) .		
		(self specClass newTitle: self epsilonValueId isMandatory: false defaultValue: 1e-7 range: (1e-7 to: 1e-12)) }
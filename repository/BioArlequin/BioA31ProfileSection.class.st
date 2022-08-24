Class {
	#name : #BioA31ProfileSection,
	#superclass : #BioA31INISection,
	#classVars : [
		'ArlequinDataTypes',
		'ArlequinFrequencies',
		'ArlequinLocusSeparators'
	],
	#category : #'BioArlequin-Sections'
}

{ #category : #accessing }
BioA31ProfileSection class >> arlequinDataTypes [

	^ ArlequinDataTypes
]

{ #category : #accessing }
BioA31ProfileSection class >> arlequinFrequencies [

	^ ArlequinFrequencies
]

{ #category : #'property names' }
BioA31ProfileSection class >> dataTypeId [

	^ 'DataType' -> 'Type of data to be analyzed. Only one type of data is allowed per project'
]

{ #category : #'property names' }
BioA31ProfileSection class >> epsilonValueId [

	^ 'EpsilonValue' -> 'The convergence criterion for the EM algorithm used to estimate haplotype frequencies and linkage disequilibrium from genotypic data'
]

{ #category : #private }
BioA31ProfileSection class >> formatter [

	^ BioFormatter
]

{ #category : #'property names' }
BioA31ProfileSection class >> frequencyId [

	^ 'Frequency' -> 'If haplotype or phenotype frequencies are entered as absolute or relative values'
]

{ #category : #'property names' }
BioA31ProfileSection class >> frequencyThresholdId [

	^ 'FrequencyThreshold' -> 'The number of significant digits for haplotype frequency outputs'
]

{ #category : #'property names' }
BioA31ProfileSection class >> gameticPhaseId [

	^ 'GameticPhase' -> 'If the gametic phase of genotypes is known'
]

{ #category : #'property names' }
BioA31ProfileSection class >> genotypicDataId [

	^ 'GenotypicData' -> 'The current project deals with haplotypic or genotypic data?'
]

{ #category : #'class initialization' }
BioA31ProfileSection class >> initialize [
	" self initialize "
	
	ArlequinDataTypes := Array with: 'DNA' with: 'RFLP' with: 'MICROSAT' with: 'STANDARD' with: 'FREQUENCY'. 
	ArlequinFrequencies := Array with: 'ABS' with: 'REL'.
	ArlequinLocusSeparators := self formatter separators

]

{ #category : #'property names' }
BioA31ProfileSection class >> locusSeparatorId [

	^ 'LocusSeparator' -> 'The character used to separate the alleles at different loci'
]

{ #category : #accessing }
BioA31ProfileSection class >> mandatorySections [ 
	" Private - Answer a Collection with the mandatory sections for the receiver "

	^ self sectionSpecs select: [ : spec | spec isMandatory ]

]

{ #category : #'property names' }
BioA31ProfileSection class >> missingDataId [

	^ 'MissingData' -> 'The character used to code for missing data'
]

{ #category : #accessing }
BioA31ProfileSection class >> notation [
	" Answer a String describing the receiver's section identifier "
	
	^ 'Profile'
]

{ #category : #'property names' }
BioA31ProfileSection class >> recessiveAlleleId [

	^ 'RecessiveAllele' -> 'The code for the recessive allele'
]

{ #category : #'property names' }
BioA31ProfileSection class >> recessiveDataId [

	^ 'RecessiveData' -> 'If the genotypic data present a recessive allele'
]

{ #category : #'property names' }
BioA31ProfileSection class >> sampleNumberId [

	^ 'NbSamples' -> 'Number of samples or populations present in the current project. Enter 0 to calculate from input file in next step'
]

{ #category : #private }
BioA31ProfileSection class >> sectionSpecs [
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
]

{ #category : #private }
BioA31ProfileSection class >> specClass [

	^ BioA31Spec
]

{ #category : #'property names' }
BioA31ProfileSection class >> titleId [

	^ 'Title' -> 'Title of the current project'
]

{ #category : #'setting configurations' }
BioA31ProfileSection >> addDataType: aString [
	" Set a value for the DataType configuration "
	
	| configuration |
	configuration := self configurationAt: self class dataTypeId.
	(configuration validate: aString)
		ifTrue: [ self at: self class dataTypeId put: aString asString ]
		ifFalse: [ self bioLog: aString , ' is not listed as a valid type for DataType' ]
]

{ #category : #'setting configurations' }
BioA31ProfileSection >> addEpsilonValue: aFloat [
	" Set a value for the EpsilonValue configuration "
	
	| configuration |
	configuration := self configurationAt: self class epsilonValueId.
	(configuration validate: aFloat)
		ifTrue: [ self at: self class epsilonValueId put: aFloat asString ]
		ifFalse: [ self bioLog: aFloat , ' value is not listed as a valid epsilon value' ]
]

{ #category : #'setting configurations' }
BioA31ProfileSection >> addFrequency: aString [
	" Set a value for the Frequency configuration "
	
	| configuration |
	configuration := self configurationAt: self class frequencyId.
	(configuration validate: aString)
		ifTrue: [ self at: self class frequencyId put: aString asString ]
		ifFalse: [ self bioLog: aString , ' value is not listed as a valid frequency string' ]

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> addFrequencyThreshold: aFraction [
	" Set a value for the FrequencyThreshold configuration "
	
	| configuration |
	configuration := self configurationAt: self class frequencyThresholdId.
	" ToDo:  '1/10000' asNumber  "
	^ true
"	( configuration validate: aFraction )
		ifTrue: [ self at: self class frequencyThresholdId put: aFraction asString ]
		ifFalse: [ self log: aFraction asString , ' value is not listed as a valid frequency threshold'] "
]

{ #category : #'setting configurations' }
BioA31ProfileSection >> addSampleNumber: aNumber [
	" Set a value for the NbSamples (number of samples) configuration "
	
	| configuration |
	configuration := self configurationAt: self class sampleNumberId.
	(configuration validate: aNumber asNumber)
		ifTrue: [ self at: self class sampleNumberId put: aNumber asString ]
		ifFalse: [ self bioLog: aNumber asString , ' value out of range for NbSamples' ]
]

{ #category : #'setting configurations' }
BioA31ProfileSection >> addTitle: aString [
	" Set a value for the Title configuration "
	
	self 
		at: self class titleId
		put: aString
]

{ #category : #'getting configurations' }
BioA31ProfileSection >> dataType [
	" Answer a String with the DataType configuration "
	
	^ self configurationAt: self class dataTypeId.

]

{ #category : #'getting configurations' }
BioA31ProfileSection >> frequency [
	" Answer a String with the configuration "
	
	^ self configurationAt: self class frequencyId.

]

{ #category : #'getting configurations' }
BioA31ProfileSection >> frequencyThreshold [
	" Answer a String with the configuration "
	
	^ self configurationAt: self class frequencyThresholdId.

]

{ #category : #'getting configurations' }
BioA31ProfileSection >> gameticPhase [
	" Answer a String with the GameticPhase configuration "
	
	^ self configurationAt: self class gameticPhaseId

]

{ #category : #'getting configurations' }
BioA31ProfileSection >> genotypicData [
	" Anwer a String the GenotypicData configuration "
	
	^ self configurationAt: self class genotypicDataId

]

{ #category : #'getting configurations' }
BioA31ProfileSection >> haplotypicData [
	" Answer a String with the HaplotypicData configuration "
	
	^ self at: 'HaplotypicData'

]

{ #category : #'getting configurations' }
BioA31ProfileSection >> locusSeparator [
	" Answer a Character for the LocusSeparator configuration "
	
	^ self configurationAt: self class locusSeparatorId.

]

{ #category : #'getting configurations' }
BioA31ProfileSection >> missingData [
	" Answer a Character for the MissingData configuration "
	
	^ self configurationAt: self class missingDataId
]

{ #category : #'getting configurations' }
BioA31ProfileSection >> recessiveAllele [
	" Answer a String with the RecessiveAllele configuration "
	
	^ self at: self class recessiveAlleleId ifAbsent: [ '""' ]

]

{ #category : #'getting configurations' }
BioA31ProfileSection >> recessiveData [
	" Answer a String with the RecessiveData configuration "
	
	^ self configurationAt: self class recessiveDataId.

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> setCodominantData [
	" Set a value for the RecessiveData configuration "
	
	self at: self class recessiveDataId put: '1'.

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> setGenotypicData [
	" Set a value for the GenotypicData configuration "
	
	self at: self class genotypicDataId put: '1'.

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> setHaplotypicData [
	" Set a value for the HaplotypicData configuration "
	
	self at: 'HaplotypicData' put: '1'.

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> setKnownGameticPhase [
	" Set a value for the GameticPhase configuration "
	
	self at: self class gameticPhaseId put: '1'.

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> setRecessiveData [
	" Set a value for the RecessiveData configuration "
	
	self at: self class recessiveDataId put: '1'.

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> setUnknownGameticPhase [
	" Set a value for the GameticPhase configuration "
	
	self at: self class gameticPhaseId put: '0'.

]

{ #category : #'getting configurations' }
BioA31ProfileSection >> title [
	" Answer a String for the Title configuration "
	
	^ self at: self class titleId ifAbsent: [ '""' ]
]

{ #category : #'setting configurations' }
BioA31ProfileSection >> unsetCodominantData [
	" Set a value for the RecessiveData configuration "
	
	self at: self class recessiveDataId put: '0'.

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> unsetGenotypicData [
	" Set a value for the GenotypicData configuration "
	
	self at: self class genotypicDataId put: '0'.

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> unsetHaplotypicData [
	" Set a value for the HaplotypicData configuration "
	
	self at: 'HaplotypicData' put: '0'.

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> unsetRecessiveData [
	" Set a value for the RecessiveData configuration "
	
	self at: self class recessiveDataId put: '1'.

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> useLocusSeparator: aCharacter [
	" Set a value for the LocusSeparator configuration "
	
	| configuration |
	configuration := self configurationAt: self class locusSeparatorId.
	(configuration validate: aCharacter)
		ifTrue: [ self at: self class locusSeparatorId put: aCharacter asString ]
		ifFalse: [ self bioLog: aCharacter asString , ' value is not listed as a valid locus separator' ]

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> useMissingData: aCharacter [
	" Set a value for the MissingData configuration "
	
	| configuration |
	
	configuration := self configurationAt: self class missingDataId.
	(configuration validate: aCharacter)
		ifTrue: [ self at: self class missingDataId put: aCharacter asString ]
		ifFalse: [ self bioLog: aCharacter , ' value is not listed as a valid missing data character' ]

]

{ #category : #'setting configurations' }
BioA31ProfileSection >> useRecessiveAllele: aString [
	" Set a value for the MissingData configuration "
	
	| configuration |
	configuration := self configurationAt: self class recessiveAlleleId.
	(configuration validate: aString)
		ifTrue: [ self at: self class recessiveAlleleId put: aString asString ]
		ifFalse: [ self bioLog: aString , ' value is not listed as a valid missing data character' ]

]

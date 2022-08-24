Class {
	#name : #BioArlequinFile,
	#superclass : #INIFile,
	#instVars : [
		'dataSection',
		'sampleKeyNumber',
		'samplesSection',
		'haplotypesSection'
	],
	#category : #'BioArlequin-Core'
}

{ #category : #'instance creation' }
BioArlequinFile class >> buildGroupsFrom: aClassifier [

	^ (BioA31GroupBuilder newFromClassifications: aClassifier groupByPaddedAlignment) groups.
]

{ #category : #'instance creation' }
BioArlequinFile class >> named: aFilename forHaplotypicDNAGroups: aClassifier [

	| newInstance arGroups |
	
	arGroups := self buildGroupsFrom: aClassifier.
	newInstance := self newArlequinFileNamed: aFilename haplotypeDNAGroups: arGroups.
	^ BioObject
		dumpToDOSFileNamed: aFilename
		contents: newInstance contents
]

{ #category : #'instance creation' }
BioArlequinFile class >> named: aString forHaplotypicFrequencyGroups: aClassifier [

	| newInstance arGroups |
	
	arGroups := self buildGroupsFrom: aClassifier.
	newInstance := self new.
	newInstance 
		buildHaplotypicDataFrequencyProfileTitle: aString
		groups: arGroups size
		missingData: '?'.
	newInstance dataSection
		addDNAGroups: arGroups.
	newInstance newStructureSection
		addStructureName: aString;
		addNbGroups: arGroups size;
		addGroups: arGroups.
	^ newInstance dumpToFileNamed: aString
]

{ #category : #private }
BioArlequinFile class >> newArlequinFileNamed: aString haplotypeDNAGroups: arGroupsCollection [ 

	| newInstance |
	
	newInstance := self new.
	newInstance 
		buildHaplotypicDataDNAProfileTitle: aString
		groups: arGroupsCollection size
		missingData: '?'.
	newInstance dataSection.
	newInstance haplotypesSection  
		addHaplotypes: arGroupsCollection.
	newInstance samplesSection
		addDNAGroups: arGroupsCollection.
	newInstance newStructureSection
		addStructureName: aString;
		addNbGroups: 1;
		addGroups: arGroupsCollection.
	^ newInstance
]

{ #category : #building }
BioArlequinFile >> buildDNASample: params title: groupTitle [

	self dataSection 
			buildDNASample: params 
			title: groupTitle
]

{ #category : #building }
BioArlequinFile >> buildHaplotypicDataDNAProfile: aDictionary title: aString groups: aNumber [

	self newProfileSection
		addTitle: aString;
		addSampleNumber: aNumber;
		addDataType: 'DNA';
		unsetGenotypicData;
		useMissingData: '''?''';
		useLocusSeparator: 'WHITESPACE'.
]

{ #category : #building }
BioArlequinFile >> buildHaplotypicDataDNAProfileTitle: aString groups: aNumber missingData: missingCharacter [

	self newProfileSection
		addTitle: aString;
		addSampleNumber: aNumber;
		addDataType: 'DNA';
		unsetGenotypicData;
		useMissingData: missingCharacter asString;
		useLocusSeparator: 'WHITESPACE'.
]

{ #category : #building }
BioArlequinFile >> buildHaplotypicDataFrequencyProfileTitle: aString groups: aNumber missingData: missingCharacter [

	self newProfileSection
		addTitle: aString;
		addSampleNumber: aNumber;
		addDataType: 'FREQUENCY';
		unsetGenotypicData;
		useMissingData: missingCharacter asString;
		useLocusSeparator: 'WHITESPACE'.
]

{ #category : #review }
BioArlequinFile >> contents [
	" Answer a String with receiver's output contents "

	^ String streamContents: [ : s |
			| output |
			self writeOn: (output := WriteStream on: String new).
			s nextPutAll: output contents ]
]

{ #category : #sections }
BioArlequinFile >> dataSection [
	" Private - Set and answer a new data section "
	
	^ self ensureSectionDictionary: BioA31DataSection notation.

]

{ #category : #private }
BioArlequinFile >> dictionaryClass [

	^ OrderPreservingDictionary
]

{ #category : #sections }
BioArlequinFile >> haplotypesSection [
	" Private - Set and answer a new haplotypes section "
	
	^ haplotypesSection 
		ifNil: [ haplotypesSection := self newHaplotypesSection ].

]

{ #category : #testing }
BioArlequinFile >> includesSection: label [
"	self needsWork."
	
	^ (super includesSection: label) 
		or: [ (self sectionDictionaries includesKey: 1) 
			or: [ dataSection isNil not ] ]
]

{ #category : #sections }
BioArlequinFile >> newDataSection [

	^ self newSectionNamed: BioA31DataSection
]

{ #category : #sections }
BioArlequinFile >> newHaplotypesSection [
	" Private - Set and answer a new Haplotypes section "
	
	^ self newSectionNamed: BioA31HaplotypeSection
]

{ #category : #sections }
BioArlequinFile >> newProfileSection [
	" Private - Answer a new [Profile] section "
	
	^ self newSectionNamed: BioA31ProfileSection
]

{ #category : #private }
BioArlequinFile >> newSampleKey [
	" Answer an 'anonymous' sample key Number suitable for adding a new sample "
	
	self sampleKeyNumber: self sampleKeyNumber + 1.
	^ self sampleKeyNumber
]

{ #category : #sections }
BioArlequinFile >> newSamplesSection [
	" Private - Answer a new [Samples] section "
	
	^ self newSectionNamed: BioA31SamplesSection
]

{ #category : #review }
BioArlequinFile >> newSectionNamed: aSectionClass [
	" Private - Delegate naming of section a aSectionClass. Answer a new data section for aSectionClass "
	
	^ aSectionClass
			named: aSectionClass notationSection 
			on: self
]

{ #category : #sections }
BioArlequinFile >> newStructureSection [
	" Private - Set and answer a new Structure section "
	
	^ self newSectionNamed: BioA31StructureSection
]

{ #category : #private }
BioArlequinFile >> sampleKeyNumber [
	^ sampleKeyNumber
		ifNil: [ sampleKeyNumber := 0 ]
]

{ #category : #private }
BioArlequinFile >> sampleKeyNumber: anObject [
	sampleKeyNumber := anObject
]

{ #category : #sections }
BioArlequinFile >> samplesSection [
	" Private - Answer the receiver's [Samples] section "
	
	^ samplesSection
		ifNil: [ samplesSection := self newSamplesSection ].

]

{ #category : #accessing }
BioArlequinFile >> section: sectionString [

	^ (BioA31INISection classFor: sectionString) named: sectionString on: self
]

{ #category : #private }
BioArlequinFile >> section: label at: keyString put: valueString [

	^ (self ensureSectionDictionary: label)
			at: keyString 
			put: valueString
]

{ #category : #accessing }
BioArlequinFile >> sectionsDo: aBlock [

	self sectionDictionaries do: [ : assoc | 
		| sectionClass |
		sectionClass := BioA31INISection classFor: assoc key.
		aBlock value: (sectionClass on: self label: assoc key) ]
]

{ #category : #accessing }
BioArlequinFile >> subSectionsTopClass [

	^ BioA31INISection
]

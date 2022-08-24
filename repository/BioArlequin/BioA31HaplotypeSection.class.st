Class {
	#name : #BioA31HaplotypeSection,
	#superclass : #BioA31INISection,
	#classVars : [
		'HaplListValues'
	],
	#category : #'BioArlequin-Sections'
}

{ #category : #private }
BioA31HaplotypeSection class >> haplotypeListId [
	" Answer a <String> with receiver's property name "

	^ 'HaplList' 
]

{ #category : #private }
BioA31HaplotypeSection class >> haplotypeListNameId [ 
	" Answer a String with the property's name "

	^ 'HaplListName' 
]

{ #category : #accessing }
BioA31HaplotypeSection class >> notation [
	" Answer a String describing the receiver's section identifier "
	
	^ '[HaplotypeDefinition]'
]

{ #category : #private }
BioA31HaplotypeSection class >> sectionSpecs [
	" Answer a Collection with raw data related with the Arlequin input format "
	
	^ Array with: (BioA31Spec 
				newTitle: self haplotypeListNameId
				isMandatory: true 
				defaultValue: String new
				format: $")
			with: (BioA31Spec new
				title: self haplotypeListId;
				isMandatory: true;
				defaultValue: nil; 
				range: HaplListValues;
				format: $")
]

{ #category : #accessing }
BioA31HaplotypeSection >> addHaplotypes: groupCollection [
	
	self addSampleData: (groupCollection collect: [ : group |
		self 
			buildHaplotypesList: group data 
			title: group name ] )
]

{ #category : #private }
BioA31HaplotypeSection >> addSampleData: aSampleCollection [
	"Add aSampleCollection to the receiver"

	self iniFile 
		section: self class notation
		at: self class haplotypeListId
		put: aSampleCollection.

]

{ #category : #'adding configurations' }
BioA31HaplotypeSection >> addTitle: aString [
	"Set a value for the Title configuration"
	
	self at: self class haplotypeListNameId put: aString
]

{ #category : #accessing }
BioA31HaplotypeSection >> buildHaplotypesList: params title: groupTitle [

	^ BioA31SampleCollection forDNA
		iniFile: self iniFile;
		identifiers: params identifiers;
		sequences: params haplotypeSequences;
		yourself

]

{ #category : #subsections }
BioA31HaplotypeSection >> haplotypesSubsection [
	" Answer a samples subsection object for adding and removing samples "

	^ self 
		at: self class notation
		ifAbsentPut: [ 
			BioA31HaplotypeSection 
				named: BioA31HaplotypeSection notation
				on: self iniFile ].
	

]

{ #category : #private }
BioA31HaplotypeSection >> writeOn: aStream [
	" Private - Write the receiver's title and key/value pairs in aStream "
	
	| samplesAssoc sampleCollections |
	
	samplesAssoc := self associations anyOne.
	self writeLabelOn: aStream.
	aStream 
		nextPutAll: samplesAssoc key;
		nextPut: $=;
		nextPut: ${;
		cr.
	sampleCollections := (samplesAssoc value flatCollect: #samples) sortedAs: #identifier.
	sampleCollections asSet 	do: [ : arlequinSample | arlequinSample writeOn: aStream ].
	aStream 
		nextPut: $}
]

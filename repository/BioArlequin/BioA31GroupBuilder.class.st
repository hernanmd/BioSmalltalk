"
This group builder accepts as input:

1) A grouping selector symbol named keyString 
2) A BioClassifications object (Dictionary) containing regions elements (Associations) each one as:

key:	<TCountryOrganization>			example: TSpain
value:	<Dictionary of: Dictionary>		example: #(ClassificationDictionary1 ClassificationDictionary2 ... ClassificationDictionaryN)

each Dictionary inside this Dictionary follows this format:

key:	<String>							example: 'ACAGGTACGTAGCATGCA'
value:	<Object | BioClassification>

Then proceeds grouping the ClassificationDictionary(s) in each region by #perform: the keyString selector (which should be responded by each ClassificationDictionary).

Usage:

| grouping arlequinGroups |
grouping 		:= ObjectWithAlignments groupByAlignments.
arlequinGroups := ( BioA31GroupBuilder 
						groupBy: #aSelector 
						classifications: grouping ) groups.

The output is a Collection of <GTA31Group>
"
Class {
	#name : #BioA31GroupBuilder,
	#superclass : #BioNamedObject,
	#instVars : [
		'groupSamples',
		'haplotypes',
		'haplotypesBag',
		'data'
	],
	#category : 'BioArlequin-Core'
}

{ #category : #'instance creation' }
BioA31GroupBuilder class >> newFromClassifications: classifications [
	" Answer a new receiver's instance setting classifications "
	
	^ self new 
		data: classifications;
		yourself
		
]

{ #category : #accessing }
BioA31GroupBuilder >> atHaplotypeName: aString [ 
	" Answer a <String> "

	^ (self haplotypes 
		detect: [ : hap | hap name = aString ]
		ifNone: [ self error: 'Haplotype named ' , aString , ' not found' ]) sequence asString.
]

{ #category : #accessing }
BioA31GroupBuilder >> atSequence: aString [ 
	" Answer a <String> "

	^ (self haplotypes 
		detect: [ : hap | hap sequence = aString ]
		ifNone: [ self error: 'Haplotype not found' ]) name.
]

{ #category : #private }
BioA31GroupBuilder >> buildGroupSamples [

	groupSamples := self data collect: [ : classAssoc |
		classAssoc key -> (self buildSamplesFromGroupedDictionaries: classAssoc value ) ].
	^  BioA31Group fromBuilder: self.
]

{ #category : #private }
BioA31GroupBuilder >> buildHaplotype: groupedDictionaries [ 

	^ groupedDictionaries collect: [ : gbSeqDictionary | 
		gbSeqDictionary 
			at: 'Padded_sequence' 
			ifAbsent: [ self error: 'Sequences were not padded for Arlequin export' ] ].
]

{ #category : #private }
BioA31GroupBuilder >> buildHaplotypes [

	self haplotypesBag: (self data flatCollect: [ : keyValue | self buildHaplotype: keyValue value ]) asBag.
	

]

{ #category : #accessing }
BioA31GroupBuilder >> buildSampleData [
	" Private - Territory names and samples contents must correspond each other. "
	
	^ BioA31SampleParameters on: self data.

]

{ #category : #private }
BioA31GroupBuilder >> buildSamplesFromGroupedDictionaries: aCollection [ 

	^ aCollection groupedBy: [ : gbSeqDictionary | 
		gbSeqDictionary at: 'Padded_sequence' ]

]

{ #category : #accessing }
BioA31GroupBuilder >> data [
	^ data
]

{ #category : #accessing }
BioA31GroupBuilder >> data: anObject [

	data := anObject.

]

{ #category : #accessing }
BioA31GroupBuilder >> groupSamples [
	^ groupSamples
]

{ #category : #accessing }
BioA31GroupBuilder >> groupSamples: anObject [
	groupSamples := anObject
]

{ #category : #accessing }
BioA31GroupBuilder >> groups [
	" Answer a <Collection> of Arlequin groups "

	self buildHaplotypes.
	^ self buildGroupSamples.

]

{ #category : #accessing }
BioA31GroupBuilder >> haplotypes [
	^ haplotypes
		ifNil: [ haplotypes := self initializeHaplotypes ]
]

{ #category : #accessing }
BioA31GroupBuilder >> haplotypesBag [
	^ haplotypesBag
]

{ #category : #accessing }
BioA31GroupBuilder >> haplotypesBag: aCollection [ 

	haplotypesBag := aCollection
]

{ #category : #accessing }
BioA31GroupBuilder >> initializeHaplotypes [

	| index |
	index := 0.
	^ self haplotypesBag  asSet collect: [ : sequence | 
		index := index + 1.
		BioHaplotype new 
			name: 'h' , index asString;
			sequence: sequence;
			popFreq: (self haplotypesBag occurrencesOf: sequence);
			yourself ].
]

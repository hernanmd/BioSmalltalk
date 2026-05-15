Class {
	#name : 'BioHaplotypePanel',
	#superclass : 'Object',
	#instVars : [
		'panelVariants',
		'panelName',
		'metadata'
	],
	#classInstVars : [
		'Registry'
	],
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'registry' }
BioHaplotypePanel class >> allPanels [

	^ self registry values
]

{ #category : 'examples' }
BioHaplotypePanel class >> examplePanel [

	| panel v1 v2 v3 |
	v1 := BioVariant
		      position: 100
		      referenceAllele: 'A'
		      alternateAlleles: #( 'T' )
		      rsID: 'rs111'
		      chromosome: '1'.
	v2 := BioVariant
		      position: 200
		      referenceAllele: 'C'
		      alternateAlleles: #( 'G' )
		      rsID: 'rs222'
		      chromosome: '1'.
	v3 := BioVariant
		      position: 300
		      referenceAllele: 'G'
		      alternateAlleles: #( 'A' )
		      rsID: 'rs333'
		      chromosome: '1'.
	panel := BioHaplotypePanel new
		         panelName: 'ExamplePanel';
		         addVariant: v1;
		         addVariant: v2;
		         addVariant: v3;
		         yourself.
	BioHaplotypePanel register: panel.
	^ panel
]

{ #category : 'registry' }
BioHaplotypePanel class >> panelNamed: aString [

	^ self registry at: aString ifAbsent: [ nil ]
]

{ #category : 'registry' }
BioHaplotypePanel class >> register: aPanel [

	self registry at: aPanel panelName put: aPanel
]

{ #category : 'registry' }
BioHaplotypePanel class >> registry [

	^ Registry ifNil: [ Registry := Dictionary new ]
]

{ #category : 'registry' }
BioHaplotypePanel class >> resetRegistry [

	Registry := nil
]

{ #category : 'registry' }
BioHaplotypePanel class >> unregister: aPanel [

	self registry removeKey: aPanel panelName ifAbsent: [ nil ]
]

{ #category : 'adding' }
BioHaplotypePanel >> addVariant: aBioVariant [

	self panelVariants add: aBioVariant.
	self announce: (BioVariantRegistered variant: aBioVariant).
	^ aBioVariant
]

{ #category : 'announcing' }
BioHaplotypePanel >> announce: anAnnouncement [

	(self metadata at: #announcer ifAbsentPut: [ Announcer new ])
		announce: anAnnouncement
]

{ #category : 'enumerating' }
BioHaplotypePanel >> do: aBlock [

	^ self panelVariants do: aBlock
]

{ #category : 'accessing' }
BioHaplotypePanel >> metadata [

	^ metadata ifNil: [ metadata := Dictionary new ]
]

{ #category : 'announcing' }
BioHaplotypePanel >> on: anAnnouncementClass do: aBlock [

	(self metadata at: #announcer ifAbsentPut: [ Announcer new ])
		on: anAnnouncementClass
		do: aBlock
]

{ #category : 'accessing' }
BioHaplotypePanel >> panelName [

	^ panelName
]

{ #category : 'accessing' }
BioHaplotypePanel >> panelName: aString [

	panelName := aString
]

{ #category : 'accessing' }
BioHaplotypePanel >> panelVariants [

	^ panelVariants ifNil: [ panelVariants := OrderedCollection new ]
]

{ #category : 'accessing' }
BioHaplotypePanel >> panelVariants: aCollection [

	panelVariants := aCollection
]

{ #category : 'accessing' }
BioHaplotypePanel >> size [

	^ self panelVariants size
]

{ #category : 'accessing' }
BioHaplotypePanel >> variantAtPosition: anInteger [

	^ self panelVariants
		  detect: [ :v | v position = anInteger ]
		  ifNone: [ nil ]
]

{ #category : 'accessing' }
BioHaplotypePanel >> variantAtRsID: aString [

	^ self panelVariants
		  detect: [ :v | v rsID = aString ]
		  ifNone: [ nil ]
]

{ #category : 'announcing' }
BioHaplotypePanel >> when: anAnnouncementClass do: aBlock [

	(self metadata at: #announcer ifAbsentPut: [ Announcer new ])
		when: anAnnouncementClass
		do: aBlock
		for: self
]

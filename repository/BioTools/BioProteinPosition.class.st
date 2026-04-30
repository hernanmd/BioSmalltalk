Class {
	#name : 'BioProteinPosition',
	#superclass : 'BioObject',
	#instVars : [
		'position'
	],
	#category : 'BioTools-Genomic-Coordinates',
	#package : 'BioTools',
	#tag : 'Genomic-Coordinates'
}

{ #category : 'as yet unclassified' }
BioProteinPosition class >> at: anInteger [
    anInteger < 1 ifTrue: [ ^ self error: 'Position must be 1-based' ].
    ^ self new position: anInteger
]

{ #category : 'as yet unclassified' }
BioProteinPosition class >> from: aPosition [
    ^ self at: aPosition
]

{ #category : 'comparing' }
BioProteinPosition >> = other [
    ^ self species = other species and: [ position = other position ]
]

{ #category : 'converting' }
BioProteinPosition >> asInteger [
    ^ position
]

{ #category : 'comparing' }
BioProteinPosition >> hash [
    ^ position hash
]

{ #category : 'accessing' }
BioProteinPosition >> position [
    ^ position
]

{ #category : 'accessing' }
BioProteinPosition >> position: anInteger [
    position := anInteger
]

{ #category : 'printing' }
BioProteinPosition >> printOn: aStream [
    aStream nextPutAll: 'p.'; print: position
]

{ #category : 'converting' }
BioProteinPosition >> toBed [
    ^ position - 1
]

{ #category : 'converting' }
BioProteinPosition >> toGenBank [
    ^ position
]

{ #category : 'converting' }
BioProteinPosition >> toHGVS [
    ^ 'p.' , position asString
]

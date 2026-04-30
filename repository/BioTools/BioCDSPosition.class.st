Class {
	#name : 'BioCDSPosition',
	#superclass : 'BioObject',
	#instVars : [
		'anchor',
		'offset',
		'positionType'
	],
	#category : 'BioTools-Genomic-Coordinates',
	#package : 'BioTools',
	#tag : 'Genomic-Coordinates'
}

{ #category : 'as yet unclassified' }
BioCDSPosition class >> anchor: anAnchor offset: anOffset [
    | pos |
    anAnchor < 1 ifTrue: [ self error: 'Anchor must be 1-based' ].
    pos := self new anchor: anAnchor; offset: anOffset; positionType: #intron; yourself.
    pos validate.
    ^ pos
]

{ #category : 'as yet unclassified' }
BioCDSPosition class >> at: aPosition [
    aPosition < 1 ifTrue: [ self error: 'Position must be 1-based' ].
    ^ self new 
        anchor: aPosition;
        offset: nil;
        positionType: #exon;
        yourself
]

{ #category : 'as yet unclassified' }
BioCDSPosition class >> exon: aPosition [
    ^ self at: aPosition
]

{ #category : 'as yet unclassified' }
BioCDSPosition class >> fromDialect: dialect position: aStringOrNumber [
    aStringOrNumber isNumber ifTrue: [ ^ self at: aStringOrNumber ].
    ^ self parseString: aStringOrNumber
]

{ #category : 'as yet unclassified' }
BioCDSPosition class >> intron: anAnchor offset: anOffset [
    ^ self anchor: anAnchor offset: anOffset
]

{ #category : 'as yet unclassified' }
BioCDSPosition class >> parseString: aString [
    | cleanString delimiter anchor offset |
    cleanString := aString.
    (cleanString beginsWith: 'c.') ifTrue: [ cleanString := cleanString allButFirst: 2 ].
    (cleanString first = $*) ifTrue: [
        ^ self new anchor: nil; offset: (cleanString allButFirst asNumber); positionType: #postCDS; yourself ].
    (cleanString first = $- and: [ (cleanString copyFrom: 2) isAllDigits ]) ifTrue: [
        ^ self new anchor: nil; offset: cleanString asNumber; positionType: #preCDS; yourself ].
    delimiter := cleanString indexOfAnyOf: '+'->'-'.
    delimiter = 0 ifTrue: [ ^ self at: cleanString asNumber ].
    anchor := cleanString copyFrom: 1 to: delimiter - 1.
    offset := (cleanString copyFrom: delimiter) asNumber.
    ^ self anchor: anchor asNumber offset: offset
]

{ #category : 'as yet unclassified' }
BioCDSPosition class >> postCDS: anOffset [
    ^ self new anchor: nil; offset: anOffset; positionType: #postCDS; yourself
]

{ #category : 'as yet unclassified' }
BioCDSPosition class >> preCDS: anOffset [
    ^ self new anchor: nil; offset: anOffset; positionType: #preCDS; yourself
]

{ #category : 'comparing' }
BioCDSPosition >> = anObject [

	^ self species = anObject species and: [
		  self anchor = anObject anchor and: [
			  self offset = anObject offset ] ]
]

{ #category : 'accessing' }
BioCDSPosition >> anchor [
    ^ anchor
]

{ #category : 'accessing' }
BioCDSPosition >> anchor: anInteger [
    anchor := anInteger
]

{ #category : 'comparing' }
BioCDSPosition >> hash [
    ^ (anchor ifNil: [ 0 ]) hash bitXor: (offset ifNil: [ 0 ]) hash
]

{ #category : 'testing' }
BioCDSPosition >> isExon [
    ^ positionType = #exon
]

{ #category : 'testing' }
BioCDSPosition >> isIntron [
    ^ positionType = #intron
]

{ #category : 'testing' }
BioCDSPosition >> isPostCDS [
    ^ positionType = #postCDS
]

{ #category : 'testing' }
BioCDSPosition >> isPreCDS [
    ^ positionType = #preCDS
]

{ #category : 'accessing' }
BioCDSPosition >> offset [
    ^ offset
]

{ #category : 'accessing' }
BioCDSPosition >> offset: anInteger [
    offset := anInteger
]

{ #category : 'accessing' }
BioCDSPosition >> position [
    anchor ifNil: [ ^ nil ].
    self isExon ifTrue: [ ^ anchor ].
    ^ nil
]

{ #category : 'accessing' }
BioCDSPosition >> positionType [
    ^ positionType ifNil: [
        anchor isNil 
            ifTrue: [ offset > 0 ifTrue: [ #postCDS ] ifFalse: [ #preCDS ] ]
            ifFalse: [ offset isNil ifTrue: [ #exon ] ifFalse: [ #intron ] ] ]
]

{ #category : 'accessing' }
BioCDSPosition >> positionType: aSymbol [
    positionType := aSymbol
]

{ #category : 'printing' }
BioCDSPosition >> printOn: aStream [

	aStream nextPutAll: 'c.'.
	positionType = #postCDS ifTrue: [
			aStream
				nextPut: $*;
				print: offset.
			^ self ].
	positionType = #preCDS ifTrue: [
			offset printOn: aStream.
			^ self ].
	positionType = #intron ifTrue: [
			anchor printOn: aStream.
			aStream nextPut: (offset > 0
					 ifTrue: [ $+ ]
					 ifFalse: [ $- ]).
			offset abs printOn: aStream.
			^ self ].
	anchor printOn: aStream
]

{ #category : 'converting' }
BioCDSPosition >> toHGVS [

	self isExon ifTrue: [ ^ anchor asString ].
	^ self printString allButFirst: 2
]

{ #category : 'accessing' }
BioCDSPosition >> validate [

	(anchor isNil and: [ offset isNil ]) ifTrue: [
		self error: 'CDS position requires anchor or offset' ].
	(anchor isNil and: [ offset = 0 ]) ifTrue: [
		self error: 'Offset cannot be zero' ].
	(anchor notNil and: [ anchor < 1 ]) ifTrue: [
		self error: 'Anchor must be 1-based' ]
]

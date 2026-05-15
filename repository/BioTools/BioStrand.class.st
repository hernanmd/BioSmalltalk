"
Represents a strand orientation in genomic coordinates (forward + or reverse -). Instance Variables: symbol <Symbol> The strand symbol (#plus or #minus).
"
Class {
	#name : 'BioStrand',
	#superclass : 'BioObject',
	#instVars : [
		'symbol'
	],
	#classInstVars : [
		'Plus',
		'Minus',
		'Unknown'
	],
	#category : 'BioTools-Genomic-Ranges',
	#package : 'BioTools',
	#tag : 'Genomic-Ranges'
}

{ #category : 'class initialization' }
BioStrand class >> from: anObject [
	| s |
	s := anObject asString.
	s = '+' ifTrue: [ ^ self plus ].
	s = '-' ifTrue: [ ^ self minus ].
	s = '*' ifTrue: [ ^ self unknown ].
	self error: 'Invalid strand: ', s
]

{ #category : 'class initialization' }
BioStrand class >> initialize [
	"Initialize singleton strand values."
	Plus := self new symbol: #+; yourself.
	Minus := self new symbol: #-; yourself.
	Unknown := self new symbol: #*
]

{ #category : 'class initialization' }
BioStrand class >> minus [
	Minus ifNil: [ self initialize ].
	^ Minus
]

{ #category : 'class initialization' }
BioStrand class >> plus [
	Plus ifNil: [ self initialize ].
	^ Plus
]

{ #category : 'class initialization' }
BioStrand class >> unknown [
	Unknown ifNil: [ self initialize ].
	^ Unknown
]

{ #category : 'accessing' }
BioStrand >> flip [
	symbol = #+ ifTrue: [ ^ BioStrand minus ].
	symbol = #- ifTrue: [ ^ BioStrand plus ].
	^ self class unknown
]

{ #category : 'testing' }
BioStrand >> isMinus [
	^ symbol = #-
]

{ #category : 'testing' }
BioStrand >> isPlus [
	^ symbol = #+
]

{ #category : 'testing' }
BioStrand >> isUnknown [
	^ symbol = #*
]

{ #category : 'printing' }
BioStrand >> printOn: aStream [
	aStream nextPutAll: symbol asString
]

{ #category : 'accessing' }
BioStrand >> symbol [
	^ symbol
]

{ #category : 'accessing' }
BioStrand >> symbol: aSymbol [
	symbol := aSymbol
]

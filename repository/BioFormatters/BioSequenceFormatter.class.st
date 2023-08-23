"
A BioSequenceFormatter can format a given String (presumably a sequence) to several output formats.



"
Class {
	#name : #BioSequenceFormatter,
	#superclass : #BioFormatter,
	#instVars : [
		'sequence'
	],
	#category : #'BioFormatters-Formatters'
}

{ #category : #accessing }
BioSequenceFormatter class >> identifiers [

	^ String empty
]

{ #category : #accessing }
BioSequenceFormatter class >> joinSequence: aCollection [
	" Private - Answer a String with the sequence ensambled from aCollection.
	aCollection is a collection of collections with each element composed by Strings or Characters "
	
	^ (aCollection flatCollect: [: each | each select: [: elem | elem isBiologicalSequence ] ]) joinUsing: String empty
]

{ #category : #accessing }
BioSequenceFormatter >> asTriplet [
	" Answer a String with the receiver's DNA or RNA sequence decoded by triplets "
	
	| answer |
	answer := String streamContents: [ : stream |
		1 to: self sequence size by: 3 do: [ : startIndex |
			self sequence size >= (startIndex + 2)
				ifTrue: [ stream 
							nextPutAll: (self sequence copyFrom: startIndex to: startIndex + 2);
							nextPut: self delimiterTargetCharacter ] ].
		self sequence size \\ 3 ~= 0 
			ifTrue: [ stream nextPutAll: (self sequence last: self sequence size \\ 3) ] ].
	^ answer trimBoth
]

{ #category : #accessing }
BioSequenceFormatter >> sequence [
	^ sequence
]

{ #category : #accessing }
BioSequenceFormatter >> sequence: anObject [
	sequence := anObject
]

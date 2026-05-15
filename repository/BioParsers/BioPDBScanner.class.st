"
SmaCC-based scanner for PDB format files. Tokenizes PDB input for the parser.
"
Class {
	#name : 'BioPDBScanner',
	#superclass : 'SmaCCScanner',
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'instance creation' }
BioPDBScanner class >> on: aStream [
	^ self new stream: aStream; yourself
]

{ #category : 'scanning' }
BioPDBScanner >> scanToken [
	| line recordType |
	stream atEnd ifTrue: [ ^ nil ].
	line := stream nextLine.
	line ifNil: [ ^ nil ].
	recordType := line size >= 6
		ifTrue: [ (line copyFrom: 1 to: 6) trimRight asSymbol ]
		ifFalse: [ line trimRight asSymbol ].
	^ SmaCCToken value: line tag: recordType start: 0 ids: #(nil nil)
]

{ #category : 'accessing' }
BioPDBScanner >> stream: aStream [
	stream := aStream
]

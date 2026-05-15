"
SmaCC-based scanner (lexer) for GFF3 format files. Tokenizes GFF3 input for the parser.
"
Class {
	#name : 'BioGFF3Scanner',
	#superclass : 'SmaCCScanner',
	#category : 'BioParsers-GFF3',
	#package : 'BioParsers',
	#tag : 'GFF3'
}

{ #category : 'as yet unclassified' }
BioGFF3Scanner class >> on: aStream [
    ^ self new stream: aStream; yourself
]

{ #category : 'accessing' }
BioGFF3Scanner >> stream: aStream [

	stream := aStream
]

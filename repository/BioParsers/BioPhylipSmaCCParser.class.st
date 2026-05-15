"
SmaCC-based parser for PHYLIP format files. Parses PHYLIP input into structured objects.
"
Class {
	#name : 'BioPhylipSmaCCParser',
	#superclass : 'SmaCCParser',
	#category : 'BioParsers-PHYLIP',
	#package : 'BioParsers',
	#tag : 'PHYLIP'
}

{ #category : 'instance creation' }
BioPhylipSmaCCParser class >> on: aStream [
    ^ self new scanner: (BioPhylipScanner on: aStream); yourself
]

{ #category : 'accessing' }
BioPhylipSmaCCParser >> firstLineTokenizer [

	^ BioPhylipTokenizerWrapper new block: [ :input |
			  | stream numTaxa numChars |
			  stream := input readStream.
			  stream skipSeparators.
			  numTaxa := Integer readFrom: stream.
			  stream skipSeparators.
			  numChars := Integer readFrom: stream.
			  Array with: numTaxa printString with: numChars printString ]
]

{ #category : 'accessing' }
BioPhylipSmaCCParser >> parse [

	| numTaxa numChars taxaNames sequences line |
	numTaxa := self parseNumber.
	numChars := self parseNumber.
	taxaNames := OrderedCollection new.
	sequences := OrderedCollection new.

	[ scanner stream atEnd ] whileFalse: [
			line := scanner stream nextLine.
			line ifNotNil: [
					line := line trimBoth.
					line ifNotEmpty: [
							| name seq |
							name := line size <= 10
								        ifTrue: [ line ]
								        ifFalse: [ (line copyFrom: 1 to: 10) trimRight ].
							seq := line size <= 10
								       ifTrue: [ String empty ]
								       ifFalse: [
										       (line copyFrom: 11 to: line size) trimBoth reject: [
											       :c | c = Character space ] ].
							taxaNames add: name.
							seq ifNotEmpty: [ sequences add: seq ] ] ] ].

	^ Array
		  with: numTaxa
		  with: numChars
		  with: taxaNames
		  with: sequences
]

{ #category : 'parsing' }
BioPhylipSmaCCParser >> parseInterleaved [

	| numTaxa numChars taxaNames sequences line name seq padding |
	numTaxa := self parseNumber.
	numChars := self parseNumber.
	taxaNames := OrderedCollection new: numTaxa.
	sequences := OrderedCollection new: numTaxa.
	padding := String new: 10 withAll: Character space.

	"Read first block with species names"
	1 to: numTaxa do: [ :i |
			line := scanner stream nextLine trimBoth.
			name := line size <= 10
				        ifTrue: [ line , (padding copyFrom: 1 to: 10 - line size) ]
				        ifFalse: [ line copyFrom: 1 to: 10 ].
			seq := line size <= 10
				       ifTrue: [ '' ]
				       ifFalse: [ line copyFrom: 11 to: line size ].
			taxaNames add: name.
			sequences add: (seq reject: [ :c | c = Character space ]) ].

	"Read subsequent blocks"
	[ scanner stream atEnd ] whileFalse: [
			line := scanner stream nextLine.
			line ifNotNil: [
					line := line trimBoth.
					line ifNotEmpty: [
							1 to: numTaxa do: [ :i |
									scanner stream atEnd ifFalse: [
											line := scanner stream nextLine trimBoth.
											line ifNotEmpty: [
													seq := line reject: [ :c | c = Character space ].
													sequences at: i put: (sequences at: i) , seq ] ] ] ] ] ].

	^ Array
		  with: numTaxa
		  with: numChars
		  with: taxaNames
		  with: sequences
]

{ #category : 'parsing' }
BioPhylipSmaCCParser >> parseNameAndSequence: aLine into: nameBlock and: seqBlock [

	| name seq |
	aLine size <= 10
		ifTrue: [
				name := aLine trimRight.
				seq := '' ]
		ifFalse: [
				name := (aLine copyFrom: 1 to: 10) trimRight.
				seq := (aLine copyFrom: 11 to: aLine size) trimBoth.
				seq := seq copyReplaceAll: ' ' with: '' ].
	nameBlock value: name.
	seqBlock value: seq
]

{ #category : 'parsing' }
BioPhylipSmaCCParser >> parseNumber [

	| token |
	scanner stream skipSeparators.
	token := '' writeStream.
	[ scanner stream atEnd not and: [ scanner stream peek isDigit ] ]
		whileTrue: [ token nextPut: scanner stream next ].
	^ token contents asInteger
]

{ #category : 'parsing' }
BioPhylipSmaCCParser >> parseNumberFrom: stream [

	| token |
	stream skipSeparators.
	token := String new writeStream.
	[ stream atEnd not and: [ stream peek isDigit ] ] whileTrue: [
		token nextPut: stream next ].
	^ token contents asInteger
]

{ #category : 'parsing' }
BioPhylipSmaCCParser >> parseSpeciesBlocksFrom: stream [

	| results line name seq padding |
	results := OrderedCollection new.
	padding := String new: 10 withAll: Character space.
	[ stream atEnd ] whileFalse: [
			line := stream nextLine.
			line ifNotNil: [
					line := line trimBoth.
					line ifNotEmpty: [
							name := line size <= 10
								        ifTrue: [
								        line , (padding copyFrom: 1 to: 10 - line size) ]
								        ifFalse: [ line copyFrom: 1 to: 10 ].
							seq := line size <= 10
								       ifTrue: [ '' ]
								       ifFalse: [ line copyFrom: 11 to: line size ].
							results add: (Array with: name with: seq with: nil) ] ] ].
	^ results
]

{ #category : 'parsing' }
BioPhylipSmaCCParser >> parseSpeciesLineFrom: aString [

	| line name seq padding |
	line := aString.
	padding := String new: 10 withAll: Character space.
	name := line size <= 10
		        ifTrue: [ line , (padding copyFrom: 1 to: 10 - line size) ]
		        ifFalse: [ line copyFrom: 1 to: 10 ].
	seq := line size <= 10
		       ifTrue: [ '' ]
		       ifFalse: [
				       (line copyFrom: 11 to: line size) trimBoth reject: [ :c |
					       c = Character space ] ].
	^ Array with: name with: seq
]

{ #category : 'accessing-dna' }
BioPhylipSmaCCParser >> speciesDNALineTokenizer [

	^ BioPhylipTokenizerWrapper new block: [ :input |
		  self parseSpeciesLineFrom: input ]
]

{ #category : 'accessing-dna' }
BioPhylipSmaCCParser >> speciesDNANamedBlockTokenizer [

	^ BioPhylipTokenizerWrapper new block: [ :input |
		  self parseSpeciesBlocksFrom: input readStream ]
]

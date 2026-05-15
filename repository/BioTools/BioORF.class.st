"
Represents an Open Reading Frame (ORF) with start and end coordinates strand orientation and associated protein sequence. Instance Variables: start <Integer> end <Integer> strand <Symbol> protein <String>
"
Class {
	#name : 'BioORF',
	#superclass : 'BioObject',
	#instVars : [
		'start',
		'end',
		'strand',
		'protein'
	],
	#category : 'BioTools-Biological',
	#package : 'BioTools',
	#tag : 'Biological'
}

{ #category : 'as yet unclassified' }
BioORF class >> start: startInteger end: endInteger strand: strandInteger protein: proteinSequence [
	^ self new
		start: startInteger;
		end: endInteger;
		strand: strandInteger;
		protein: proteinSequence;
		yourself
]

{ #category : 'converting' }
BioORF >> asString [

	^ String streamContents: [ :s |
			  s
				  << 'ORF: ';
				  << start asString;
				  << '..';
				  << end asString.
			  s
				  << ' (';
				  << (strand = 1
						   ifTrue: [ '+' ]
						   ifFalse: [ '-' ]);
				  << ')'.
			  s
				  << ' - ';
				  << protein asString ]
]

{ #category : 'accessing' }
BioORF >> end [

	^ end
]

{ #category : 'accessing' }
BioORF >> end: anInteger [

	end := anInteger
]

{ #category : 'testing' }
BioORF >> isForwardStrand [

	^ strand = 1
]

{ #category : 'testing' }
BioORF >> isReverseStrand [

	^ strand = -1
]

{ #category : 'accessing' }
BioORF >> length [
	"Answer the length of the ORF in nucleotides"

	^ end - start + 1
]

{ #category : 'printing' }
BioORF >> printOn: aStream [

	aStream
		nextPutAll: 'ORF(';
		print: start;
		nextPutAll: '..';
		print: end;
		nextPutAll: ', strand: ';
		print: strand;
		nextPutAll: ', protein: ';
		print: self proteinLength;
		nextPut: $)
]

{ #category : 'accessing' }
BioORF >> protein [

	^ protein
]

{ #category : 'accessing' }
BioORF >> protein: aSequence [

	protein := aSequence
]

{ #category : 'accessing' }
BioORF >> proteinLength [
	"Answer the length of the protein in amino acids"

	^ protein ifNil: [ 0 ] ifNotNil: [ protein size ]
]

{ #category : 'accessing' }
BioORF >> start [

	^ start
]

{ #category : 'accessing' }
BioORF >> start: anInteger [

	start := anInteger
]

{ #category : 'accessing' }
BioORF >> strand [

	^ strand
]

{ #category : 'accessing' }
BioORF >> strand: anInteger [

	strand := anInteger
]

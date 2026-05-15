"
Represents a single FASTQ record containing an identifier, description, sequence, and quality string. Instance Variables: id <String> Record identifier. description <String> Description line. sequence <String> Nucleotide or protein sequence. quality <String> Quality scores.
"
Class {
	#name : 'BioFASTQRecord',
	#superclass : 'BioNamedObject',
	#instVars : [
		'id',
		'description',
		'sequence',
		'quality'
	],
	#category : 'BioParsers-FASTQ',
	#package : 'BioParsers',
	#tag : 'FASTQ'
}

{ #category : 'as yet unclassified' }
BioFASTQRecord class >> id: idString description: descString sequence: seqString quality: qualString [
    ^ self new
        id: idString;
        description: descString;
        sequence: seqString;
        quality: qualString;
        yourself
]

{ #category : 'accessing' }
BioFASTQRecord >> description [
    ^ description ifNil: [ '' ]
]

{ #category : 'accessing' }
BioFASTQRecord >> description: aString [
    description := aString
]

{ #category : 'accessing' }
BioFASTQRecord >> gcContent [
	"Calculate GC content as percentage"

	| gcCount total |
	total := sequence size.
	total = 0 ifTrue: [ ^ 0.0 ].
	gcCount := sequence count: [ :c |
		           c asUppercase = $G or: [ c asUppercase = $C ] ].
	^ gcCount / total asFloat * 100
]

{ #category : 'accessing' }
BioFASTQRecord >> id [
    ^ id
]

{ #category : 'accessing' }
BioFASTQRecord >> id: aString [
    id := aString
]

{ #category : 'accessing' }
BioFASTQRecord >> lowQualityPositions: threshold [
	"Return positions with quality below threshold"

	^ (1 to: quality size) select: [ :pos |
		  (quality at: pos) asciiValue - 33 < threshold ]
]

{ #category : 'accessing' }
BioFASTQRecord >> meanQuality [
	"Calculate mean quality score"

	| scores sum |
	quality ifEmpty: [ ^ 0.0 ].
	scores := self phredScores.
	sum := 0.
	scores do: [ :each | sum := sum + each ].
	^ sum / scores size asFloat
]

{ #category : 'accessing' }
BioFASTQRecord >> nContent [
	"Return number of N/ambiguous bases"

	^ sequence count: [ :c | c asUppercase = $N ]
]

{ #category : 'accessing' }
BioFASTQRecord >> phredScores [
	"Convert quality string to array of Phred scores (Sanger/Phred+33)"

	| scores |
	scores := Array new: quality size.
	1 to: quality size do: [ :i |
	scores at: i put: (quality at: i) asciiValue - 33 ].
	^ scores
]

{ #category : 'accessing' }
BioFASTQRecord >> phredScores: encodingOffset [
	"Convert quality string to array of Phred scores with specified encoding"

	^ quality collect: [ :c | c asciiValue - encodingOffset ]
]

{ #category : 'accessing' }
BioFASTQRecord >> phredScoresWithEncoding: encodingOffset [
	"Convert quality string to array of Phred scores with specified encoding offset"

	| scores |
	scores := Array new: quality size.
	1 to: quality size do: [ :i |
	scores at: i put: (quality at: i) asciiValue - encodingOffset ].
	^ scores
]

{ #category : 'printing' }
BioFASTQRecord >> printOn: aStream [
    super printOn: aStream.
    aStream nextPutAll: ' ('.
    id ifNotNil: [ aStream nextPutAll: id ].
    aStream nextPut: $)
]

{ #category : 'accessing' }
BioFASTQRecord >> quality [
    ^ quality
]

{ #category : 'accessing' }
BioFASTQRecord >> quality: aString [
    quality := aString
]

{ #category : 'accessing' }
BioFASTQRecord >> qualityAtPositions: positions [
	"Return quality scores for specified positions"

	^ positions collect: [ :pos |
			  (pos between: 1 and: quality size)
				  ifTrue: [ (quality at: pos) asciiValue - 33 ]
				  ifFalse: [ nil ] ]
]

{ #category : 'accessing' }
BioFASTQRecord >> sequence [
    ^ sequence
]

{ #category : 'accessing' }
BioFASTQRecord >> sequence: aString [
    sequence := aString
]

{ #category : 'accessing' }
BioFASTQRecord >> trimLowQuality: threshold [
	"Trim low quality bases from both ends, returns new record"

	| startPos endPos |
	startPos := 1.
	endPos := sequence size.
	[
		startPos <= endPos and: [
			(quality at: startPos) asciiValue - 33 < threshold ] ] whileTrue: [
		startPos := startPos + 1 ].
	[
		endPos >= startPos and: [
			(quality at: endPos) asciiValue - 33 < threshold ] ] whileTrue: [
		endPos := endPos - 1 ].
	^ BioFASTQRecord new
		  id: id;
		  description: description;
		  sequence: (sequence copyFrom: startPos to: endPos);
		  quality: (quality copyFrom: startPos to: endPos);
		  yourself
]

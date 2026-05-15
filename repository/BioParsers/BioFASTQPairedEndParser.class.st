"
Parser for paired-end FASTQ files containing two synchronized read files. Manages two parallel parsers and yields paired-end record pairs. Instance Variables: parser1 <BioFASTQParser> Parser for the first read file. parser2 <BioFASTQParser> Parser for the second read file. currentPair <Integer> Current pair index.
"
Class {
	#name : 'BioFASTQPairedEndParser',
	#superclass : 'Object',
	#instVars : [
		'parser1',
		'parser2',
		'currentPair'
	],
	#category : 'BioParsers-FASTQ',
	#package : 'BioParsers',
	#tag : 'FASTQ'
}

{ #category : 'instance creation' }
BioFASTQPairedEndParser class >> onFiles: fileReferences [
	"Create parser on paired FASTQ files (R1 and R2).
    Usage: BioPairedEndParser onFiles: { 'R1.fastq' asFileReference . 'R2.fastq' asFileReference }
           BioPairedEndParser onFiles: { 'R1.fastq.gz' asFileReference . 'R2.fastq.gz' asFileReference }"

	| p1 p2 |
	p1 := BioFASTQParser onFile: fileReferences first.
	p2 := BioFASTQParser onFile: fileReferences second.
	^ self new
		  parser1: p1;
		  parser2: p2;
		  yourself
]

{ #category : 'instance creation' }
BioFASTQPairedEndParser class >> onInterleaved: aStream [
	"Create parser on interleaved FASTQ file (R1 and R2 alternate).
    Usage: BioPairedEndParser onInterleaved: 'interleaved.fastq' asFileReference readStream"

	^ BioFASTQInterleavedParser on: aStream
]

{ #category : 'instance creation' }
BioFASTQPairedEndParser class >> onInterleavedFile: aFileReference [
	"Create parser on interleaved FASTQ file.
    Usage: BioPairedEndParser onInterleavedFile: 'interleaved.fastq' asFileReference"

	^ BioFASTQInterleavedParser on:
		  (BioFASTQParser onFile: aFileReference) stream
]

{ #category : 'instance creation' }
BioFASTQPairedEndParser class >> onR1: r1File r2: r2File [
	"Create parser on R1 and R2 FASTQ files.
    Usage: BioPairedEndParser onR1: 'reads_R1.fastq' asFileReference r2: 'reads_R2.fastq' asFileReference"

	| p1 p2 |
	p1 := BioFASTQParser onFile: r1File.
	p2 := BioFASTQParser onFile: r2File.
	^ self new
		  parser1: p1;
		  parser2: p2;
		  yourself
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> atEnd [
	"Check if both parsers are at end"

	^ parser1 atEnd or: [ parser2 atEnd ]
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> insertSizeRange: range [
	"Return pairs with insert size in range (e.g., 200 to 500)"

	^ self select: [ :pair |
		  pair insertSize >= range first and: [
			  pair insertSize <= range last ] ]
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> maxInsertSize: maxSize [
	"Return pairs with insert size <= maxSize"

	^ self select: [ :pair | pair insertSize <= maxSize ]
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> minInsertSize: minSize [
	"Return pairs with insert size >= minSize"

	^ self select: [ :pair | pair insertSize >= minSize ]
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> minQuality: threshold [
	"Return pairs with mean quality >= threshold"

	^ self select: [ :pair | pair meanQuality >= threshold ]
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> next [
	"Return next pair of reads as BioPairedEndRecord"

	| r1 r2 pair |
	r1 := parser1 next.
	r2 := parser2 next.
	(r1 isNil or: [ r2 isNil ]) ifTrue: [ ^ nil ].
	pair := BioFASTQPairedEndRecord new
		        read1: r1;
		        read2: r2;
		        yourself.
	currentPair := pair.
	^ pair
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> nextValidate [
	"Return next pair, validating that IDs match"

	| pair |
	pair := self next.
	pair ifNil: [ ^ nil ].
	pair isValidPair ifFalse: [
			self error:
				'Read pair mismatch: ' , pair read1 id , ' vs ' , pair read2 id ].
	^ pair
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> parser1 [
    ^ parser1
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> parser1: aParser [
    parser1 := aParser
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> parser2 [
    ^ parser2
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> parser2: aParser [
    parser2 := aParser
]

{ #category : 'enumerating' }
BioFASTQPairedEndParser >> select: aBlock [
	"Filter paired reads matching condition"

	| results |
	results := OrderedCollection new.
	[ self atEnd ] whileFalse: [
			| pair |
			pair := self next.
			(pair notNil and: [ aBlock value: pair ]) ifTrue: [
				results add: pair ] ].
	^ results
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> statistics [
	"Collect statistics across all pairs"

	| totalPairs validPairs totalBases totalInsertSize minInsert maxInsert meanQualSum |
	totalPairs := validPairs := totalBases := totalInsertSize := 0.
	minInsert := SmallInteger maxVal.
	maxInsert := 0.
	meanQualSum := 0.0.
	[ self atEnd ] whileFalse: [
			| pair |
			pair := self next.
			pair ifNotNil: [
					totalPairs := totalPairs + 1.
					totalBases := totalBases + pair totalBases.
					totalInsertSize := totalInsertSize + pair insertSize.
					meanQualSum := meanQualSum + pair meanQuality.
					minInsert := minInsert min: pair insertSize.
					maxInsert := maxInsert max: pair insertSize.
					pair isValidPair ifTrue: [ validPairs := validPairs + 1 ] ] ].
	^ Dictionary new
		  at: #totalPairs put: totalPairs;
		  at: #validPairs put: validPairs;
		  at: #totalBases put: totalBases;
		  at: #averageInsertSize put: (totalPairs > 0
				   ifTrue: [ totalInsertSize / totalPairs asFloat ]
				   ifFalse: [ 0 ]);
		  at: #minInsertSize put: minInsert;
		  at: #maxInsertSize put: maxInsert;
		  at: #meanQuality put: (totalPairs > 0
				   ifTrue: [ meanQualSum / totalPairs ]
				   ifFalse: [ 0 ]);
		  yourself
]

{ #category : 'accessing' }
BioFASTQPairedEndParser >> validPairs [
	"Return only valid pairs (matching IDs)"

	^ self select: [ :pair | pair isValidPair ]
]

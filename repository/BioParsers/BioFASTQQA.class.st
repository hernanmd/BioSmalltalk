Class {
	#name : 'BioFASTQQA',
	#superclass : 'Object',
	#instVars : [
		'totalRecords',
		'totalBases',
		'perBaseQuality',
		'gcDistribution',
		'qualityDistribution',
		'sequenceLengths',
		'overrepresentedSequences',
		'meanQualityRecord'
	],
	#category : 'BioParsers-FASTQ',
	#package : 'BioParsers',
	#tag : 'FASTQ'
}

{ #category : 'as yet unclassified' }
BioFASTQQA class >> analyze: aParser [

	| qa |
	qa := self new.
	qa initializeCounters.
	[ aParser atEnd ] whileFalse: [
			| record |
			record := aParser next.
			record ifNotNil: [ qa analyzeRecord: record ] ].
	qa calculateAggregates.
	^ qa
]

{ #category : 'as yet unclassified' }
BioFASTQQA class >> analyzeFile: aFileRef [

	^ self analyze: (BioFASTQParser onFile: aFileRef)
]

{ #category : 'accessing' }
BioFASTQQA >> analyzeRecord: aRecord [

	| seqLen meanQual gcCount |
	totalRecords := totalRecords + 1.
	seqLen := aRecord sequence size.
	totalBases := totalBases + seqLen.
	sequenceLengths add: seqLen.
	meanQual := aRecord meanQuality.
	meanQualityRecord add: meanQual.
	qualityDistribution
		at: (meanQual roundTo: 1)
		ifPresent: [ :c |
		qualityDistribution at: (meanQual roundTo: 1) put: c + 1 ]
		ifAbsent: [ qualityDistribution at: (meanQual roundTo: 1) put: 1 ].
	gcCount := aRecord gcContent.
	gcDistribution
		at: (gcCount roundTo: 5)
		ifPresent: [ :c |
		gcDistribution at: (gcCount roundTo: 5) put: c + 1 ]
		ifAbsent: [ gcDistribution at: (gcCount roundTo: 5) put: 1 ].
	1 to: seqLen do: [ :pos |
			| q |
			q := (aRecord quality at: pos) asciiValue - 33.
			perBaseQuality
				at: pos
				ifPresent: [ :sum | perBaseQuality at: pos put: sum + q ]
				ifAbsent: [ perBaseQuality at: pos put: q ] ].
	seqLen < 75 ifTrue: [
			overrepresentedSequences
				at: aRecord sequence
				ifPresent: [ :c |
				overrepresentedSequences at: aRecord sequence put: c + 1 ]
				ifAbsent: [ overrepresentedSequences at: aRecord sequence put: 1 ] ]
]

{ #category : 'accessing' }
BioFASTQQA >> averageQuality [

	| sum |
	sum := 0.
	meanQualityRecord do: [ :q | sum := sum + q ].
	^ sum / totalRecords asFloat
]

{ #category : 'accessing' }
BioFASTQQA >> averageSequenceLength [

	totalRecords = 0 ifTrue: [ ^ 0 ].
	^ totalBases asFloat / totalRecords
]

{ #category : 'accessing' }
BioFASTQQA >> calculateAggregates [

	perBaseQuality keysDo: [ :pos |
			perBaseQuality
				at: pos
				put: (perBaseQuality at: pos) asFloat / totalRecords ]
]

{ #category : 'accessing' }
BioFASTQQA >> gcDistribution [
    ^ gcDistribution
]

{ #category : 'accessing' }
BioFASTQQA >> gcPercentage [

	^ (gcDistribution associations
		   inject: 0
		   into: [ :sum :assoc | sum + (assoc key * assoc value) ]) / totalBases
]

{ #category : 'initialization' }
BioFASTQQA >> initializeCounters [

	totalRecords := 0.
	totalBases := 0.
	perBaseQuality := Dictionary new.
	gcDistribution := Dictionary new.
	qualityDistribution := Dictionary new.
	sequenceLengths := Bag new.
	overrepresentedSequences := Dictionary new.
	meanQualityRecord := OrderedCollection new
]

{ #category : 'accessing' }
BioFASTQQA >> overrepresentedSequences [
    ^ overrepresentedSequences
]

{ #category : 'accessing' }
BioFASTQQA >> overrepresentedThreshold: percentage [

	| threshold |
	threshold := totalRecords * percentage / 100.
	^ overrepresentedSequences associations select: [ :assoc | assoc value >= threshold ]
]

{ #category : 'accessing' }
BioFASTQQA >> perBaseQuality [
    ^ perBaseQuality
]

{ #category : 'accessing' }
BioFASTQQA >> qualityDistribution [
    ^ qualityDistribution
]

{ #category : 'accessing' }
BioFASTQQA >> sequenceLengths [
    ^ sequenceLengths
]

{ #category : 'printing' }
BioFASTQQA >> summary [

	^ String streamContents: [ :s |
			  s
				  << 'FASTQ QA Report';
				  cr.
			  s
				  << '==================';
				  cr.
			  s
				  << 'Total records: ';
				  << totalRecords asString;
				  cr.
			  s
				  << 'Total bases: ';
				  << totalBases asString;
				  cr.
			  s
				  << 'Avg length: ';
				  << (self averageSequenceLength roundTo: 0.1) asString;
				  cr.
			  s
				  << 'Avg quality: ';
				  << (self averageQuality roundTo: 0.1) asString;
				  cr.
			  s
				  << 'GC content: ';
				  << (self gcPercentage roundTo: 0.1) asString;
				  << '%';
				  cr.
			  s
				  << 'Length range: ';
				  << sequenceLengths min asString;
				  << ' - ';
				  << sequenceLengths max asString;
				  cr ]
]

{ #category : 'accessing' }
BioFASTQQA >> totalBases [
    ^ totalBases
]

{ #category : 'accessing' }
BioFASTQQA >> totalRecords [
    ^ totalRecords
]

"
Random sampler for FASTQ files. Selects a random subset of records from a FASTQ file for quality control analysis. Instance Variables: parser <BioFASTQParser> The FASTQ parser. sampleSize <Integer> Number of records to sample. randomSeed <Integer> Seed for random number generation.
"
Class {
	#name : 'BioFASTQSampler',
	#superclass : 'Object',
	#instVars : [
		'parser',
		'sampleSize',
		'randomSeed'
	],
	#category : 'BioParsers-FASTQ',
	#package : 'BioParsers',
	#tag : 'FASTQ'
}

{ #category : 'as yet unclassified' }
BioFASTQSampler class >> on: aParser sampleSize: anInteger [
    ^ self new parser: aParser; sampleSize: anInteger; yourself
]

{ #category : 'as yet unclassified' }
BioFASTQSampler class >> onFile: aFileRef sampleSize: n [
    ^ self on: (BioFASTQParser onFile: aFileRef) sampleSize: n
]

{ #category : 'as yet unclassified' }
BioFASTQSampler >> nextSample [

	| reservoir count |
	reservoir := OrderedCollection new: sampleSize.
	count := 0.
	[ parser atEnd ] whileFalse: [
			| record |
			record := parser next.
			record ifNotNil: [
					count := count + 1.
					count <= sampleSize
						ifTrue: [ reservoir add: record ]
						ifFalse: [
								| j |
								j := (1 to: count) atRandom.
								j <= sampleSize ifTrue: [ reservoir at: j put: record ] ] ] ].
	^ reservoir
]

{ #category : 'as yet unclassified' }
BioFASTQSampler >> parser [
    ^ parser
]

{ #category : 'as yet unclassified' }
BioFASTQSampler >> parser: p [
    parser := p
]

{ #category : 'as yet unclassified' }
BioFASTQSampler >> sampleSize [
    ^ sampleSize
]

{ #category : 'as yet unclassified' }
BioFASTQSampler >> sampleSize: n [
    sampleSize := n
]

Class {
	#name : 'BioFASTQInterleavedParser',
	#superclass : 'Object',
	#instVars : [
		'stream'
	],
	#category : 'BioParsers-FASTQ',
	#package : 'BioParsers',
	#tag : 'FASTQ'
}

{ #category : 'instance creation' }
BioFASTQInterleavedParser class >> on: aStream [

	^ self new
		  stream: aStream;
		  yourself
]

{ #category : 'accessing' }
BioFASTQInterleavedParser >> atEnd [

	^ stream atEnd
]

{ #category : 'accessing' }
BioFASTQInterleavedParser >> next [
	"Read two consecutive records as a pair"

	| r1 r2 parser |
	parser := BioFASTQParser on: stream.
	r1 := parser next.
	r2 := parser next.
	(r1 isNil or: [ r2 isNil ]) ifTrue: [ ^ nil ].
	^ BioFASTQPairedEndRecord new
		  read1: r1;
		  read2: r2;
		  yourself
]

{ #category : 'accessing' }
BioFASTQInterleavedParser >> stream [
    ^ stream
]

{ #category : 'accessing' }
BioFASTQInterleavedParser >> stream: aStream [
    stream := aStream
]

Class {
	#name : 'BioFASTQParser',
	#superclass : 'BioAbstractParser',
	#instVars : [
		'stream'
	],
	#category : 'BioParsers-FASTQ',
	#package : 'BioParsers',
	#tag : 'FASTQ'
}

{ #category : 'as yet unclassified' }
BioFASTQParser class >> on: aReadStream [
    ^ self new stream: aReadStream; yourself
]

{ #category : 'as yet unclassified' }
BioFASTQParser class >> onFile: aFileReference [
	"Create a parser on a FASTQ file, automatically detecting .gz extension.
    Usage: 
        BioFASTQParser onFile: 'reads.fastq' asFileReference
        BioFASTQParser onFile: 'reads.fastq.gz' asFileReference"

	(aFileReference basename endsWithCaseInsensitive: '.gz')
		ifTrue: [ ^ self onGZipFile: aFileReference ]
		ifFalse: [ ^ self on: aFileReference readStream ]
]

{ #category : 'as yet unclassified' }
BioFASTQParser class >> onGZipBytes: aByteArray [
	"Create a parser on gzipped FASTQ data in a ByteArray.
    Usage: BioFASTQParser onGZipBytes: compressedData"

	| decompressedBytes |
	decompressedBytes := aByteArray unzipped.
	^ self on: (ReadStream on: decompressedBytes asString)
]

{ #category : 'as yet unclassified' }
BioFASTQParser class >> onGZipFile: aFileReference [
	"Create a parser on a gzipped FASTQ file.
    Usage: BioFASTQParser onGZipFile: 'reads.fastq.gz' asFileReference"

	| compressedBytes decompressedBytes |
	compressedBytes := aFileReference binaryReadStream upToEnd.
	decompressedBytes := compressedBytes unzipped.
	^ self on: (ReadStream on: decompressedBytes asString)
]

{ #category : 'as yet unclassified' }
BioFASTQParser class >> onGZipStream: aBinaryReadStream [
	"Create a parser on a gzipped binary stream.
    Usage: BioFASTQParser onGZipStream: 'reads.fastq.gz' asFileReference binaryReadStream"

	| gzStream content |
	gzStream := GZipReadStream on: aBinaryReadStream.
	content := gzStream upToEnd asString.
	^ self on: (ReadStream on: content)
]

{ #category : 'accessing' }
BioFASTQParser >> atEnd [
    ^ stream atEnd
]

{ #category : 'accessing' }
BioFASTQParser >> gcContentRange: range [
	"Return records with GC content in range (e.g., 30.0 to 70.0)"

	^ self select: [ :record |
			  | gc |
			  gc := record gcContent.
			  gc between: range first and: range last ]
]

{ #category : 'testing' }
BioFASTQParser >> isIlluminaHeader: aHeader [
    "Casava 1.8 format has pattern like ' 1:N:0:' or ' 2:Y:18:'"
    ^ (aHeader includesSubstring: ' 1:') or: [ aHeader includesSubstring: ' 2:' ]
]

{ #category : 'accessing' }
BioFASTQParser >> maxLength: maxLen [
	"Return records with sequence length <= maxLen"

	^ self select: [ :record | record sequence size <= maxLen ]
]

{ #category : 'accessing' }
BioFASTQParser >> maxNCount: maxN [
	"Return records with N count <= maxN"

	^ self select: [ :record | record nContent <= maxN ]
]

{ #category : 'accessing' }
BioFASTQParser >> minLength: minLen [
	"Return records with sequence length >= minLen"

	^ self select: [ :record | record sequence size >= minLen ]
]

{ #category : 'accessing' }
BioFASTQParser >> minQuality: threshold [
	"Return records with mean quality >= threshold"

	^ self select: [ :record | record meanQuality >= threshold ]
]

{ #category : 'accessing' }
BioFASTQParser >> next [

	| headerLine id desc seqLine qualLine header |
	self skipEmptyLines.
	stream atEnd ifTrue: [ ^ nil ].
	headerLine := stream nextLine.
	headerLine ifEmpty: [ ^ nil ].
	headerLine first = $@ ifFalse: [ ^ nil ].
	header := headerLine allButFirst.
	(self isIlluminaHeader: header)
		ifTrue: [
				id := header.
				desc := '' ]
		ifFalse: [
				(header includes: Character space)
					ifTrue: [
							| spacePos |
							spacePos := header indexOf: Character space.
							id := header copyFrom: 1 to: spacePos - 1.
							desc := header copyFrom: spacePos + 1 to: header size ]
					ifFalse: [
							id := header.
							desc := '' ] ].
	seqLine := self readSequenceLines.
	stream peek = $+ ifTrue: [ stream nextLine ].
	qualLine := self readQualityLines: seqLine size.
	^ BioFASTQRecord
		  id: id
		  description: desc
		  sequence: seqLine
		  quality: qualLine
]

{ #category : 'accessing' }
BioFASTQParser >> readQualityLines: expectedSize [

	| qual |
	qual := stream nextLine.
	"For multi-line quality: continue while less than expectedSize"
	[
		qual size < expectedSize and: [
			stream atEnd not and: [ stream peek ~= $@ ] ] ] whileTrue: [
		qual := qual , stream nextLine ].
	^ qual ifNil: [ '' ]
]

{ #category : 'accessing' }
BioFASTQParser >> readSequenceLines [
| seq |
    seq := stream nextLine.
    [ stream atEnd not and: [ stream peek isNil not and: [ stream peek isLetter or: [ stream peek = $- ] ] ] ]
        whileTrue: [ seq := seq , stream nextLine ].
    ^ seq
]

{ #category : 'enumerating' }
BioFASTQParser >> reject: aBlock [
	"Return all records NOT matching the block condition"

	^ self reject: [ :record | aBlock value: record ]
]

{ #category : 'enumerating' }
BioFASTQParser >> select: aBlock [
	"Return all records matching the block condition"

	results := OrderedCollection new.
	[ self atEnd ] whileFalse: [
			| record |
			record := self next.
			(aBlock value: record) ifTrue: [ results add: record ] ].
	^ results
]

{ #category : 'accessing' }
BioFASTQParser >> skipEmptyLines [

	[ stream atEnd not and: [ stream peek isSeparator ] ] whileTrue: [
		stream next ]
]

{ #category : 'accessing' }
BioFASTQParser >> statistics [
	"Collect basic statistics across all records"

	| totalBases totalRecords totalQuality gcCount nCount minLen maxLen meanQualSum |
	totalBases := totalRecords := totalQuality := gcCount := nCount := 0.
	minLen := SmallInteger maxVal.
	maxLen := 0.
	meanQualSum := 0.0.
	[ self atEnd ] whileFalse: [
			| record |
			record := self next.
			record ifNotNil: [
					totalRecords := totalRecords + 1.
					totalBases := totalBases + record sequence size.
					meanQualSum := meanQualSum + record meanQuality.
					gcCount := gcCount
					           +
					           (record sequence count: [ :c |
						            #( $G $C ) includes: c asUppercase ]).
					nCount := nCount + record nContent.
					minLen := minLen min: record sequence size.
					maxLen := maxLen max: record sequence size ] ].
	^ Dictionary new
		  at: #totalRecords put: totalRecords;
		  at: #totalBases put: totalBases;
		  at: #averageLength put: (totalRecords > 0
				   ifTrue: [ totalBases / totalRecords asFloat ]
				   ifFalse: [ 0 ]);
		  at: #minLength put: minLen;
		  at: #maxLength put: maxLen;
		  at: #meanQuality put: (totalRecords > 0
				   ifTrue: [ meanQualSum / totalRecords ]
				   ifFalse: [ 0 ]);
		  at: #gcContent put: (totalBases > 0
				   ifTrue: [ gcCount / totalBases asFloat * 100 ]
				   ifFalse: [ 0 ]);
		  at: #nCount put: nCount;
		  yourself
]

{ #category : 'accessing' }
BioFASTQParser >> stream [
    ^ stream
]

{ #category : 'accessing' }
BioFASTQParser >> stream: aStream [
    stream := aStream
]

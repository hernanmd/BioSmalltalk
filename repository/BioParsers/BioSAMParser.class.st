"
Parser for SAM (Sequence Alignment/Map) format files. Extends BioAbstractParser with stream-based record access. Instance Variables: stream <ReadStream> The input stream.
"
Class {
	#name : 'BioSAMParser',
	#superclass : 'BioAbstractParser',
	#instVars : [
		'stream'
	],
	#category : 'BioParsers-SAM',
	#package : 'BioParsers',
	#tag : 'SAM'
}

{ #category : 'as yet unclassified' }
BioSAMParser class >> on: aReadStream [
    ^ self new stream: aReadStream; yourself
]

{ #category : 'accessing' }
BioSAMParser >> atEnd [
    ^ stream atEnd
]

{ #category : 'accessing' }
BioSAMParser >> next [

	| line fields record qname flag rname pos mapq cigar rnext pnext tlen seq qual tags |
	stream atEnd ifTrue: [ ^ nil ].
	line := stream nextLine.
	line ifEmpty: [ ^ nil ].
	(line beginsWith: '@') ifTrue: [ ^ self next ].
	fields := line splitOn: Character tab.
	qname := fields at: 1.
	flag := (fields at: 2) asInteger.
	rname := fields at: 3.
	pos := (fields at: 4) asInteger.
	mapq := (fields at: 5) asInteger.
	cigar := fields at: 6.
	rnext := fields at: 7.
	pnext := (fields at: 8) asInteger.
	tlen := (fields at: 9) asInteger.
	seq := fields at: 10.
	qual := fields at: 11.
	tags := Dictionary new.
	12 to: fields size do: [ :i |
			| tagField tag tagType value |
			tagField := fields at: i.
			(tagField includes: $:) ifTrue: [
					tag := tagField copyFrom: 1 to: 2.
					tagType := tagField copyFrom: 4 to: tagField size.
					tags at: tag put: tagType ] ].
	^ BioSAMRecord new
		  qname: qname;
		  flag: flag;
		  rname: rname;
		  pos: pos;
		  mapq: mapq;
		  cigar: cigar;
		  rnext: rnext;
		  pnext: pnext;
		  tlen: tlen;
		  seq: seq;
		  qual: qual;
		  tags: tags;
		  yourself
]

{ #category : 'accessing' }
BioSAMParser >> stream [
    ^ stream
]

{ #category : 'accessing' }
BioSAMParser >> stream: aStream [
    stream := aStream
]

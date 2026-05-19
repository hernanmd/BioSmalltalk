"
Represents a single SAM (Sequence Alignment/Map) record with standard fields. Instance Variables: qname flag rname pos mapq cigar rnext pnext tlen seq qual tags
"
Class {
	#name : 'BioSAMRecord',
	#superclass : 'BioNamedObject',
	#instVars : [
		'qname',
		'flag',
		'rname',
		'pos',
		'mapq',
		'cigar',
		'rnext',
		'pnext',
		'tlen',
		'seq',
		'qual',
		'tags'
	],
	#category : 'BioParsers-SAM',
	#package : 'BioParsers',
	#tag : 'SAM'
}

{ #category : 'accessing' }
BioSAMRecord >> cigar [
    ^ cigar
]

{ #category : 'accessing' }
BioSAMRecord >> cigar: aValue [
    cigar := aValue
]

{ #category : 'accessing' }
BioSAMRecord >> flag [
    ^ flag
]

{ #category : 'flagging' }
BioSAMRecord >> flag: aValue [
    flag := aValue
]

{ #category : 'testing' }
BioSAMRecord >> isProperPair [
    ^ (flag bitAnd: 2) = 2
]

{ #category : 'testing' }
BioSAMRecord >> isReverseComplement [
    ^ (flag bitAnd: 16) = 16
]

{ #category : 'testing' }
BioSAMRecord >> isSecondary [
    ^ (flag bitAnd: 256) = 256
]

{ #category : 'testing' }
BioSAMRecord >> isSupplementary [
    ^ (flag bitAnd: 2048) = 2048
]

{ #category : 'accessing' }
BioSAMRecord >> mapq [
    ^ mapq
]

{ #category : 'accessing' }
BioSAMRecord >> mapq: aValue [
    mapq := aValue
]

{ #category : 'accessing' }
BioSAMRecord >> pnext [
    ^ pnext
]

{ #category : 'accessing' }
BioSAMRecord >> pnext: aValue [
    pnext := aValue
]

{ #category : 'accessing' }
BioSAMRecord >> pos [
    ^ pos
]

{ #category : 'accessing' }
BioSAMRecord >> pos: aValue [
    pos := aValue
]

{ #category : 'accessing' }
BioSAMRecord >> qname [
    ^ qname
]

{ #category : 'accessing' }
BioSAMRecord >> qname: aValue [
    qname := aValue
]

{ #category : 'accessing' }
BioSAMRecord >> qual [
    ^ qual
]

{ #category : 'accessing' }
BioSAMRecord >> qual: aValue [
    qual := aValue
]

{ #category : 'accessing' }
BioSAMRecord >> rlen [
    ^ seq size
]

{ #category : 'accessing' }
BioSAMRecord >> rname [
    ^ rname
]

{ #category : 'accessing' }
BioSAMRecord >> rname: aValue [
    rname := aValue
]

{ #category : 'accessing' }
BioSAMRecord >> rnext [
    ^ rnext
]

{ #category : 'accessing' }
BioSAMRecord >> rnext: aValue [
    rnext := aValue
]

{ #category : 'accessing' }
BioSAMRecord >> seq [
    ^ seq
]

{ #category : 'accessing' }
BioSAMRecord >> seq: aValue [
    seq := aValue
]

{ #category : 'accessing' }
BioSAMRecord >> tagAt: tagName [
    ^ tags at: tagName ifAbsent: [ nil ]
]

{ #category : 'accessing' }
BioSAMRecord >> tags [
    ^ tags
]

{ #category : 'accessing' }
BioSAMRecord >> tags: aValue [
    tags := aValue
]

{ #category : 'accessing' }
BioSAMRecord >> tlen [
    ^ tlen
]

{ #category : 'accessing' }
BioSAMRecord >> tlen: aValue [
    tlen := aValue
]

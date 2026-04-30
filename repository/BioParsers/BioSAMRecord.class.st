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

{ #category : 'as yet unclassified' }
BioSAMRecord >> cigar [
    ^ cigar
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> cigar: aValue [
    cigar := aValue
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> flag [
    ^ flag
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> flag: aValue [
    flag := aValue
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> isProperPair [
    ^ (flag bitAnd: 2) = 2
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> isReverseComplement [
    ^ (flag bitAnd: 16) = 16
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> isSecondary [
    ^ (flag bitAnd: 256) = 256
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> isSupplementary [
    ^ (flag bitAnd: 2048) = 2048
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> mapq [
    ^ mapq
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> mapq: aValue [
    mapq := aValue
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> pnext [
    ^ pnext
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> pnext: aValue [
    pnext := aValue
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> pos [
    ^ pos
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> pos: aValue [
    pos := aValue
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> qname [
    ^ qname
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> qname: aValue [
    qname := aValue
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> qual [
    ^ qual
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> qual: aValue [
    qual := aValue
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> rlen [
    ^ seq size
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> rname [
    ^ rname
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> rname: aValue [
    rname := aValue
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> rnext [
    ^ rnext
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> rnext: aValue [
    rnext := aValue
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> seq [
    ^ seq
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> seq: aValue [
    seq := aValue
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> tagAt: tagName [
    ^ tags at: tagName ifAbsent: [ nil ]
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> tags [
    ^ tags
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> tags: aValue [
    tags := aValue
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> tlen [
    ^ tlen
]

{ #category : 'as yet unclassified' }
BioSAMRecord >> tlen: aValue [
    tlen := aValue
]

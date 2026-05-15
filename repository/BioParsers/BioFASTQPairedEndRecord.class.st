"
Represents a paired-end FASTQ record containing two synchronized reads. Instance Variables: read1 <BioFASTQRecord> First read in the pair. read2 <BioFASTQRecord> Second read in the pair.
"
Class {
	#name : 'BioFASTQPairedEndRecord',
	#superclass : 'Object',
	#instVars : [
		'read1',
		'read2'
	],
	#category : 'BioParsers-FASTQ',
	#package : 'BioParsers',
	#tag : 'FASTQ'
}

{ #category : 'accessing' }
BioFASTQPairedEndRecord >> id [
    "Return the common ID for the pair"
    ^ read1 ifNotNil: [ read1 id ] ifNil: [ read2 ifNotNil: [ read2 id ] ]
]

{ #category : 'accessing' }
BioFASTQPairedEndRecord >> insertSize [
    "Return insert size (distance between read pairs)"
    ^ read1 sequence size + read2 sequence size
]

{ #category : 'testing' }
BioFASTQPairedEndRecord >> isValidPair [
    "Check if this is a valid pair (matching IDs)"
    ^ read1 notNil and: [ read2 notNil and: [ self sameReadId ] ]
]

{ #category : 'accessing' }
BioFASTQPairedEndRecord >> meanQuality [
    "Return mean quality across both reads"
    | q1 q2 n1 n2 |
    read1 ifNil: [ ^ read2 ifNotNil: [ read2 meanQuality ] ifNil: [ 0 ] ].
    read2 ifNil: [ ^ read1 meanQuality ].
    q1 := read1 meanQuality.
    q2 := read2 meanQuality.
    n1 := read1 sequence size.
    n2 := read2 sequence size.
    ^ ((q1 * n1) + (q2 * n2)) / (n1 + n2) asFloat
]

{ #category : 'accessing' }
BioFASTQPairedEndRecord >> normalizeId: anId [
    "Normalize read ID by removing /1 /2 suffixes"
    | id |
    id := anId copyReplaceAll: '/1' with: ''.
    id := id copyReplaceAll: '/2' with: ''.
    id := id copyReplaceAll: ' 1:' with: ' '.
    id := id copyReplaceAll: ' 2:' with: ' '.
    ^ id trimRight
]

{ #category : 'printing' }
BioFASTQPairedEndRecord >> printOn: aStream [
    super printOn: aStream.
    aStream nextPut: $[.
    read1 ifNotNil: [ aStream << read1 id ].
    aStream nextPutAll: ' <-> '.
    read2 ifNotNil: [ aStream << read2 id ].
    aStream nextPut: $]
]

{ #category : 'accessing' }
BioFASTQPairedEndRecord >> read1 [
    ^ read1
]

{ #category : 'accessing' }
BioFASTQPairedEndRecord >> read1: aRecord [
    read1 := aRecord
]

{ #category : 'accessing' }
BioFASTQPairedEndRecord >> read2 [
    ^ read2
]

{ #category : 'accessing' }
BioFASTQPairedEndRecord >> read2: aRecord [
    read2 := aRecord
]

{ #category : 'accessing' }
BioFASTQPairedEndRecord >> sameReadId [
    "Check if both reads have matching IDs (ignoring /1 /2 suffixes)"
    | id1 id2 |
    id1 := self normalizeId: read1 id.
    id2 := self normalizeId: read2 id.
    ^ id1 = id2
]

{ #category : 'accessing' }
BioFASTQPairedEndRecord >> totalBases [
    "Return total bases in both reads"
    ^ self insertSize
]

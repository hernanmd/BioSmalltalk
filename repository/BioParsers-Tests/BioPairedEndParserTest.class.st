Class {
	#name : 'BioPairedEndParserTest',
	#superclass : 'BioAbstractParserTest',
	#category : 'BioParsers-Tests',
	#package : 'BioParsers-Tests'
}

{ #category : 'as yet unclassified' }
BioPairedEndParserTest >> testIlluminaStyleIds [

	| r1 r2 pair |
	r1 := BioFASTQRecord new
		      id: 'ERR123.1 FC1:1:1:1:1 1:N:0:ATCACG';
		      sequence: 'A';
		      quality: 'I'.
	r2 := BioFASTQRecord new
		      id: 'ERR123.1 FC1:1:1:1:1 2:N:0:ATCACG';
		      sequence: 'T';
		      quality: 'I'.
	pair := BioFASTQPairedEndRecord new
		        read1: r1;
		        read2: r2.
	self assert: pair isValidPair
]

{ #category : 'as yet unclassified' }
BioPairedEndParserTest >> testInterleavedParsing [

	| interleaved parser pair |
	interleaved := '@read1/1
AC
+
II
@read1/2
TG
+
HH
@read2/1
GC
+
II
@read2/2
AT
+
HH'.
	parser := BioFASTQInterleavedParser on: interleaved readStream.
	pair := parser next.
	self assert: pair read1 id equals: 'read1/1'.
	self assert: pair read2 id equals: 'read1/2'.
	self assert: pair isValidPair
]

{ #category : 'as yet unclassified' }
BioPairedEndParserTest >> testPairedEndIdMatching [

	| r1 r2 pair |
	r1 := BioFASTQRecord new
		      id: 'read/1';
		      sequence: 'A';
		      quality: 'I'.
	r2 := BioFASTQRecord new
		      id: 'read/2';
		      sequence: 'T';
		      quality: 'I'.
	pair := BioFASTQPairedEndRecord new
		        read1: r1;
		        read2: r2.
	self assert: pair isValidPair
]

{ #category : 'as yet unclassified' }
BioPairedEndParserTest >> testPairedEndIdMismatch [

	| r1 r2 pair |
	r1 := BioFASTQRecord new
		      id: 'read1/1';
		      sequence: 'A';
		      quality: 'I'.
	r2 := BioFASTQRecord new
		      id: 'read2/2';
		      sequence: 'T';
		      quality: 'I'.
	pair := BioFASTQPairedEndRecord new
		        read1: r1;
		        read2: r2.
	self deny: pair isValidPair
]

{ #category : 'as yet unclassified' }
BioPairedEndParserTest >> testPairedEndMultiplePairs [

	| r1Data r2Data parser pairs |
	r1Data := '@p1/1
A
+
I
@p2/1
C
+
I
@p3/1
G
+
I'.
	r2Data := '@p1/2
T
+
I
@p2/2
G
+
I
@p3/2
A
+
I'.
	parser := BioFASTQPairedEndParser new
		          parser1: (BioFASTQParser on: r1Data readStream);
		          parser2: (BioFASTQParser on: r2Data readStream).
	pairs := OrderedCollection new.
	[ parser atEnd ] whileFalse: [ pairs add: parser next ].
	self assert: pairs size equals: 3
]

{ #category : 'as yet unclassified' }
BioPairedEndParserTest >> testPairedEndParseFromStreams [

	| r1Data r2Data parser pair |
	r1Data := '@seq1/1
AAAA
+
IIII
@seq2/1
CCCC
+
HHHH'.
	r2Data := '@seq1/2
TTTT
+
JJJJ
@seq2/2
GGGG
+
IIII'.
	parser := BioFASTQPairedEndParser new
		          parser1: (BioFASTQParser on: r1Data readStream);
		          parser2: (BioFASTQParser on: r2Data readStream).
	pair := parser next.
	self assert: pair read1 id equals: 'seq1/1'.
	self assert: pair read2 id equals: 'seq1/2'.
	self assert: pair isValidPair
]

{ #category : 'as yet unclassified' }
BioPairedEndParserTest >> testPairedEndRecordCreation [

	| r1 r2 pair |
	r1 := BioFASTQRecord new
		      id: 'test/1';
		      sequence: 'AAAA';
		      quality: 'IIII'.
	r2 := BioFASTQRecord new
		      id: 'test/2';
		      sequence: 'TTTT';
		      quality: 'HHHH'.
	pair := BioFASTQPairedEndRecord new
		        read1: r1;
		        read2: r2.
	self assert: pair id equals: 'test/1'.
	self assert: pair insertSize equals: 8.
	self assert: pair isValidPair
]

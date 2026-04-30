Class {
	#name : 'BioFASTQParserTest',
	#superclass : 'BioAbstractParserTest',
	#category : 'BioParsers-Tests',
	#package : 'BioParsers-Tests'
}

{ #category : 'as yet unclassified' }
BioFASTQParserTest >> testGZippedQualityCalculation [

	| fastq compressed record |
	fastq := '@qual_test
ACGTACGT
+
IIHHGGFF'.
	compressed := fastq asByteArray zipped.
	parser := BioFASTQParser onGZipBytes: compressed.
	record := parser next.
	self assert: record meanQuality >= 35.
	self assert: record meanQuality <= 42
]

{ #category : 'as yet unclassified' }
BioFASTQParserTest >> testGZippedTrimming [

	| fastq compressed record trimmed |
	fastq := '@trim_test
ACGTACGT
+
!!IIII!!'.
	compressed := fastq asByteArray zipped.
	parser := BioFASTQParser onGZipBytes: compressed.
	record := parser next.
	trimmed := record trimLowQuality: 20.
	self assert: trimmed sequence size < record sequence size
]

{ #category : 'as yet unclassified' }
BioFASTQParserTest >> testOnFileGZipped [

	| fastq gzippedFile record |
	fastq := '@from_file
GCGCGCGC
+
HHHHHHHH'.
	gzippedFile := FileLocator temp / 'test_gzip.fastq.gz'.
	gzippedFile binaryWriteStreamDo: [ :out |
		out nextPutAll: fastq asByteArray zipped ].
	parser := BioFASTQParser onFile: gzippedFile.
	record := parser next.
	self assert: record id equals: 'from_file'.
	self assert: record gcContent equals: 100.0.
	gzippedFile delete
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseChimericAlignmentWithSA_tag [

	| samLine record seqStr |
	seqStr := String new: 50 withAll: $G.
	samLine := ('chimera	0	chr1	100	60	25M1000N25M	*	0	0	' , seqStr
	            , '	*	SA:Z:chr2,1000,+,25M,60;') readStream.
	parser := BioSAMParser on: samLine.
	record := parser next.
	self assert: record cigar equals: '25M1000N25M'.
	self assert: (record tagAt: 'SA') equals: 'Z:chr2,1000,+,25M,60;'.
	self assert: record seq size equals: 50
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseComplexTagsWithMultipleValues [

	| samLine record |
	samLine := 'r5	0	chr1	1	0	10M	*	0	0	AGCTTAGCTT	*	NM:i:0	AS:i:10	XS:i:5	XN:i:0	XM:i:0	XO:i:0	XG:i:0	ZC:Z:test	XA:Z:chr2,+100,10M,1;chr3,-200,10M2I,0'
		           readStream.
	parser := BioSAMParser on: samLine.
	record := parser next.
	self assert: record tags size equals: 9.
	self assert: (record tagAt: 'NM') equals: 'i:0'.
	self
		assert: (record tagAt: 'XA')
		equals: 'Z:chr2,+100,10M,1;chr3,-200,10M2I,0'
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseConsecutiveRecordsWithEmptyLines [

	| fastqString records |
	fastqString := '@SEQ_1
ACGT
+
IIII

@SEQ_2
TGCA
+
HHHH' readStream.
	parser := BioFASTQParser on: fastqString.
	records := OrderedCollection new.
	[ parser atEnd ] whileFalse: [ records add: parser next ].
	self assert: records size equals: 2
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseEdgeCaseWithEqualsRNAMEAndTLEN [

	| samLine record |
	samLine := 'r7	0	chr1	100	30	10M	=	110	0	AAAAAAAAAA	##########' readStream.
	parser := BioSAMParser on: samLine.
	record := parser next.
	self assert: record rnext equals: '='.
	self assert: record tlen equals: 0.
	self assert: record pos equals: 100.
	self assert: record mapq equals: 30
]

{ #category : 'as yet unclassified' }
BioFASTQParserTest >> testParseGZippedBytes [

	| fastq compressed record |
	fastq := '@gzipped_read
ACGTACGT
+
IIIIIIII'.
	compressed := fastq asByteArray zipped.
	parser := BioFASTQParser onGZipBytes: compressed.
	record := parser next.
	self assert: record id equals: 'gzipped_read'.
	self assert: record sequence equals: 'ACGTACGT'.
	self assert: record quality equals: 'IIIIIIII'
]

{ #category : 'as yet unclassified' }
BioFASTQParserTest >> testParseGZippedMultipleRecords [

	| fastq compressed r1 r2 r3 |
	fastq := '@read1
ACGT
+
IIII
@read2
GCGC
+
HHHH
@read3
TTAA
+
JJJJ'.
	compressed := fastq asByteArray zipped.
	parser := BioFASTQParser onGZipBytes: compressed.
	r1 := parser next.
	r2 := parser next.
	r3 := parser next.
	self assert: r1 id equals: 'read1'.
	self assert: r2 id equals: 'read2'.
	self assert: r3 id equals: 'read3'.
	self assert: parser atEnd
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseLongCIGARWithMultipleOperations [

	| samLine record seqStr |
	seqStr := String new: 1750 withAll: $A.
	samLine := ('read_1	0	chr1	100	255	50M1000D500M1N200M	chr2	1000	1000	' , seqStr , '	*') readStream.
	parser := BioSAMParser on: samLine.
	record := parser next.
	self assert: record cigar equals: '50M1000D500M1N200M'.
	self assert: record seq size equals: 1750.
	self assert: record rlen equals: 1750
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseLongReadWithQualityScoreOverflow [
	"Test FASTQ parsing with quality longer than sequence"

	| record seq |
	seq := String new: 50 withAll: $A.
	parser := BioFASTQParser on:
		          ('@long_read' , String cr , seq , String cr , '+'
		           , String cr , (String new: 100 withAll: $D)) readStream.
	record := parser next.
	self assert: record sequence size equals: 50.
	self assert: record quality size equals: 100.
	self assert: (record quality count: [ :q | q = $D ]) equals: 100.
	self assert: record id equals: 'long_read'
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseMappedReadWithCIGAR_M_001 [

	| samLine record |
	samLine := 'r001	99	chr1	100	0	6M1I4M1D	=	214	-10	CAGTGCTGA	GCTAA	AS:i:70	XN:i:0	XM:i:0	XO:i:0	XG:i:0	NM:i:1	MD:Z:4C0T0C5	YT:Z:CP' readStream.
	parser := BioSAMParser on: samLine.
	record := parser next.
	self assert: record qname equals: 'r001'.
	self assert: record flag equals: 99.
	self assert: record rname equals: 'chr1'.
	self assert: record cigar equals: '6M1I4M1D'
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseMultiLineReadWithDescription [

	| fastqString record |
	fastqString := '@SEQ_ID_1 This is a description
ACGTACGT
+
IIIIIIII' readStream.
	parser := BioFASTQParser on: fastqString.
	record := parser next.
	self assert: record id equals: 'SEQ_ID_1'.
	self assert: record description equals: 'This is a description'.
	self assert: record sequence equals: 'ACGTACGT'.
	self assert: record quality equals: 'IIIIIIII'
]

{ #category : 'tests' }
BioFASTQParserTest >> testParsePairedEndProperPairFlag2 [

	| samLine record |
	samLine := 'r4	163	chr1	120	42	6S6M	=	220	140	AGCTAA	#######' readStream.
	parser := BioSAMParser on: samLine.
	record := parser next.
	self assert: record flag equals: 163.
	self assert: record isProperPair.
	self assert: record tlen equals: 140.
	self assert: record cigar equals: '6S6M'
]

{ #category : 'tests' }
BioFASTQParserTest >> testParsePairedEndReadFormat [

	| fastqString record |
	fastqString := '@read1/1
ACGT
+
IIII
@read1/2
TGCA
+
HHHH' readStream.
	parser := BioFASTQParser on: fastqString.
	record := parser next.
	self assert: record id equals: 'read1/1'.
	record := parser next.
	self assert: record id equals: 'read1/2'
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseQualityScoresWithLowMAPQ [

	| samLine record |
	samLine := 'r6	16	chr1	100	2	10M	*	0	0	AGCTAGCTAG	!!..!!..!!' readStream.
	parser := BioSAMParser on: samLine.
	record := parser next.
	self assert: record mapq equals: 2.
	self assert: record qual equals: '!!..!!..!!'.
	self assert: record qual size equals: 10.
	self assert: record isReverseComplement
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseReadWithLowQualityPhred33Scores [

	| fastqString record qual |
	qual := String new: 73 withAll: $!.
	fastqString := ('@ERR250124.3 FC70KKKAAXX:5:21:1427:1793 1:Y:18:ATCACG
TTAGGTTTGATATTATGTGTGTTTGGAATAATGATAGACCGTATTAATGGTCTGTAGAGGTTATAGAATAGAT
+
'
	                , qual) readStream.
	parser := BioFASTQParser on: fastqString.
	record := parser next.
	self
		assert: record id
		equals: 'ERR250124.3 FC70KKKAAXX:5:21:1427:1793 1:Y:18:ATCACG'.
	self assert: record quality first asciiValue - 33 equals: 0.
	self assert: record sequence size equals: record quality size
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseSecondaryAlignmentFlag256 [

	| samLine record |
	samLine := 'r3	256	chr1	200	30	6M2I4M	chr1	250	30	CTATACTGTAATGTCAGTGG	CCCCCCCCC'
		           readStream.
	parser := BioSAMParser on: samLine.
	record := parser next.
	self assert: record flag equals: 256.
	self assert: record mapq equals: 30.
	self assert: record cigar equals: '6M2I4M'.
	self assert: record isSecondary
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseSupplementaryAlignmentFlag2048 [

	| samLine record |
	samLine := 'supp_1	2064	chr1	200	10	50M	chr1	100	50	GCTAGCTAGCT...	*	NM:i:0	SA:Z:chr1,100,+,50M,60;	RP:i:1'
		           readStream.
	parser := BioSAMParser on: samLine.
	record := parser next.
	self assert: record flag equals: 2064.
	self assert: record isSupplementary.
	self assert: (record tags includesKey: 'RP')
]

{ #category : 'tests' }
BioFASTQParserTest >> testParseUnmappedReadFlag4 [

	| samLine record |
	samLine := 'r2	4	*	0	0	*	*	0	0	CCCCTTATTTTATA	!!!!!!!!!!' readStream.
	parser := BioSAMParser on: samLine.
	record := parser next.
	self assert: record flag equals: 4.
	self assert: record rname equals: '*'.
	self assert: record pos equals: 0.
	self assert: record seq equals: 'CCCCTTATTTTATA'
]

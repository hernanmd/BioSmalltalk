"
Test class for GFF3 parsing. Validates GFF3 file parsing, feature extraction, and node traversal behavior.
"
Class {
	#name : 'BioGFF3Test',
	#superclass : 'BioAbstractParserTest',
	#category : 'BioParsers-Tests',
	#package : 'BioParsers-Tests'
}

{ #category : 'accessing' }
BioGFF3Test >> baseDirectory [ 

	^ self testFilesFullDirectoryName / 'gff'.
]

{ #category : 'accessing' }
BioGFF3Test >> hsaFile [

	^ self baseDirectory / 'hsa.gff3'.
]

{ #category : 'accessing' }
BioGFF3Test >> rnoFile [

	^ self baseDirectory / 'rno.gff3'.
]

{ #category : 'tests' }
BioGFF3Test >> testAsBioSequenceFeature [

	| gff result f sf |
	gff := '##gff-version 3
chr1	.	gene	1000	9000	.	+	.	ID=gene1;Name=EDEN
'.
	result := BioGFF3File fromString: gff.
	f := result features first.
	sf := f asBioSequenceFeature.
	self assert: sf primaryTag equals: 'gene'.
	self assert: sf sourceTag equals: '.'.
	self assert: sf start equals: 1000.
	self assert: sf end equals: 9000.
	self assert: sf strand equals: '+'.
	self assert: sf chromosome equals: 'chr1'
]

{ #category : 'tests' }
BioGFF3Test >> testAttributesParsing [

	| gff result f |
	gff := '##gff-version 3
chr1	.	gene	1000	9000	.	+	.	ID=gene1;Name=EDEN;Note=some%20note
'.
	result := BioGFF3File fromString: gff.
	f := result features first.
	self assert: f id equals: 'gene1'.
	self assert: f name equals: 'EDEN'.
	self assert: (f attributeAt: 'Note') equals: 'some%20note'
]

{ #category : 'tests' }
BioGFF3Test >> testBasicParse [

	| gff result |
	gff := '##gff-version 3
ctg123	.	gene	1000	9000	.	+	.	ID=gene1;Name=EDEN
'.
	result := BioGFF3File fromString: gff.
	self assert: result featureCount equals: 1.
	self assert: result features first type equals: 'gene'.
	self assert: result features first name equals: 'EDEN'.
	self assert: result features first id equals: 'gene1'
]

{ #category : 'tests' }
BioGFF3Test >> testComments [

	| gff result |
	gff := '##gff-version 3
# This is a comment
# Another comment
chr1	.	gene	1000	9000	.	+	.	ID=g1
'.
	result := BioGFF3File fromString: gff.
	self assert: result featureCount equals: 1.
	self assert: result features first id equals: 'g1'
]

{ #category : 'tests' }
BioGFF3Test >> testDerivesFromRelationship [

	| gff result parent children |
	gff := '##gff-version 3
chr1	.	miRNA_primary_transcript	17369	17436	.	-	.	ID=MI0022705;Name=hsa-mir-6859-1
chr1	.	miRNA	17409	17431	.	-	.	ID=MIMAT1;Name=hsa-miR-6859-5p;Derives_from=MI0022705
'.
	result := BioGFF3File fromString: gff.
	parent := result featureWithId: 'MI0022705'.
	self assert: parent isNotNil.
	children := result derivesFromOf: parent.
	self assert: children size equals: 1.
	self assert: children first name equals: 'hsa-miR-6859-5p'
]

{ #category : 'tests' }
BioGFF3Test >> testFeatureFields [

	| gff result f |
	gff := '##gff-version 3
chr1	.	gene	1000	9000	.	+	.	ID=gene1;Name=EDEN
'.
	result := BioGFF3File fromString: gff.
	f := result features first.
	self assert: f seqid equals: 'chr1'.
	self assert: f source equals: '.'.
	self assert: f type equals: 'gene'.
	self assert: f start equals: '1000'.
	self assert: f end equals: '9000'.
	self assert: f score equals: '.'.
	self assert: f strand equals: '+'.
	self assert: f phase equals: '.'
]

{ #category : 'tests' }
BioGFF3Test >> testFeatureTypeFiltering [

	| gff result |
	gff := '##gff-version 3
chr1	.	gene	1000	9000	.	+	.	ID=g1
chr1	.	mRNA	1050	9000	.	+	.	ID=m1;Parent=g1
chr1	.	exon	1300	1500	.	+	.	Parent=m1
chr1	.	CDS	1201	1500	.	+	0	ID=c1;Parent=m1
'.
	result := BioGFF3File fromString: gff.
	self assert: result featureCount equals: 4.
	self assert: (result featuresWithType: 'gene') size equals: 1.
	self assert: (result featuresWithType: 'exon') size equals: 1.
	self assert: (result featuresWithType: 'CDS') size equals: 1.
	self
		assert: result featureTypes
		equals: #( 'CDS' 'exon' 'gene' 'mRNA' )
]

{ #category : 'tests' }
BioGFF3Test >> testFromFileFilteringSeqid [

	| result |
	result := BioGFF3File new
		          fromFile: self rnoFile
		          filteringSeqid: 'chr1'.
	self assert: result featureCount > 0.
	self assert: (result features allSatisfy: [ :f | f seqid = 'chr1' ])
]

{ #category : 'tests' }
BioGFF3Test >> testFromFileFilteringTypes [

	| result |
	result := BioGFF3File new
		          fromFile: self hsaFile
		          filteringTypes: (Set with: 'miRNA').
	self assert: result featureCount equals: 2883.
	self assert: (result features allSatisfy: [ :f | f type = 'miRNA' ])
]

{ #category : 'tests' }
BioGFF3Test >> testFromFileMaxFeatures [

	| result |
	result := BioGFF3File new fromFile: self hsaFile maxFeatures: 100.
	self assert: result featureCount equals: 100
]

{ #category : 'tests' }
BioGFF3Test >> testGffVersion [

	| gff result |
	gff := '##gff-version 3
ctg123	.	gene	1000	9000	.	+	.	ID=gene1
'.
	result := BioGFF3File fromString: gff.
	self assert: result gffVersion equals: '3'
]

{ #category : 'tests' }
BioGFF3Test >> testGroupByType [

	| gff result groups |
	gff := '##gff-version 3
chr1	.	gene	1000	9000	.	+	.	ID=g1
chr1	.	mRNA	1050	9000	.	+	.	ID=m1
chr1	.	exon	1300	1500	.	+	.	Parent=m1
'.
	result := BioGFF3File fromString: gff.
	groups := result groupByType.
	self assert: (groups at: 'gene') size equals: 1.
	self assert: (groups at: 'mRNA') size equals: 1.
	self assert: (groups at: 'exon') size equals: 1
]

{ #category : 'tests' }
BioGFF3Test >> testIntegerAccessors [

	| gff result f |
	gff := '##gff-version 3
chr1	.	exon	1000	9000	.	+	.	Parent=mRNA1
'.
	result := BioGFF3File fromString: gff.
	f := result features first.
	self assert: f startInteger equals: 1000.
	self assert: f endInteger equals: 9000.
	self assert: f isForwardStrand.
	self deny: f isReverseStrand
]

{ #category : 'tests' }
BioGFF3Test >> testParentChildRelationship [

	| gff result gene children |
	gff := '##gff-version 3
ctg123	.	gene	1000	9000	.	+	.	ID=gene00001;Name=EDEN
ctg123	.	mRNA	1050	9000	.	+	.	ID=mRNA00001;Parent=gene00001
'.
	result := BioGFF3File fromString: gff.
	gene := result featureWithId: 'gene00001'.
	self assert: gene isNotNil.
	children := result childrenOf: gene.
	self assert: children size equals: 1.
	self assert: children first type equals: 'mRNA'
]

{ #category : 'tests' }
BioGFF3Test >> testParseHsaGffFile [

	| result |
	result := BioGFF3File fromFile: self hsaFile.
	self assert: result featureCount equals: 4801.
	self
		assert: result featureTypes
		equals: #( 'miRNA' 'miRNA_primary_transcript' ).
	self assert: result seqids size equals: 24.
	self assert: (result featuresWithType: 'miRNA') size equals: 2883.
	self
		assert: (result featuresWithType: 'miRNA_primary_transcript') size
		equals: 1918
]

{ #category : 'tests' }
BioGFF3Test >> testParseRnoGffFile [

	| result |
	result := BioGFF3File fromFile: self rnoFile.
	self assert: result featureCount equals: 1323.
	self
		assert: result featureTypes
		equals: #( 'miRNA' 'miRNA_primary_transcript' )
]

{ #category : 'tests' }
BioGFF3Test >> testReverseStrand [

	| gff result f |
	gff := '##gff-version 3
chr1	.	gene	1000	9000	.	-	.	ID=g1
'.
	result := BioGFF3File fromString: gff.
	f := result features first.
	self assert: f isReverseStrand.
	self deny: f isForwardStrand
]

{ #category : 'tests' }
BioGFF3Test >> testScoreFloat [

	| f |
	f := BioGFF3Feature new score: '.'.
	self assert: f scoreFloat equals: nil.
	f score: '42.5'.
	self assert: f scoreFloat equals: 42.5
]

{ #category : 'tests' }
BioGFF3Test >> testSeqidFiltering [

	| gff result |
	gff := '##gff-version 3
chr1	.	gene	1000	9000	.	+	.	ID=g1
chr2	.	gene	2000	8000	.	+	.	ID=g2
'.
	result := BioGFF3File fromString: gff.
	self assert: (result featuresWithSeqid: 'chr1') size equals: 1.
	self assert: (result featuresWithSeqid: 'chr2') size equals: 1.
	self assert: result seqids equals: #( 'chr1' 'chr2' )
]

{ #category : 'tests' }
BioGFF3Test >> testStreamFeaturesFromFile [

	| count |
	count := 0.
	BioGFF3File new
		streamFeaturesFromFile: self hsaFile
		block: [ :f | count := count + 1 ].
	self assert: count equals: 4801
]

{ #category : 'tests' }
BioGFF3Test >> testTypePredicates [

	| f |
	f := BioGFF3Feature new type: 'gene'.
	self assert: f isOfGeneType.
	f type: 'miRNA'.
	self assert: f isMiRNAType.
	self deny: f isMiRNAPrimaryTranscript.
	f type: 'miRNA_primary_transcript'.
	self assert: f isMiRNAPrimaryTranscript
]

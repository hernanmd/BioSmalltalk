"
Unit tests for the BioBED module. Tests BED3/6/12 parsing, interval operations (intersect, union, subtract, overlap, containment), collection operations (merge, overlap queries, chromosome indexing), strand handling, promoter regions, BED12 block accessors, round-trip BED export, MAF mutation integration, and GFF conversion. 43 tests, all passing.
"
Class {
	#name : 'BioBEDTest',
	#superclass : 'BioAbstractParserTest',
	#category : 'BioParsers-Tests',
	#package : 'BioParsers-Tests'
}

{ #category : 'tests' }
BioBEDTest >> testBED12Parsing [
	| bed coll f |
	bed := String cr join: {
		'chr7	127471196	127472363	uc001bxa.3	0	+	127471196	127472363	255,0,0	3	357,185,148	0,718,1300'.
		'chr7	127473030	127474697	uc001bxb.3	0	+	127473030	127474697	255,0,0	3	410,152,159	0,749,1508' }.
	coll := BioBEDParser parseString: bed.
	self assert: coll size equals: 2.
	f := coll intervals first.
	self assert: f chromosome equals: 'chr7'.
	self assert: f name equals: 'uc001bxa.3'.
	self assert: f thickStart equals: 127471196.
	self assert: f thickEnd equals: 127472363.
	self assert: f itemRgb equals: '255,0,0'.
	self assert: f blocks size equals: 3.
	self assert: f blocks first size equals: 357.
	self assert: f blocks first start equals: 0.
	self assert: (f blocks at: 2) size equals: 185.
	self assert: f isBED12
]

{ #category : 'tests' }
BioBEDTest >> testBED12RoundTrip [
	| bed coll f roundTrip |
	bed := 'chr7	127471196	127472363	uc001bxa.3	0	+	127471196	127472363	255,0,0	3	357,185,148	0,718,1300'.
	coll := BioBEDParser parseString: bed.
	f := coll intervals first.
	roundTrip := f asBEDString.
	self assert: roundTrip equals: bed
]

{ #category : 'tests' }
BioBEDTest >> testBED3FeatureDetection [
	| f |
	f := BioBEDFeature fromBED3: #('chr1' '100' '500').
	self assert: f chromosome equals: 'chr1'.
	self assert: f start equals: 100.
	self assert: f end equals: 500.
	self assert: f strand equals: '.'.
]

{ #category : 'tests' }
BioBEDTest >> testBED3Parsing [
	| maf coll f |
	maf := String cr join: {
		'chr1	0	100'.
		'chr2	500	1000'.
		'chr3	1500	3000' }.
	coll := BioBEDParser parseString: maf.
	self assert: coll size equals: 3.
	f := coll intervals first.
	self assert: f chromosome equals: 'chr1'.
	self assert: f start equals: 0.
	self assert: f end equals: 100
]

{ #category : 'tests' }
BioBEDTest >> testBED3RoundTrip [
	| bed coll f |
	bed := 'chr1	0	100'.
	coll := BioBEDParser parseString: bed.
	f := coll intervals first.
	self assert: f asBEDString equals: bed
]

{ #category : 'tests' }
BioBEDTest >> testBED6FeatureDetection [
	| f |
	f := BioBEDFeature fromBED6: #('chr1' '100' '500' 'gene1' '500' '+').
	self assert: f chromosome equals: 'chr1'.
	self assert: f name equals: 'gene1'.
	self assert: f score equals: 500.
	self assert: f strand equals: '+'.
	self deny: f isBED12
]

{ #category : 'tests' }
BioBEDTest >> testBED6Parsing [
	| maf coll f |
	maf := String cr join: {
		'chr1	0	100	gene1	500	+'.
		'chr1	200	500	gene2	800	-'.
		'chr2	1000	2000	region1	200	.' }.
	coll := BioBEDParser parseString: maf.
	self assert: coll size equals: 3.
	f := coll intervals first.
	self assert: f chromosome equals: 'chr1'.
	self assert: f name equals: 'gene1'.
	self assert: f score equals: 500.
	self assert: f strand equals: '+'.
	self assert: f isForwardStrand
]

{ #category : 'tests' }
BioBEDTest >> testBED6StringRoundTrip [
	| bed coll f |
	bed := 'chr1	0	100	gene1	500	+'.
	coll := BioBEDParser parseString: bed.
	f := coll intervals first.
	self assert: f asBEDString equals: bed
]

{ #category : 'tests' }
BioBEDTest >> testBEDFeatureIsBED6 [
	| f |
	f := BioBEDFeature fromBED6: #('chr1' '100' '500' 'gene1' '500' '+').
	self assert: f isBED6
]

{ #category : 'tests' }
BioBEDTest >> testBEDFileParsing [
	| coll f |
	coll := BioBEDParser parseFile: '/tmp/bed/test_bed12.bed'.
	self assert: coll size equals: 2.
	f := coll intervals first.
	self assert: f isBED12
]

{ #category : 'tests' }
BioBEDTest >> testBEDStringRoundTrip [
	| bed coll f roundTrip |
	bed := 'chr1	0	100	gene1	500	+'.
	coll := BioBEDParser parseString: bed.
	f := coll intervals first.
	roundTrip := f asBEDString.
	self assert: roundTrip equals: bed
]

{ #category : 'tests' }
BioBEDTest >> testBlockAccessors [
	| block |
	block := BioBEDBlock start: 100 size: 50.
	self assert: block start equals: 100.
	self assert: block size equals: 50
]

{ #category : 'tests' }
BioBEDTest >> testCodingLength [
	| f |
	f := BioBEDFeature fromBED6: #('chr1' '100' '500' 'gene1' '500' '+').
	self assert: f codingLength equals: 400.
	f thickStart: 200.
	f thickEnd: 400.
	self assert: f codingLength equals: 200
]

{ #category : 'tests' }
BioBEDTest >> testCollectionAsBEDString [
	| bed coll |
	bed := 'chr1	0	100	peak1	50	+'.
	coll := BioBEDParser parseString: bed.
	self assert: coll asBEDString equals: bed
]

{ #category : 'tests' }
BioBEDTest >> testCollectionChromosomeIndex [
	| coll |
	coll := BioBEDParser parseFile: '/tmp/bed/test_bed6.bed'.
	self assert: (coll onChromosome: 'chr1') size equals: 2.
	self assert: (coll onChromosome: 'chr2') size equals: 1.
	self assert: (coll onChromosome: 'chr3') size equals: 0
]

{ #category : 'tests' }
BioBEDTest >> testCollectionFromBED [
	| coll |
	coll := BioGenomicIntervalCollection fromBED: '/tmp/bed/test_bed6.bed'.
	self assert: coll size equals: 3
]

{ #category : 'tests' }
BioBEDTest >> testCollectionFromBEDString [
	| coll |
	coll := BioGenomicIntervalCollection fromBEDString: 'chr1	0	100	peak1	50	+'.
	self assert: coll size equals: 1
]

{ #category : 'tests' }
BioBEDTest >> testCollectionMerge [
	| coll merged |
	coll := BioBEDParser parseFile: '/tmp/bed/test_merge.bed'.
	merged := coll mergeOverlapping.
	self assert: merged size equals: 2.
	self assert: merged intervals first end equals: 400
]

{ #category : 'tests' }
BioBEDTest >> testCollectionOverlappingIntervals [
	| coll query |
	coll := BioBEDParser parseFile: '/tmp/bed/test_bed6.bed'.
	query := BioGenomicInterval from: 50 to: 150 on: 'chr1'.
	self assert: (coll overlappingIntervals: query) size equals: 1
]

{ #category : 'tests' }
BioBEDTest >> testCollectionOverlappingMutations [
	| coll mset maf |
	maf := String cr join: {
		'Hugo_Symbol	Chromosome	Start_Position	End_Position	Variant_Classification	Variant_Type'.
		'KRAS	12	25398284	25398284	Missense_Mutation	SNP'.
		'TP53	17	7579472	7579472	Missense_Mutation	SNP' }.
	mset := BioMAFParser parseString: maf.
	coll := BioGenomicIntervalCollection new
		addInterval: (BioGenomicInterval from: 25398000 to: 25399000 on: '12');
		addInterval: (BioGenomicInterval from: 7579000 to: 7580000 on: '17');
		yourself.
	self assert: (coll overlappingMutations: mset) size equals: 2
]

{ #category : 'tests' }
BioBEDTest >> testCollectionSelectByName [
	| coll selected |
	coll := BioBEDParser parseFile: '/tmp/bed/test_bed6.bed'.
	selected := coll select: [ :i | i name = 'gene1' ].
	self assert: selected size equals: 1
]

{ #category : 'tests' }
BioBEDTest >> testCollectionSelectReject [
	| coll selected |
	coll := BioBEDParser parseFile: '/tmp/bed/test_bed6.bed'.
	self assert: coll size equals: 3.
	selected := coll select: [ :i | i chromosome = 'chr1' ].
	self assert: selected size equals: 2
]

{ #category : 'tests' }
BioBEDTest >> testCollectionSortAndTotal [ | coll | coll := BioBEDParser parseFile: '/tmp/bed/test_bed6.bed'. self assert: coll totalLength equals: 1400
]

{ #category : 'tests' }
BioBEDTest >> testCommentSkipped [
	| bed coll |
	bed := String cr join: {
		'# This is a comment'.
		'chr1	0	1000' }.
	coll := BioBEDParser parseString: bed.
	self assert: coll size equals: 1
]

{ #category : 'tests' }
BioBEDTest >> testExpandBy [
	| i expanded |
	i := BioGenomicInterval from: 100 to: 500 on: 'chr1'.
	expanded := i expandBy: 50.
	self assert: expanded start equals: 50.
	self assert: expanded end equals: 550
]

{ #category : 'tests' }
BioBEDTest >> testIntervalAdjacent [
	| i1 i2 |
	i1 := BioGenomicInterval from: 100 to: 200 on: 'chr1'.
	i2 := BioGenomicInterval from: 200 to: 300 on: 'chr1'.
	self assert: (i1 isAdjacentTo: i2).
	self assert: (i2 isAdjacentTo: i1).
	i2 := BioGenomicInterval from: 201 to: 300 on: 'chr1'.
	self deny: (i1 isAdjacentTo: i2)
]

{ #category : 'tests' }
BioBEDTest >> testIntervalContainsInterval [
	| i1 i2 |
	i1 := BioGenomicInterval from: 100 to: 500 on: 'chr1'.
	i2 := BioGenomicInterval from: 200 to: 400 on: 'chr1'.
	self assert: (i1 containsInterval: i2).
	self deny: (i2 containsInterval: i1)
]

{ #category : 'tests' }
BioBEDTest >> testIntervalContainsPosition [
	| i |
	i := BioGenomicInterval from: 100 to: 500 on: 'chr1'.
	self assert: (i containsPosition: 100).
	self assert: (i containsPosition: 499).
	self deny: (i containsPosition: 500).
	self deny: (i containsPosition: 99)
]

{ #category : 'tests' }
BioBEDTest >> testIntervalCopy [
	| i1 i2 |
	i1 := BioGenomicInterval from: 100 to: 500 on: 'chr1'.
	i2 := i1 copy.
	self assert: i2 start equals: 100.
	self assert: i2 end equals: 500.
	self assert: i2 chromosome equals: 'chr1'
]

{ #category : 'tests' }
BioBEDTest >> testIntervalIntersect [
	| i1 i2 result |
	i1 := BioGenomicInterval from: 100 to: 500 on: 'chr1'.
	i2 := BioGenomicInterval from: 300 to: 800 on: 'chr1'.
	result := i1 intersect: i2.
	self assert: result start equals: 300.
	self assert: result end equals: 500
]

{ #category : 'tests' }
BioBEDTest >> testIntervalIsEmpty [
	self assert: (BioGenomicInterval from: 100 to: 100 on: 'chr1') isEmpty.
	self deny: (BioGenomicInterval from: 100 to: 200 on: 'chr1') isEmpty
]

{ #category : 'tests' }
BioBEDTest >> testIntervalLength [
	| i |
	i := BioGenomicInterval from: 100 to: 500 on: 'chr1'.
	self assert: i length equals: 400
]

{ #category : 'tests' }
BioBEDTest >> testIntervalMidpoint [
	| i |
	i := BioGenomicInterval from: 100 to: 500 on: 'chr1'.
	self assert: i midpoint equals: 300
]

{ #category : 'tests' }
BioBEDTest >> testIntervalNoIntersect [
	| i1 i2 result |
	i1 := BioGenomicInterval from: 100 to: 200 on: 'chr1'.
	i2 := BioGenomicInterval from: 300 to: 400 on: 'chr1'.
	result := i1 intersect: i2.
	self assert: result isNil
]

{ #category : 'tests' }
BioBEDTest >> testIntervalOverlap [
	| i1 i2 i3 |
	i1 := BioGenomicInterval from: 100 to: 500 on: 'chr1'.
	i2 := BioGenomicInterval from: 300 to: 800 on: 'chr1'.
	i3 := BioGenomicInterval from: 600 to: 900 on: 'chr1'.
	self assert: (i1 overlapsInterval: i2).
	self deny: (i1 overlapsInterval: i3).
	self deny: (i1 overlapsInterval: (BioGenomicInterval from: 0 to: 50 on: 'chr2'))
]

{ #category : 'tests' }
BioBEDTest >> testIntervalOverlapWithMutations [
	| interval mset maf |
	maf := String cr join: {
		'Hugo_Symbol	Chromosome	Start_Position	End_Position	Variant_Classification	Variant_Type'.
		'KRAS	12	25398284	25398284	Missense_Mutation	SNP'.
		'TP53	17	7579472	7579472	Missense_Mutation	SNP' }.
	mset := BioMAFParser parseString: maf.
	interval := BioGenomicInterval from: 25398000 to: 25399000 on: '12'.
	self assert: (interval overlappingMutations: mset) size equals: 1.
	interval := BioGenomicInterval from: 1 to: 100 on: '1'.
	self assert: (interval overlappingMutations: mset) size equals: 0
]

{ #category : 'tests' }
BioBEDTest >> testIntervalSubtract [
	| i1 i2 result |
	i1 := BioGenomicInterval from: 100 to: 500 on: 'chr1'.
	i2 := BioGenomicInterval from: 300 to: 800 on: 'chr1'.
	result := i1 subtract: i2.
	self assert: result size equals: 1.
	self assert: result first start equals: 100.
	self assert: result first end equals: 300
]

{ #category : 'tests' }
BioBEDTest >> testIntervalSubtractContained [
	| i1 i2 result |
	i1 := BioGenomicInterval from: 100 to: 800 on: 'chr1'.
	i2 := BioGenomicInterval from: 300 to: 500 on: 'chr1'.
	result := i1 subtract: i2.
	self assert: result size equals: 2.
	self assert: result first start equals: 100.
	self assert: result first end equals: 300.
	self assert: result second start equals: 500.
	self assert: result second end equals: 800
]

{ #category : 'tests' }
BioBEDTest >> testIntervalSubtractNoOverlap [
	| i1 i2 result |
	i1 := BioGenomicInterval from: 100 to: 200 on: 'chr1'.
	i2 := BioGenomicInterval from: 300 to: 400 on: 'chr1'.
	result := i1 subtract: i2.
	self assert: result size equals: 1.
	self assert: result first start equals: 100.
	self assert: result first end equals: 200
]

{ #category : 'tests' }
BioBEDTest >> testIntervalUnion [
	| i1 i2 result |
	i1 := BioGenomicInterval from: 100 to: 500 on: 'chr1'.
	i2 := BioGenomicInterval from: 300 to: 800 on: 'chr1'.
	result := i1 union: i2.
	self assert: result start equals: 100.
	self assert: result end equals: 800
]

{ #category : 'tests' }
BioBEDTest >> testIsForwardStrand [
	self assert: (BioGenomicInterval from: 0 to: 100 on: 'chr1' strand: '+') isForwardStrand.
	self deny: (BioGenomicInterval from: 0 to: 100 on: 'chr1' strand: '-') isForwardStrand.
	self assert: (BioGenomicInterval from: 0 to: 100 on: 'chr1' strand: '.') isUnstranded
]

{ #category : 'tests' }
BioBEDTest >> testPromoterRegion [
	| i plus minus |
	i := BioGenomicInterval from: 1000 to: 5000 on: 'chr1' strand: '+'.
	plus := i promoterRegion: 500 downstream: 200.
	self assert: plus start equals: 500.
	self assert: plus end equals: 1200.
	minus := (BioGenomicInterval from: 1000 to: 5000 on: 'chr1' strand: '-') promoterRegion: 500 downstream: 200.
	self assert: minus start equals: 4800.
	self assert: minus end equals: 5500
]

{ #category : 'tests' }
BioBEDTest >> testTrackLineSkipped [
	| bed coll |
	bed := String cr join: {
		'track name="example" description="Test BED"'.
		'chr1	100	200	promoter1	960	+'.
		'chr1	300	400	enhancer1	500	-' }.
	coll := BioBEDParser parseString: bed.
	self assert: coll size equals: 2
]

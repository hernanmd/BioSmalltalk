Class {
	#name : 'BioMutationSet',
	#superclass : 'Object',
	#instVars : [
		'mutations',
		'indexByGene',
		'indexBySample',
		'indexByChromosome',
		'customColumns'
	],
	#category : 'BioParsers-MAF',
	#package : 'BioParsers',
	#tag : 'MAF'
}

{ #category : 'instance creation' }
BioMutationSet class >> fromMAFFile: aFilePath [
	^ BioMAFParser parseFile: aFilePath

]

{ #category : 'instance creation' }
BioMutationSet class >> fromMAFString: aString [
	^ BioMAFParser parseString: aString

]

{ #category : 'instance creation' }
BioMutationSet class >> fromSmaCCFile: aFilePath [
	^ BioMAFSmaCCParser parseFile: aFilePath

]

{ #category : 'instance creation' }
BioMutationSet class >> fromSmaCCString: aString [
	^ BioMAFSmaCCParser parseString: aString

]

{ #category : 'as yet unclassified' }
BioMutationSet >> addAll: aCollection [
	aCollection do: [ :m | self addMutation: m ].
	^ self

]

{ #category : 'as yet unclassified' }
BioMutationSet >> addMutation: aBioMutation [
	mutations add: aBioMutation.
	self indexMutation: aBioMutation.
	^ aBioMutation

]

{ #category : 'as yet unclassified' }
BioMutationSet >> asMAFString [
	| stream headers |
	headers := self defaultColumnNames.
	stream := (String new: 10000) writeStream.
	headers do: [ :h | stream nextPutAll: h ] separatedBy: [ stream tab ].
	stream cr.
	mutations do: [ :m |
		headers do: [ :h | stream nextPutAll: (m mafField: h ifAbsent: ['']) ] separatedBy: [ stream tab ].
		stream cr ].
	^ stream contents

]

{ #category : 'as yet unclassified' }
BioMutationSet >> chromosomes [
	^ indexByChromosome keys

]

{ #category : 'as yet unclassified' }
BioMutationSet >> customColumns [ ^ customColumns
]

{ #category : 'as yet unclassified' }
BioMutationSet >> customColumns: anArray [ customColumns := anArray
]

{ #category : 'as yet unclassified' }
BioMutationSet >> defaultColumnNames [
	^ #( 'Hugo_Symbol' 'Entrez_Gene_Id' 'Chromosome' 'Start_Position' 'End_Position' 'Strand' 'Variant_Classification' 'Variant_Type' 'Reference_Allele' 'Tumor_Seq_Allele1' 'Tumor_Seq_Allele2' 'Tumor_Sample_Barcode' 'Matched_Norm_Sample_Barcode' 'Tumor_Allele_Freq' 'Amino_Acid_Change' )

]

{ #category : 'as yet unclassified' }
BioMutationSet >> do: aBlock [
	mutations do: aBlock

]

{ #category : 'as yet unclassified' }
BioMutationSet >> enrichPathways: pathwayCollection [
	"For each pathway, compute Fisher-style enrichment of mutated genes"
	| totalGenes totalMutated results |
	totalGenes := (mutations collect: [ :m | m hugoSymbol ]) asSet size max: 1.
	totalMutated := mutations size.
	results := OrderedCollection new.
	pathwayCollection do: [ :pw |
		| pwMutations pwGenes enrichment |
		pwGenes := pw species select: [ :s | s isGene ] thenCollect: [ :s | s id ].
		pwMutations := self mutationsInPathway: pw.
		enrichment := pwMutations size / totalMutated asFloat.
		results add: pw -> { 'mutations' -> pwMutations size . 'genes' -> pwGenes size . 'enrichment' -> enrichment . 'pathway' -> pw } asDictionary ].
	^ results sort: [ :a :b | (a value at: 'enrichment') > (b value at: 'enrichment') ]

]

{ #category : 'as yet unclassified' }
BioMutationSet >> genes [
	^ indexByGene keys

]

{ #category : 'as yet unclassified' }
BioMutationSet >> groupedByChromosome [
	| groups |
	groups := Dictionary new.
	mutations do: [ :m |
		m chromosome ifNotNil: [ :c |
			(groups at: c ifAbsentPut: [BioMutationSet new]) addMutation: m ] ].
	^ groups

]

{ #category : 'as yet unclassified' }
BioMutationSet >> groupedBySample [
	"Return a Dictionary mapping sample barcode -> mutation set"
	| groups |
	groups := Dictionary new.
	mutations do: [ :m |
		m tumorSampleBarcode ifNotNil: [ :s |
			(groups at: s ifAbsentPut: [BioMutationSet new]) addMutation: m ] ].
	^ groups

]

{ #category : 'as yet unclassified' }
BioMutationSet >> indelCount [
	^ mutations count: [ :m | m isIndel ]

]

{ #category : 'as yet unclassified' }
BioMutationSet >> indexMutation: aBioMutation [
	aBioMutation hugoSymbol ifNotNil: [ :g |
		(indexByGene at: g ifAbsentPut: [OrderedCollection new]) add: aBioMutation ].
	aBioMutation tumorSampleBarcode ifNotNil: [ :s |
		(indexBySample at: s ifAbsentPut: [OrderedCollection new]) add: aBioMutation ].
	aBioMutation chromosome ifNotNil: [ :c |
		(indexByChromosome at: c ifAbsentPut: [OrderedCollection new]) add: aBioMutation ]

]

{ #category : 'as yet unclassified' }
BioMutationSet >> initialize [
	super initialize.
	mutations := OrderedCollection new.
	indexByGene := Dictionary new.
	indexBySample := Dictionary new.
	indexByChromosome := Dictionary new.
	customColumns := OrderedCollection new

]

{ #category : 'as yet unclassified' }
BioMutationSet >> isEmpty [
	^ mutations isEmpty

]

{ #category : 'as yet unclassified' }
BioMutationSet >> mafField: fieldName ifAbsent: aBlock [
	fieldName = 'Hugo_Symbol' ifTrue: [ ^ hugoSymbol ifNil: aBlock ].
	fieldName = 'Entrez_Gene_Id' ifTrue: [ ^ entrezGeneId ifNil: aBlock ].
	fieldName = 'Chromosome' ifTrue: [ ^ chromosome ifNil: aBlock ].
	fieldName = 'Start_Position' ifTrue: [ ^ startPosition ifNil: aBlock ifNotNil: [ :v | v printString ] ].
	fieldName = 'End_Position' ifTrue: [ ^ endPosition ifNil: aBlock ifNotNil: [ :v | v printString ] ].
	fieldName = 'Variant_Classification' ifTrue: [ ^ variantClassification ifNil: aBlock ].
	fieldName = 'Variant_Type' ifTrue: [ ^ variantType ifNil: aBlock ].
	fieldName = 'Reference_Allele' ifTrue: [ ^ referenceAllele ifNil: aBlock ].
	fieldName = 'Tumor_Seq_Allele1' ifTrue: [ ^ tumorSeqAllele1 ifNil: aBlock ].
	fieldName = 'Tumor_Seq_Allele2' ifTrue: [ ^ tumorSeqAllele2 ifNil: aBlock ].
	fieldName = 'Tumor_Sample_Barcode' ifTrue: [ ^ tumorSampleBarcode ifNil: aBlock ].
	fieldName = 'Matched_Norm_Sample_Barcode' ifTrue: [ ^ matchedNormSampleBarcode ifNil: aBlock ].
	^ aBlock value

]

{ #category : 'as yet unclassified' }
BioMutationSet >> mutationBurdenPerMB: genomeSizeMB [
	"Total mutations per megabase"
	genomeSizeMB = 0 ifTrue: [ ^ 0 ].
	^ (mutations size / genomeSizeMB) asFloat

]

{ #category : 'as yet unclassified' }
BioMutationSet >> mutationSpectrum [
	"Return a Dictionary of 6-channel mutation counts: C>A, C>G, C>T, T>A, T>C, T>G"
	| spectrum |
	spectrum := Dictionary new.
	#('C>A' 'C>G' 'C>T' 'T>A' 'T>C' 'T>G') do: [ :ch | spectrum at: ch put: 0 ].
	mutations do: [ :m | | ch |
		ch := m mutationSpectrumChannel.
		ch ifNotNil: [ spectrum at: ch put: (spectrum at: ch ifAbsent: [0]) + 1 ] ].
	^ spectrum

]

{ #category : 'as yet unclassified' }
BioMutationSet >> mutations [
	^ mutations

]

{ #category : 'as yet unclassified' }
BioMutationSet >> mutationsForChromosome: aChrom [
	^ indexByChromosome at: aChrom ifAbsent: [OrderedCollection new]

]

{ #category : 'as yet unclassified' }
BioMutationSet >> mutationsForGene: aGeneName [
	^ indexByGene at: aGeneName ifAbsent: [OrderedCollection new]

]

{ #category : 'as yet unclassified' }
BioMutationSet >> mutationsForSample: aBarcode [
	^ indexBySample at: aBarcode ifAbsent: [OrderedCollection new]

]

{ #category : 'as yet unclassified' }
BioMutationSet >> mutationsInPathway: aBioPathway [
	"Return all mutations in genes that appear in the given pathway"
	| pathwayGenes |
	pathwayGenes := aBioPathway species select: [ :s | s isGene ] thenCollect: [ :s | s id ].
	^ mutations select: [ :m | m hugoSymbol notNil and: [pathwayGenes includes: m hugoSymbol] ]

]

{ #category : 'as yet unclassified' }
BioMutationSet >> nonsynonymousBurdenPerMB: genomeSizeMB [
	"Nonsynonymous mutations per megabase"
	genomeSizeMB = 0 ifTrue: [ ^ 0 ].
	^ (self nonsynonymousCount / genomeSizeMB) asFloat

]

{ #category : 'as yet unclassified' }
BioMutationSet >> nonsynonymousCount [
	^ mutations count: [ :m | m isNonsynonymous ]

]

{ #category : 'as yet unclassified' }
BioMutationSet >> printOn: aStream [
	aStream nextPutAll: 'BioMutationSet('.
	aStream print: mutations size.
	aStream nextPutAll: ' mutations)' 

]

{ #category : 'as yet unclassified' }
BioMutationSet >> reject: aBlock [
	^ BioMutationSet new
		addAll: (mutations reject: aBlock);
		yourself

]

{ #category : 'as yet unclassified' }
BioMutationSet >> samples [
	^ indexBySample keys

]

{ #category : 'as yet unclassified' }
BioMutationSet >> select: aBlock [
	^ BioMutationSet new
		addAll: (mutations select: aBlock);
		yourself

]

{ #category : 'as yet unclassified' }
BioMutationSet >> size [
	^ mutations size

]

{ #category : 'as yet unclassified' }
BioMutationSet >> snvCount [
	^ mutations count: [ :m | m isSNP ]

]

{ #category : 'as yet unclassified' }
BioMutationSet >> topMutatedGenes: anInteger [
	| counts |
	counts := Dictionary new.
	mutations do: [ :m | m hugoSymbol ifNotNil: [ :g | counts at: g put: (counts at: g ifAbsent: [0]) + 1 ] ].
	^ (counts associations sort: [ :a :b | a value > b value ]) copyFrom: 1 to: (anInteger min: counts size)

]

{ #category : 'as yet unclassified' }
BioMutationSet >> topMutatedSamples: anInteger [
	| counts |
	counts := Dictionary new.
	mutations do: [ :m | m tumorSampleBarcode ifNotNil: [ :s | counts at: s put: (counts at: s ifAbsent: [0]) + 1 ] ].
	^ (counts associations sort: [ :a :b | a value > b value ]) copyFrom: 1 to: (anInteger min: counts size)

]

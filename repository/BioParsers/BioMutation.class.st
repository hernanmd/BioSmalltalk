Class {
	#name : 'BioMutation',
	#superclass : 'Object',
	#instVars : [
		'hugoSymbol',
		'entrezGeneId',
		'chromosome',
		'startPosition',
		'endPosition',
		'strand',
		'variantClassification',
		'variantType',
		'referenceAllele',
		'tumorSeqAllele1',
		'tumorSeqAllele2',
		'tumorSampleBarcode',
		'matchedNormSampleBarcode',
		'tumorAlleleFreq',
		'totalDepth',
		'aminoAcidChange',
		'cdnaChange',
		'proteinPosition',
		'gene',
		'transcript',
		'verificationStatus',
		'filter',
		'customFields',
		'sample',
		'mutationType',
		'ontologyTerms',
		'data'
	],
	#category : 'BioParsers-MAF',
	#package : 'BioParsers',
	#tag : 'MAF'
}

{ #category : 'adding' }
BioMutation >> addOntologyTerm: aTerm [
	ontologyTerms add: aTerm

]

{ #category : 'accessing' }
BioMutation >> aminoAcidChange [
	^ aminoAcidChange

]

{ #category : 'accessing' }
BioMutation >> aminoAcidChange: aString [
	aminoAcidChange := aString

]

{ #category : 'accessing' }
BioMutation >> cdnaChange [
	^ cdnaChange

]

{ #category : 'accessing' }
BioMutation >> cdnaChange: aString [
	cdnaChange := aString

]

{ #category : 'accessing' }
BioMutation >> chromosome [
	^ chromosome

]

{ #category : 'accessing' }
BioMutation >> chromosome: aString [
	chromosome := aString

]

{ #category : 'accessing' }
BioMutation >> contextTrinucleotide [
	"Return the pyrimidine context for mutation signature analysis"

	| ref alt |
	ref := referenceAllele ifNil: [ ^ nil ].
	alt := self variantAllele ifNil: [ ^ nil ].
	ref size > 1 ifTrue: [ ^ 'Indel' ].
	alt size > 1 ifTrue: [ ^ 'Indel' ].
	^ ref , '>' , alt
]

{ #category : 'accessing' }
BioMutation >> customFieldAt: aKey [
	^ customFields at: aKey ifAbsent: [ nil ]

]

{ #category : 'accessing' }
BioMutation >> customFieldAt: aKey put: aValue [
	customFields at: aKey put: aValue

]

{ #category : 'accessing' }
BioMutation >> customFields [
	^ customFields

]

{ #category : 'accessing' }
BioMutation >> data [
	^ data

]

{ #category : 'accessing' }
BioMutation >> dataAt: aKey [
	^ data at: aKey ifAbsent: [ nil ]

]

{ #category : 'accessing' }
BioMutation >> dataAt: aKey put: aValue [
	data at: aKey put: aValue

]

{ #category : 'accessing' }
BioMutation >> endPosition [
	^ endPosition

]

{ #category : 'accessing' }
BioMutation >> endPosition: aNumber [
	endPosition := aNumber

]

{ #category : 'accessing' }
BioMutation >> entrezGeneId [
	^ entrezGeneId

]

{ #category : 'accessing' }
BioMutation >> entrezGeneId: aNumber [
	entrezGeneId := aNumber

]

{ #category : 'accessing' }
BioMutation >> filter [
	^ filter

]

{ #category : 'accessing' }
BioMutation >> filter: aString [
	filter := aString

]

{ #category : 'accessing' }
BioMutation >> gene [
	^ gene

]

{ #category : 'accessing' }
BioMutation >> gene: aString [
	gene := aString

]

{ #category : 'accessing' }
BioMutation >> hugoSymbol [
	^ hugoSymbol

]

{ #category : 'accessing' }
BioMutation >> hugoSymbol: aString [
	hugoSymbol := aString

]

{ #category : 'initialization' }
BioMutation >> initialize [
	super initialize.
	customFields := Dictionary new.
	ontologyTerms := OrderedCollection new.
	data := Dictionary new
]

{ #category : 'testing' }
BioMutation >> isDeletion [
	^ variantType = 'DEL'

]

{ #category : 'testing' }
BioMutation >> isDriver [
	^ self isNonsynonymous and: [ self isSNP or: [ self isIndel ] ]

]

{ #category : 'testing' }
BioMutation >> isFrameshift [
	^ variantClassification beginsWith: 'Frame_Shift'

]

{ #category : 'testing' }
BioMutation >> isIndel [
	^ self isInsertion or: [ self isDeletion ]

]

{ #category : 'testing' }
BioMutation >> isInsertion [
	^ variantType = 'INS'

]

{ #category : 'testing' }
BioMutation >> isMissense [
	^ variantClassification = 'Missense_Mutation'

]

{ #category : 'testing' }
BioMutation >> isNonsense [
	^ variantClassification = 'Nonsense_Mutation'

]

{ #category : 'testing' }
BioMutation >> isNonsynonymous [
	^ self isMissense or: [ self isNonsense or: [ self isFrameshift or: [ self isSpliceSite ] ] ]

]

{ #category : 'testing' }
BioMutation >> isSNP [
	^ variantType = 'SNP'

]

{ #category : 'testing' }
BioMutation >> isSpliceSite [
	^ variantClassification = 'Splice_Site'

]

{ #category : 'testing' }
BioMutation >> isSynonymous [
	^ variantClassification = 'Silent'

]

{ #category : 'accessing' }
BioMutation >> mafField: fieldName ifAbsent: aBlock [
	fieldName = 'Hugo_Symbol' ifTrue: [ ^ hugoSymbol ifNil: aBlock ].
	fieldName = 'Entrez_Gene_Id' ifTrue: [ ^ entrezGeneId ifNil: aBlock ifNotNil: [ :v | v printString ] ].
	fieldName = 'Chromosome' ifTrue: [ ^ chromosome ifNil: aBlock ].
	fieldName = 'Start_Position' ifTrue: [ ^ startPosition ifNil: aBlock ifNotNil: [ :v | v printString ] ].
	fieldName = 'End_Position' ifTrue: [ ^ endPosition ifNil: aBlock ifNotNil: [ :v | v printString ] ].
	fieldName = 'Strand' ifTrue: [ ^ strand ifNil: aBlock ].
	fieldName = 'Variant_Classification' ifTrue: [ ^ variantClassification ifNil: aBlock ].
	fieldName = 'Variant_Type' ifTrue: [ ^ variantType ifNil: aBlock ].
	fieldName = 'Reference_Allele' ifTrue: [ ^ referenceAllele ifNil: aBlock ].
	fieldName = 'Tumor_Seq_Allele1' ifTrue: [ ^ tumorSeqAllele1 ifNil: aBlock ].
	fieldName = 'Tumor_Seq_Allele2' ifTrue: [ ^ tumorSeqAllele2 ifNil: aBlock ].
	fieldName = 'Tumor_Sample_Barcode' ifTrue: [ ^ tumorSampleBarcode ifNil: aBlock ].
	fieldName = 'Matched_Norm_Sample_Barcode' ifTrue: [ ^ matchedNormSampleBarcode ifNil: aBlock ].
	fieldName = 'Verification_Status' ifTrue: [ ^ verificationStatus ifNil: aBlock ].
	fieldName = 'Validation_Status' ifTrue: [ ^ verificationStatus ifNil: aBlock ].
	fieldName = 'Amino_Acid_Change' ifTrue: [ ^ aminoAcidChange ifNil: aBlock ].
	fieldName = 'Gene' ifTrue: [ ^ gene ifNil: aBlock ].
	fieldName = 'Transcript_ID' ifTrue: [ ^ transcript ifNil: aBlock ].
	fieldName = 'Filter' ifTrue: [ ^ filter ifNil: aBlock ].
	fieldName = 'Mutation_Status' ifTrue: [ ^ mutationType ifNil: aBlock ].
	^ customFields at: fieldName ifAbsent: aBlock
]

{ #category : 'accessing' }
BioMutation >> matchedNormSampleBarcode [
	^ matchedNormSampleBarcode

]

{ #category : 'accessing' }
BioMutation >> matchedNormSampleBarcode: aString [
	matchedNormSampleBarcode := aString

]

{ #category : 'accessing' }
BioMutation >> mutationSpectrumChannel [
	"Return one of 6 channels: C>A, C>G, C>T, T>A, T>C, T>G"

	| ref alt complement |
	ref := referenceAllele ifNil: [ ^ nil ].
	alt := self variantAllele ifNil: [ ^ nil ].
	(ref size > 1 or: [ alt size > 1 ]) ifTrue: [ ^ nil ].
	"Convert to pyrimidine context"
	({ $A. $G } includes: ref first) ifTrue: [
			complement := Dictionary new
				              at: $A put: $T;
				              at: $G put: $C;
				              yourself.
			ref := (complement at: ref first) asString.
			alt := (complement at: alt first ifAbsent: [ alt first ]) asString ].
	^ ref , '>' , alt
]

{ #category : 'accessing' }
BioMutation >> mutationType [
	^ mutationType

]

{ #category : 'accessing' }
BioMutation >> mutationType: aString [
	mutationType := aString

]

{ #category : 'accessing' }
BioMutation >> ontologyTerms [
	^ ontologyTerms

]

{ #category : 'printing' }
BioMutation >> printOn: aStream [
	aStream nextPutAll: self class name.
	aStream nextPut: $(.
	hugoSymbol ifNotNil: [ aStream nextPutAll: hugoSymbol; space ].
	chromosome ifNotNil: [ aStream nextPutAll: chromosome; nextPut: $: ].
	startPosition ifNotNil: [ startPosition printOn: aStream ].
	variantType ifNotNil: [ aStream space; nextPutAll: variantType ].
	variantClassification ifNotNil: [ aStream space; nextPutAll: variantClassification ].
	aStream nextPut: $)

]

{ #category : 'accessing' }
BioMutation >> proteinPosition [
	^ proteinPosition

]

{ #category : 'accessing' }
BioMutation >> proteinPosition: aString [
	proteinPosition := aString

]

{ #category : 'accessing' }
BioMutation >> referenceAllele [
	^ referenceAllele

]

{ #category : 'accessing' }
BioMutation >> referenceAllele: aString [
	referenceAllele := aString

]

{ #category : 'accessing' }
BioMutation >> sample [
	^ sample

]

{ #category : 'accessing' }
BioMutation >> sample: aBioSample [
	sample := aBioSample

]

{ #category : 'accessing' }
BioMutation >> startPosition [
	^ startPosition

]

{ #category : 'accessing' }
BioMutation >> startPosition: aNumber [
	startPosition := aNumber

]

{ #category : 'accessing' }
BioMutation >> strand [
	^ strand

]

{ #category : 'accessing' }
BioMutation >> strand: aString [
	strand := aString

]

{ #category : 'accessing' }
BioMutation >> totalDepth [
	^ totalDepth

]

{ #category : 'accessing' }
BioMutation >> totalDepth: aNumber [
	totalDepth := aNumber

]

{ #category : 'accessing' }
BioMutation >> transcript [
	^ transcript

]

{ #category : 'accessing' }
BioMutation >> transcript: aString [
	transcript := aString

]

{ #category : 'accessing' }
BioMutation >> tumorAlleleFreq [
	^ tumorAlleleFreq

]

{ #category : 'accessing' }
BioMutation >> tumorAlleleFreq: aNumber [
	tumorAlleleFreq := aNumber

]

{ #category : 'accessing' }
BioMutation >> tumorSampleBarcode [
	^ tumorSampleBarcode

]

{ #category : 'accessing' }
BioMutation >> tumorSampleBarcode: aString [
	tumorSampleBarcode := aString

]

{ #category : 'accessing' }
BioMutation >> tumorSeqAllele1 [
	^ tumorSeqAllele1

]

{ #category : 'accessing' }
BioMutation >> tumorSeqAllele1: aString [
	tumorSeqAllele1 := aString

]

{ #category : 'accessing' }
BioMutation >> tumorSeqAllele2 [
	^ tumorSeqAllele2

]

{ #category : 'accessing' }
BioMutation >> tumorSeqAllele2: aString [
	tumorSeqAllele2 := aString

]

{ #category : 'accessing' }
BioMutation >> variantAllele [
	"Return the variant allele (tumor allele 2 if different from reference)"

	tumorSeqAllele2 = referenceAllele
		ifTrue: [ ^ tumorSeqAllele1 ]
		ifFalse: [ ^ tumorSeqAllele2 ]
]

{ #category : 'accessing' }
BioMutation >> variantClassification [
	^ variantClassification

]

{ #category : 'accessing' }
BioMutation >> variantClassification: aString [
	variantClassification := aString

]

{ #category : 'accessing' }
BioMutation >> variantType [
	^ variantType

]

{ #category : 'accessing' }
BioMutation >> variantType: aString [
	variantType := aString
]

{ #category : 'accessing' }
BioMutation >> verificationStatus [ ^ verificationStatus
]

{ #category : 'accessing' }
BioMutation >> verificationStatus: aString [ verificationStatus := aString
]

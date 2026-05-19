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

{ #category : 'as yet unclassified' }
BioMutation >> addOntologyTerm: aTerm [
	ontologyTerms add: aTerm

]

{ #category : 'as yet unclassified' }
BioMutation >> aminoAcidChange [
	^ aminoAcidChange

]

{ #category : 'as yet unclassified' }
BioMutation >> aminoAcidChange: aString [
	aminoAcidChange := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> cdnaChange [
	^ cdnaChange

]

{ #category : 'as yet unclassified' }
BioMutation >> cdnaChange: aString [
	cdnaChange := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> chromosome [
	^ chromosome

]

{ #category : 'as yet unclassified' }
BioMutation >> chromosome: aString [
	chromosome := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> contextTrinucleotide [
	"Return the pyrimidine context for mutation signature analysis"
	| ref alt |
	ref := referenceAllele ifNil: [ ^ nil ].
	alt := self variantAllele ifNil: [ ^ nil ].
	ref size > 1 ifTrue: [ ^ 'Indel' ].
	alt size > 1 ifTrue: [ ^ 'Indel' ].
	^ ref , '>' , alt

]

{ #category : 'as yet unclassified' }
BioMutation >> customFieldAt: aKey [
	^ customFields at: aKey ifAbsent: [ nil ]

]

{ #category : 'as yet unclassified' }
BioMutation >> customFieldAt: aKey put: aValue [
	customFields at: aKey put: aValue

]

{ #category : 'as yet unclassified' }
BioMutation >> customFields [
	^ customFields

]

{ #category : 'as yet unclassified' }
BioMutation >> data [
	^ data

]

{ #category : 'as yet unclassified' }
BioMutation >> dataAt: aKey [
	^ data at: aKey ifAbsent: [ nil ]

]

{ #category : 'as yet unclassified' }
BioMutation >> dataAt: aKey put: aValue [
	data at: aKey put: aValue

]

{ #category : 'as yet unclassified' }
BioMutation >> endPosition [
	^ endPosition

]

{ #category : 'as yet unclassified' }
BioMutation >> endPosition: aNumber [
	endPosition := aNumber

]

{ #category : 'as yet unclassified' }
BioMutation >> entrezGeneId [
	^ entrezGeneId

]

{ #category : 'as yet unclassified' }
BioMutation >> entrezGeneId: aNumber [
	entrezGeneId := aNumber

]

{ #category : 'as yet unclassified' }
BioMutation >> filter [
	^ filter

]

{ #category : 'as yet unclassified' }
BioMutation >> filter: aString [
	filter := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> gene [
	^ gene

]

{ #category : 'as yet unclassified' }
BioMutation >> gene: aString [
	gene := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> hugoSymbol [
	^ hugoSymbol

]

{ #category : 'as yet unclassified' }
BioMutation >> hugoSymbol: aString [
	hugoSymbol := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> initialize [
	super initialize.
	customFields := Dictionary new.
	ontologyTerms := OrderedCollection new.
	data := Dictionary new
]

{ #category : 'as yet unclassified' }
BioMutation >> isDeletion [
	^ variantType = 'DEL'

]

{ #category : 'as yet unclassified' }
BioMutation >> isDriver [
	^ self isNonsynonymous and: [ self isSNP or: [ self isIndel ] ]

]

{ #category : 'as yet unclassified' }
BioMutation >> isFrameshift [
	^ variantClassification beginsWith: 'Frame_Shift'

]

{ #category : 'as yet unclassified' }
BioMutation >> isIndel [
	^ self isInsertion or: [ self isDeletion ]

]

{ #category : 'as yet unclassified' }
BioMutation >> isInsertion [
	^ variantType = 'INS'

]

{ #category : 'as yet unclassified' }
BioMutation >> isMissense [
	^ variantClassification = 'Missense_Mutation'

]

{ #category : 'as yet unclassified' }
BioMutation >> isNonsense [
	^ variantClassification = 'Nonsense_Mutation'

]

{ #category : 'as yet unclassified' }
BioMutation >> isNonsynonymous [
	^ self isMissense or: [ self isNonsense or: [ self isFrameshift or: [ self isSpliceSite ] ] ]

]

{ #category : 'as yet unclassified' }
BioMutation >> isSNP [
	^ variantType = 'SNP'

]

{ #category : 'as yet unclassified' }
BioMutation >> isSpliceSite [
	^ variantClassification = 'Splice_Site'

]

{ #category : 'as yet unclassified' }
BioMutation >> isSynonymous [
	^ variantClassification = 'Silent'

]

{ #category : 'as yet unclassified' }
BioMutation >> mafField: fieldName ifAbsent: aBlock [
	fieldName = 'Hugo_Symbol' ifTrue: [ ^ hugoSymbol ifNil: aBlock ].
	fieldName = 'Entrez_Gene_Id' ifTrue: [ ^ entrezGeneId ifNil: aBlock ifNotNil: [ :v | v printString ] ].
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
	fieldName = 'Amino_Acid_Change' ifTrue: [ ^ aminoAcidChange ifNil: aBlock ].
	^ customFields at: fieldName ifAbsent: aBlock
]

{ #category : 'as yet unclassified' }
BioMutation >> matchedNormSampleBarcode [
	^ matchedNormSampleBarcode

]

{ #category : 'as yet unclassified' }
BioMutation >> matchedNormSampleBarcode: aString [
	matchedNormSampleBarcode := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> mutationSpectrumChannel [
	"Return one of 6 channels: C>A, C>G, C>T, T>A, T>C, T>G"
	| ref alt complement |
	ref := referenceAllele ifNil: [ ^ nil ].
	alt := self variantAllele ifNil: [ ^ nil ].
	(ref size > 1 or: [ alt size > 1 ]) ifTrue: [ ^ nil ].
	"Convert to pyrimidine context"
	({$A . $G} includes: ref first) ifTrue: [
		complement := Dictionary new at: $A put: $T; at: $G put: $C; yourself.
		ref := (complement at: ref first) asString.
		alt := (complement at: alt first ifAbsent: [ alt first ]) asString ].
	^ ref , '>' , alt

]

{ #category : 'as yet unclassified' }
BioMutation >> mutationType [
	^ mutationType

]

{ #category : 'as yet unclassified' }
BioMutation >> mutationType: aString [
	mutationType := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> ontologyTerms [
	^ ontologyTerms

]

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
BioMutation >> proteinPosition [
	^ proteinPosition

]

{ #category : 'as yet unclassified' }
BioMutation >> proteinPosition: aString [
	proteinPosition := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> referenceAllele [
	^ referenceAllele

]

{ #category : 'as yet unclassified' }
BioMutation >> referenceAllele: aString [
	referenceAllele := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> sample [
	^ sample

]

{ #category : 'as yet unclassified' }
BioMutation >> sample: aBioSample [
	sample := aBioSample

]

{ #category : 'as yet unclassified' }
BioMutation >> startPosition [
	^ startPosition

]

{ #category : 'as yet unclassified' }
BioMutation >> startPosition: aNumber [
	startPosition := aNumber

]

{ #category : 'as yet unclassified' }
BioMutation >> strand [
	^ strand

]

{ #category : 'as yet unclassified' }
BioMutation >> strand: aString [
	strand := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> totalDepth [
	^ totalDepth

]

{ #category : 'as yet unclassified' }
BioMutation >> totalDepth: aNumber [
	totalDepth := aNumber

]

{ #category : 'as yet unclassified' }
BioMutation >> transcript [
	^ transcript

]

{ #category : 'as yet unclassified' }
BioMutation >> transcript: aString [
	transcript := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> tumorAlleleFreq [
	^ tumorAlleleFreq

]

{ #category : 'as yet unclassified' }
BioMutation >> tumorAlleleFreq: aNumber [
	tumorAlleleFreq := aNumber

]

{ #category : 'as yet unclassified' }
BioMutation >> tumorSampleBarcode [
	^ tumorSampleBarcode

]

{ #category : 'as yet unclassified' }
BioMutation >> tumorSampleBarcode: aString [
	tumorSampleBarcode := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> tumorSeqAllele1 [
	^ tumorSeqAllele1

]

{ #category : 'as yet unclassified' }
BioMutation >> tumorSeqAllele1: aString [
	tumorSeqAllele1 := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> tumorSeqAllele2 [
	^ tumorSeqAllele2

]

{ #category : 'as yet unclassified' }
BioMutation >> tumorSeqAllele2: aString [
	tumorSeqAllele2 := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> validationStatus [
	^ validationStatus

]

{ #category : 'as yet unclassified' }
BioMutation >> validationStatus: aString [
	validationStatus := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> variantAllele [
	"Return the variant allele (tumor allele 2 if different from reference)"
	tumorSeqAllele2 = referenceAllele
		ifTrue: [ ^ tumorSeqAllele1 ]
		ifFalse: [ ^ tumorSeqAllele2 ]

]

{ #category : 'as yet unclassified' }
BioMutation >> variantClassification [
	^ variantClassification

]

{ #category : 'as yet unclassified' }
BioMutation >> variantClassification: aString [
	variantClassification := aString

]

{ #category : 'as yet unclassified' }
BioMutation >> variantType [
	^ variantType

]

{ #category : 'as yet unclassified' }
BioMutation >> variantType: aString [
	variantType := aString
]

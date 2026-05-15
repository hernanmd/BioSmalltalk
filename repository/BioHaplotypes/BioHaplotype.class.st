"
I represent a haplotype: an ordered collection of alleles across loci/variants.

I am immutable by default. Use copyAndAt:put: to create modified copies.

I support dynamic allele access via doesNotUndernderstand: - send any rsID selector
(e.g., haplotype rs12345) to resolve the allele at that variant.

Example:
| v1 v2 h |
v1 := BioVariant position: 14370 referenceAllele: 'G' alternateAlleles: #(A) rsID: 'rs12345' chromosome: '20'.
v2 := BioVariant position: 17330 referenceAllele: 'T' alternateAlleles: #(C) rsID: 'rs67890' chromosome: '20'.
h := BioHaplotype withAlleles: #(G T) atVariants: {v1 . v2}.
h alleles. ""=> #('G' 'T')""
h rs12345. ""=> 'G'""
h hammingDistanceTo: anotherHaplotype.
"
Class {
	#name : 'BioHaplotype',
	#superclass : 'Object',
	#instVars : [
		'alleles',
		'variants',
		'identifier',
		'chromosome',
		'metadata',
		'frequency'
	],
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioHaplotype class >> emptyAtVariants: variantsArray [

	^ self new
		  alleles: (Array new: variantsArray size withAll: '');
		  variants: variantsArray;
		  yourself
]

{ #category : 'examples' }
BioHaplotype class >> exampleMultiAllelic [

	| v |
	v := BioVariant
		     position: 100
		     referenceAllele: 'A'
		     alternateAlleles: #( 'T' 'G' ).
	^ BioHaplotype withAlleles: #( 'T' ) atVariants: { v }
]

{ #category : 'examples' }
BioHaplotype class >> exampleSimpleHaplotype [

	| v1 v2 |
	v1 := BioVariant
		      position: 14370
		      referenceAllele: 'G'
		      alternateAlleles: #( 'A' )
		      rsID: 'rs12345'
		      chromosome: '20'.
	v2 := BioVariant
		      position: 17330
		      referenceAllele: 'T'
		      alternateAlleles: #( 'C' )
		      rsID: 'rs67890'
		      chromosome: '20'.
	^ BioHaplotype withAlleles: #( 'G' 'T' ) atVariants: {
			  v1.
			  v2 }
]

{ #category : 'instance creation' }
BioHaplotype class >> withAlleles: anArray [

	^ self new
		  alleles: anArray;
		  yourself
]

{ #category : 'instance creation' }
BioHaplotype class >> withAlleles: anArray atVariants: variantsArray [

	^ self new
		  alleles: anArray;
		  variants: variantsArray;
		  yourself
]

{ #category : 'instance creation' }
BioHaplotype class >> withAlleles: anArray atVariants: variantsArray identifier: aString [

	^ self new
		  alleles: anArray;
		  variants: variantsArray;
		  identifier: aString;
		  yourself
]

{ #category : 'instance creation' }
BioHaplotype class >> withAlleles: anArray identifier: aString [

	^ self new
		  alleles: anArray;
		  identifier: aString;
		  yourself
]

{ #category : 'comparing' }
BioHaplotype >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ alleles = anObject alleles
]

{ #category : 'accessing' }
BioHaplotype >> alleleAtPosition: anInteger [

	| idx |
	idx := self variants findFirst: [ :v | v position = anInteger ].
	idx = 0 
		ifTrue: [ self error: 'No variant at position' , anInteger printString , 'found' ].
	^ self alleles at: idx
]

{ #category : 'accessing' }
BioHaplotype >> alleleAtRsID: aString [

	| idx |
	idx := self variants findFirst: [ :v | v rsID = aString ].
	idx = 0 ifTrue: [
		self error: 'No variant with rsID ' , aString , ' found' ].
	^ self alleles at: idx
]

{ #category : 'accessing' }
BioHaplotype >> alleleAtVariant: aVariant [

	| idx |
	idx := self variants indexOf: aVariant.
	idx = 0 
		ifTrue: [ self error: 'Variant not found in this haplotype' ].
	^ self alleles at: idx
]

{ #category : 'accessing' }
BioHaplotype >> alleles [

	^ alleles ifNil: [ alleles := Array new ]
]

{ #category : 'accessing' }
BioHaplotype >> alleles: anArray [

	alleles := anArray isArray
		           ifTrue: [ anArray ]
		           ifFalse: [ anArray asArray ]
]

{ #category : 'converting' }
BioHaplotype >> asAlleleString [

	^ String streamContents: [ :s |
			  self alleles
				  do: [ :a | s nextPutAll: a ]
				  separatedBy: [ s nextPut: $- ] ]
]

{ #category : 'transforming' }
BioHaplotype >> asPhasedGenotype [

	^ BioPhasedGenotype new
		  haplotype1: self;
		  yourself
]

{ #category : 'transforming' }
BioHaplotype >> asPhasedGenotypeWith: anotherHaplotype [

	^ BioPhasedGenotype withHaplotype1: self haplotype2: anotherHaplotype
]

{ #category : 'accessing' }
BioHaplotype >> at: anIndex [

	^ self alleles at: anIndex
]

{ #category : 'accessing' }
BioHaplotype >> chromosome [

	^ chromosome
]

{ #category : 'accessing' }
BioHaplotype >> chromosome: aString [

	chromosome := aString
]

{ #category : 'enumerating' }
BioHaplotype >> collect: aBlock [

	^ self alleles collect: aBlock
]

{ #category : 'copy' }
BioHaplotype >> copyAndAt: anIndex put: anAllele [

	^ self copy
		  alleles: (self alleles copyReplaceAt: anIndex withObject: anAllele);
		  yourself
]

{ #category : 'copying' }
BioHaplotype >> deepCopy [

	^ self class new
		  alleles: alleles copy;
		  variants: variants copy;
		  identifier: identifier;
		  chromosome: chromosome;
		  frequency: frequency;
		  yourself
]

{ #category : 'enumerating' }
BioHaplotype >> do: aBlock [

	self alleles do: aBlock
]

{ #category : 'reflective operations' }
BioHaplotype >> doesNotUnderstand: aMessage [
	"Dynamic allele accessor: resolve rsID-like selectors."

	| sel |
	sel := aMessage selector asString.
	(sel beginsWith: 'rs') ifTrue: [ ^ self alleleAtRsID: sel ].
	^ super doesNotUnderstand: aMessage
]

{ #category : 'accessing' }
BioHaplotype >> frequency [

	^ frequency
]

{ #category : 'accessing' }
BioHaplotype >> frequency: aNumber [

	frequency := aNumber
]

{ #category : 'metrics' }
BioHaplotype >> frequencyIn: aPopulation [

	^ (aPopulation count: [ :h | h = self ]) / aPopulation size asFloat
]

{ #category : 'gt-views' }
BioHaplotype >> gtAllelesFor: aView [

	<gtView>
	^ aView columnedList
		  title: 'Alleles';
		  priority: 1;
		  items: [ self alleles withIndexCollect: [ :a :i | i -> a ] ];
		  column: 'Index' text: [ :assoc | assoc key ];
		  column: 'Allele' text: [ :assoc | assoc value ];
		  column: 'Variant'
		  text: [ :assoc | (self variants at: assoc key) name ];
		  yourself
]

{ #category : 'gt-views' }
BioHaplotype >> gtSummaryFor: aView [

	<gtView>
	^ aView text
		  title: 'Summary';
		  priority: 0;
		  text: [
				  String streamContents: [ :s |
							  s
								  nextPutAll: 'Haplotype: ';
								  nextPutAll: (identifier ifNil: [ 'unnamed' ]);
								  cr.
							  s
								  nextPutAll: 'Loci: ';
								  nextPutAll: self size printString;
								  cr.
							  s
								  nextPutAll: 'Alleles: ';
								  nextPutAll: self asAlleleString ] ];
		  yourself
]

{ #category : 'gt-views' }
BioHaplotype >> gtVariantsFor: aView [

	<gtView>
	^ aView columnedList
		  title: 'Variants';
		  priority: 2;
		  items: [ self variants withIndexCollect: [ :v :i | i -> v ] ];
		  column: 'Index' text: [ :assoc | assoc key ];
		  column: 'Name' text: [ :assoc | assoc value name ];
		  column: 'Position' text: [ :assoc | assoc value position ];
		  column: 'REF' text: [ :assoc | assoc value referenceAllele ];
		  column: 'ALT'
		  text: [ :assoc | assoc value alternateAlleles asString ];
		  yourself
]

{ #category : 'metrics' }
BioHaplotype >> hammingDistanceTo: aHaplotype [
	"Compute Hamming distance using String>>#hammingDistanceTo:. 
	Alleles are joined with separator to handle multi-char alleles correctly."

	| myStr otherStr |
	self size = aHaplotype size ifFalse: [
			self error: 'Cannot compute Hamming distance between haplotypes of different sizes' ].
	myStr := String streamContents: [ :s |
			         self alleles
				         do: [ :a | s nextPutAll: a ]
				         separatedBy: [ s nextPut: $- ] ].
	otherStr := String streamContents: [ :s |
			            aHaplotype alleles
				            do: [ :a | s nextPutAll: a ]
				            separatedBy: [ s nextPut: $- ] ].
	^ myStr hammingDistanceTo: otherStr
]

{ #category : 'comparing' }
BioHaplotype >> hash [

	^ alleles hash
]

{ #category : 'accessing' }
BioHaplotype >> identifier [

	^ identifier
]

{ #category : 'accessing' }
BioHaplotype >> identifier: aString [

	identifier := aString
]

{ #category : 'testing' }
BioHaplotype >> isImmutable [

	^ true
]

{ #category : 'metrics' }
BioHaplotype >> matches: aHaplotype atLoci: aCollection [

	^ aCollection allSatisfy: [ :idx |
		  (self at: idx) = (aHaplotype at: idx) ]
]

{ #category : 'metrics' }
BioHaplotype >> matches: aHaplotype atLocus: anIndex [

	^ (self at: anIndex) = (aHaplotype at: anIndex)
]

{ #category : 'accessing' }
BioHaplotype >> metadata [

	^ metadata ifNil: [ metadata := Dictionary new ]
]

{ #category : 'accessing' }
BioHaplotype >> metadataAt: aKey [

	^ self metadata at: aKey
]

{ #category : 'accessing' }
BioHaplotype >> metadataAt: aKey put: aValue [

	^ self metadata at: aKey put: aValue
]

{ #category : 'copying' }
BioHaplotype >> postCopy [

	super postCopy.
	metadata := metadata copy
]

{ #category : 'printing' }
BioHaplotype >> printOn: aStream [

	aStream nextPutAll: self class name.
	identifier ifNotNil: [ :id |
			aStream
				nextPutAll: '(';
				nextPutAll: id;
				nextPutAll: ')' ].
	aStream nextPutAll: '['.
	self alleles
		do: [ :a | aStream nextPutAll: a ]
		separatedBy: [ aStream nextPut: $| ].
	aStream nextPutAll: ']'
]

{ #category : 'enumerating' }
BioHaplotype >> reject: aBlock [

	^ self select: [ :each | (aBlock value: each) not ]
]

{ #category : 'enumerating' }
BioHaplotype >> select: aBlock [

	| selectedAlleles selectedVariants |
	selectedAlleles := OrderedCollection new.
	selectedVariants := OrderedCollection new.
	1 to: self size do: [ :i |
			(aBlock value: (self alleles at: i)) ifTrue: [
					selectedAlleles add: (self alleles at: i).
					selectedVariants add: (self variants at: i) ] ].
	^ self class
		  withAlleles: selectedAlleles asArray
		  atVariants: selectedVariants asArray
]

{ #category : 'accessing' }
BioHaplotype >> size [

	^ self alleles size
]

{ #category : 'storing' }
BioHaplotype >> storeOn: aStream [

	aStream
		nextPutAll: '(';
		nextPutAll: self class name;
		nextPutAll: ' withAlleles: ';
		store: alleles;
		nextPutAll: ' atVariants: ';
		store: variants.
	identifier ifNotNil: [
			aStream
				nextPutAll: ' identifier: ';
				store: identifier ].
	aStream nextPutAll: ')'
]

{ #category : 'transforming' }
BioHaplotype >> subsetVariants: aCollectionOfVariants [

	| indices newAlleles newVariants |
	indices := aCollectionOfVariants collect: [ :v |
		           self variants indexOf: v ].
	newAlleles := indices collect: [ :i | self alleles at: i ].
	newVariants := indices collect: [ :i | self variants at: i ].
	^ self class withAlleles: newAlleles atVariants: newVariants
]

{ #category : 'accessing' }
BioHaplotype >> variantAt: anIndex [

	^ self variants at: anIndex
]

{ #category : 'accessing' }
BioHaplotype >> variants [

	^ variants ifNil: [ variants := Array new ]
]

{ #category : 'accessing' }
BioHaplotype >> variants: anArray [

	variants := anArray isArray
		            ifTrue: [ anArray ]
		            ifFalse: [ anArray asArray ]
]

{ #category : 'transforming' }
BioHaplotype >> withAncestry: aString [

	^ self copy
		  metadataAt: #ancestry put: aString;
		  yourself
]

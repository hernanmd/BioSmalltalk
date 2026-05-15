"
I am a specialized collection of BioHaplotype instances with bulk operations.

I support standard collection protocol (do:, select:, reject:, collect:)
plus domain-specific operations like countAlleles, haplotypeDiversity,
pairwiseDistances, and groupedByVariant:.

I announce changes: adding/removing haplotypes fires BioHaplotypeAdded/BioHaplotypeRemoved.

Example:
| pops |
pops := BioHaplotypes exampleSimple.
pops haplotypeDiversity.
pops countAlleles.
pops asHaplotypeMatrix.
"
Class {
	#name : 'BioHaplotypes',
	#superclass : 'Object',
	#instVars : [
		'haplotypes',
		'identifier',
		'metadata'
	],
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'examples' }
BioHaplotypes class >> exampleSimple [

	| v1 v2 h1 h2 |
	v1 := BioVariant
		      position: 100
		      referenceAllele: 'A'
		      alternateAlleles: #( 'T' )
		      rsID: 'rs111'
		      chromosome: '1'.
	v2 := BioVariant
		      position: 200
		      referenceAllele: 'C'
		      alternateAlleles: #( 'G' )
		      rsID: 'rs222'
		      chromosome: '1'.
	h1 := BioHaplotype
		      withAlleles: #( 'A' 'C' )
		      atVariants: {
				      v1.
				      v2 }
		      identifier: 'h1'.
	h2 := BioHaplotype
		      withAlleles: #( 'T' 'G' )
		      atVariants: {
				      v1.
				      v2 }
		      identifier: 'h2'.
	^ BioHaplotypes withHaplotypes: {
			  h1.
			  h2 }
]

{ #category : 'instance creation' }
BioHaplotypes class >> withHaplotypes: aCollection [

	^ self new
		  haplotypes: aCollection;
		  yourself
]

{ #category : 'instance creation' }
BioHaplotypes class >> withHaplotypes: aCollection identifier: aString [

	^ self new
		  haplotypes: aCollection;
		  identifier: aString;
		  yourself
]

{ #category : 'adding' }
BioHaplotypes >> add: aHaplotype [

	| result |
	result := self haplotypes add: aHaplotype.
	self announce: (BioHaplotypeAdded haplotype: aHaplotype).
	^ result
]

{ #category : 'adding' }
BioHaplotypes >> addAll: aCollection [

	aCollection do: [ :h | self add: h ].
	^ aCollection
]

{ #category : 'enumerating' }
BioHaplotypes >> allSatisfy: aBlock [

	^ self haplotypes allSatisfy: aBlock
]

{ #category : 'statistics' }
BioHaplotypes >> alleleFrequenciesAtLocus: anIndex [

	| counts total |
	counts := self countAllelesAtLocus: anIndex.
	total := counts sum: [ :c | c ].
	^ counts valuesAndCounts collect: [ :v :c | v -> (c / total asFloat) ]
]

{ #category : 'announcing' }
BioHaplotypes >> announce: anAnnouncement [

	(self metadata at: #announcer ifAbsentPut: [ Announcer new ])
		announce: anAnnouncement
]

{ #category : 'enumerating' }
BioHaplotypes >> anySatisfy: aBlock [

	^ self haplotypes anySatisfy: aBlock
]

{ #category : 'converting' }
BioHaplotypes >> asHaplotypeMatrix [

	| matrix rows cols |
	self isEmpty ifTrue: [ ^ BioHaplotypeMatrix new ].
	rows := self size.
	cols := self haplotypes first size.
	matrix := BioHaplotypeMatrix rows: rows cols: cols.
	1 to: rows do: [ :i |
			1 to: cols do: [ :j |
			matrix at: i at: j put: ((self haplotypes at: i) at: j) ].
			matrix haplotypeNames: (self haplotypes collect: [ :h |
					 h identifier ifNil: [ 'H' , i printString ] ]).
			matrix variantNames:
				(self haplotypes first variants collect: [ :v | v name ]) ].
	^ matrix
]

{ #category : 'enumerating' }
BioHaplotypes >> collect: aBlock [

	^ self haplotypes collect: aBlock
]

{ #category : 'statistics' }
BioHaplotypes >> countAlleles [

	^ self countAllelesAtLoci: (1 to: self haplotypes first size)
]

{ #category : 'statistics' }
BioHaplotypes >> countAllelesAtLoci: aCollection [

	^ aCollection collect: [ :i | self countAllelesAtLocus: i ]
]

{ #category : 'statistics' }
BioHaplotypes >> countAllelesAtLocus: anIndex [

	| counts |
	counts := Bag new.
	self haplotypes do: [ :h | counts add: (h at: anIndex) ].
	^ counts
]

{ #category : 'enumerating' }
BioHaplotypes >> detect: aBlock [

	^ self haplotypes detect: aBlock
]

{ #category : 'enumerating' }
BioHaplotypes >> detect: aBlock ifNone: exceptionBlock [

	^ self haplotypes detect: aBlock ifNone: exceptionBlock
]

{ #category : 'enumerating' }
BioHaplotypes >> do: aBlock [

	^ self haplotypes do: aBlock
]

{ #category : 'grouping' }
BioHaplotypes >> groupedByRsID: aString [

	| idx groups |
	idx := self haplotypes first variants findFirst: [ :v |
		       v rsID = aString ].
	idx = 0 ifTrue: [ self error: 'No variant with rsID ' , aString , 'found' ].
	groups := Dictionary new.
	self haplotypes do: [ :h |
		(groups at: (h at: idx) ifAbsentPut: [ OrderedCollection new ])
			add: h ].
	^ groups
]

{ #category : 'grouping' }
BioHaplotypes >> groupedByVariant: aVariant [

	| idx groups |
	idx := self haplotypes first variants indexOf: aVariant.
	idx = 0 ifTrue: [ self error: 'Variant not found in haplotypes' ].
	groups := Dictionary new.
	self haplotypes do: [ :h |
		(groups at: (h at: idx) ifAbsentPut: [ OrderedCollection new ])
			add: h ].
	^ groups
]

{ #category : 'gt-views' }
BioHaplotypes >> gtDiversityFor: aView [

	<gtView>
	^ aView text
		  title: 'Diversity';
		  priority: 2;
		  text: [
				  String streamContents: [ :s |
							  s
								  nextPutAll: 'Haplotype diversity: ';
								  nextPutAll: self haplotypeDiversity printString;
								  cr.
							  s
								  nextPutAll: 'Unique haplotypes: ';
								  nextPutAll: self uniqueHaplotypes size printString;
								  cr.
							  s
								  nextPutAll: 'Total haplotypes: ';
								  nextPutAll: self size printString ] ];
		  yourself
]

{ #category : 'gt-views' }
BioHaplotypes >> gtHaplotypesFor: aView [

	<gtView>
	^ aView columnedList
		  title: 'Haplotypes';
		  priority: 1;
		  items: [ self haplotypes withIndexCollect: [ :h :i | i -> h ] ];
		  column: '#' text: [ :assoc | assoc key ];
		  column: 'Identifier'
		  text: [ :assoc |
			  assoc value identifier ifNil: [ assoc key printString ] ];
		  column: 'Alleles' text: [ :assoc | assoc value asAlleleString ];
		  column: 'Loci' text: [ :assoc | assoc value size ];
		  yourself
]

{ #category : 'statistics' }
BioHaplotypes >> haplotypeDiversity [

	| n uniqueCounts total pairs |
	n := self size.
	n < 2 ifTrue: [ ^ 0.0 ].
	uniqueCounts := Bag new.
	self haplotypes do: [ :h | uniqueCounts add: h ].
	total := n * (n - 1) / 2 asFloat.
	pairs := uniqueCounts valuesAndCounts
		         inject: 0
		         into: [ :sum :c | sum + (c * (c - 1) / 2) ].
	^ (1 - (pairs / total)) asFloat
]

{ #category : 'statistics' }
BioHaplotypes >> haplotypeFrequencies [

	| counts n |
	counts := Bag new.
	self haplotypes do: [ :h | counts add: h ].
	n := self size.
	^ counts valuesAndCounts collect: [ :h :c | h -> (c / n asFloat) ]
]

{ #category : 'statistics' }
BioHaplotypes >> haplotypeStrings [

	^ self haplotypes collect: [ :h | h asAlleleString ]
]

{ #category : 'accessing' }
BioHaplotypes >> haplotypes [

	^ haplotypes ifNil: [ haplotypes := OrderedCollection new ]
]

{ #category : 'accessing' }
BioHaplotypes >> haplotypes: aCollection [

	haplotypes := aCollection
]

{ #category : 'accessing' }
BioHaplotypes >> identifier [

	^ identifier
]

{ #category : 'accessing' }
BioHaplotypes >> identifier: aString [

	identifier := aString
]

{ #category : 'enumerating' }
BioHaplotypes >> inject: anObject into: aBlock [

	^ self haplotypes inject: anObject into: aBlock
]

{ #category : 'converting' }
BioHaplotypes >> isEmpty [

	^ self size = 0
]

{ #category : 'accessing' }
BioHaplotypes >> metadata [

	^ metadata ifNil: [ metadata := Dictionary new ]
]

{ #category : 'announcing' }
BioHaplotypes >> on: anAnnouncementClass do: aBlock [

	(self metadata at: #announcer ifAbsentPut: [ Announcer new ])
		on: anAnnouncementClass
		do: aBlock
]

{ #category : 'statistics' }
BioHaplotypes >> pairwiseDistances [
	"Compute pairwise Hamming distances between all haplotypes.
	Uses String>>#hammingDistanceTo: for efficiency."

	| n distances hapStrings |
	n := self size.
	distances := Array2D rows: n columns: n.
	hapStrings := self haplotypes collect: [ :h | h asAlleleString ].
	1 to: n do: [ :i |
			1 to: n do: [ :j |
					distances
						at: i
						at: j
						put: ((hapStrings at: i) hammingDistanceTo: (hapStrings at: j)) ] ].
	^ distances
]

{ #category : 'enumerating' }
BioHaplotypes >> reject: aBlock [

	^ self class withHaplotypes: (self haplotypes reject: aBlock)
]

{ #category : 'removing' }
BioHaplotypes >> remove: aHaplotype [

	| result |
	result := self haplotypes remove: aHaplotype.
	self announce: (BioHaplotypeRemoved haplotype: aHaplotype).
	^ result
]

{ #category : 'removing' }
BioHaplotypes >> remove: aHaplotype ifAbsent: aBlock [

	^ self haplotypes remove: aHaplotype ifAbsent: aBlock
]

{ #category : 'enumerating' }
BioHaplotypes >> select: aBlock [

	^ self class withHaplotypes: (self haplotypes select: aBlock)
]

{ #category : 'accessing' }
BioHaplotypes >> size [

	^ self haplotypes size
]

{ #category : 'statistics' }
BioHaplotypes >> uniqueHaplotypes [

	^ self haplotypes asSet asOrderedCollection
]

{ #category : 'announcing' }
BioHaplotypes >> when: anAnnouncementClass do: aBlock [

	(self metadata at: #announcer ifAbsentPut: [ Announcer new ])
		when: anAnnouncementClass
		do: aBlock
		for: self
]

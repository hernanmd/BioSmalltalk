"
An indexed collection of BioGenomicInterval objects with efficient chromosome-based lookup and set operations. Analogous to Bioconductor GenomicRanges and pybedtools BedTool. Maintains an internal dictionary indexed by chromosome name for O(1) lookups. Operations: onChromosome: (lookup by chr), overlappingIntervals: (overlap query), mergeOverlapping (like bedtools merge), sortByChromosomeAndPosition, select:/reject: (filter), totalLength, chromosomes, overlappingMutations: (MAF integration). Convenience constructors: fromBED: aFilePath, fromBEDString: aString.
"
Class {
	#name : 'BioGenomicIntervalCollection',
	#superclass : 'Object',
	#instVars : [
		'intervals',
		'indexByChromosome',
		'binSize'
	],
	#category : 'BioParsers-BED',
	#package : 'BioParsers',
	#tag : 'BED'
}

{ #category : 'as yet unclassified' }
BioGenomicIntervalCollection class >> fromBED: aFilePath [ ^ BioBEDParser parseFile: aFilePath
]

{ #category : 'as yet unclassified' }
BioGenomicIntervalCollection class >> fromBEDString: aString [ ^ BioBEDParser parseString: aString
]

{ #category : 'adding' }
BioGenomicIntervalCollection >> addAll: aCollection [ aCollection do: [ :i | self addInterval: i ]
]

{ #category : 'adding' }
BioGenomicIntervalCollection >> addInterval: anInterval [ intervals add: anInterval. (indexByChromosome at: anInterval chromosome ifAbsentPut: [ OrderedCollection new ]) add: anInterval. ^ anInterval
]

{ #category : 'enumerating' }
BioGenomicIntervalCollection >> anySatisfy: aBlock [ ^ intervals anySatisfy: aBlock
]

{ #category : 'converting' }
BioGenomicIntervalCollection >> asBEDString [

	^ String cr join: (intervals collect: [ :i | i asBEDString ])
]

{ #category : 'converting' }
BioGenomicIntervalCollection >> asGFF [

	^ String cr join: (intervals collect: [ :i | i asGFF ])
]

{ #category : 'accessing' }
BioGenomicIntervalCollection >> at: index [

	^ intervals at: index
]

{ #category : 'accessing' }
BioGenomicIntervalCollection >> chromosomes [

	^ indexByChromosome keys
]

{ #category : 'enumerating' }
BioGenomicIntervalCollection >> collect: aBlock [

	^ intervals collect: aBlock
]

{ #category : 'enumerating' }
BioGenomicIntervalCollection >> do: aBlock [

	intervals do: aBlock
]

{ #category : 'initialization' }
BioGenomicIntervalCollection >> initialize [

	super initialize.
	intervals := OrderedCollection new.
	indexByChromosome := Dictionary new.
	binSize := 1000
]

{ #category : 'accessing' }
BioGenomicIntervalCollection >> intervals [

	^ intervals
]

{ #category : 'testing' }
BioGenomicIntervalCollection >> isEmpty [

	^ intervals isEmpty
]

{ #category : 'accessing' }
BioGenomicIntervalCollection >> mergeOverlapping [

	| sorted merged current |
	sorted := intervals sorted: [ :a :b |
			          a chromosome < b chromosome or: [
					          a chromosome = b chromosome and: [
						          a start < b start or: [
							          a start = b start and: [ a end < b end ] ] ] ] ].
	merged := OrderedCollection new.
	current := nil.
	sorted do: [ :i |
			current ifNil: [ current := i ] ifNotNil: [
					(current chromosome = i chromosome and: [ current end >= i start ])
						ifTrue: [ current := current union: i ]
						ifFalse: [
								merged add: current.
								current := i ] ] ].
	current ifNotNil: [ merged add: current ].
	^ self class new
		  addAll: merged;
		  yourself
]

{ #category : 'accessing' }
BioGenomicIntervalCollection >> onChromosome: aString [

	^ indexByChromosome at: aString ifAbsent: [ OrderedCollection new ]
]

{ #category : 'accessing' }
BioGenomicIntervalCollection >> overlappingIntervals: anInterval [

	| candidates results |
	candidates := self onChromosome: anInterval chromosome.
	results := candidates select: [ :i | i overlapsInterval: anInterval ].
	^ results asOrderedCollection
]

{ #category : 'accessing' }
BioGenomicIntervalCollection >> overlappingMutations: aBioMutationSet [

	| mutations |
	mutations := OrderedCollection new.
	intervals do: [ :i |
		mutations addAll: (i overlappingMutations: aBioMutationSet) ].
	^ mutations
]

{ #category : 'enumerating' }
BioGenomicIntervalCollection >> reject: aBlock [

	^ self class new
		  addAll: (intervals reject: aBlock);
		  yourself
]

{ #category : 'enumerating' }
BioGenomicIntervalCollection >> select: aBlock [

	^ self class new
		  addAll: (intervals select: aBlock);
		  yourself
]

{ #category : 'accessing' }
BioGenomicIntervalCollection >> size [

	^ intervals size
]

{ #category : 'sorting' }
BioGenomicIntervalCollection >> sortByChromosomeAndPosition [

	intervals := intervals sorted: [ :a :b |
			             a chromosome < b chromosome or: [
				             a chromosome = b chromosome and: [ a start < b start ] ] ]
]

{ #category : 'accessing' }
BioGenomicIntervalCollection >> totalLength [

	^ intervals inject: 0 into: [ :sum :i | sum + i length ]
]

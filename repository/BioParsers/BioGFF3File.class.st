Class {
	#name : 'BioGFF3File',
	#superclass : 'Object',
	#instVars : [
		'directives',
		'features',
		'sourceDirective',
		'gffVersion'
	],
	#category : 'BioParsers-GFF3',
	#package : 'BioParsers',
	#tag : 'GFF3'
}

{ #category : 'as yet unclassified' }
BioGFF3File class >> fromFile: aFilename [

	^ self fromString: aFilename asFileReference contents
]

{ #category : 'as yet unclassified' }
BioGFF3File class >> fromString: aString [

	| parser node input |
	input := (aString endsWith: String lf)
		         ifTrue: [ aString ]
		         ifFalse: [ aString , String lf ].
	parser := BioGFF3Parser on: (ReadStream on: input).
	node := parser parse.
	^ self new fromGFF3FileNode: node
]

{ #category : 'properties' }
BioGFF3File >> childrenOf: aFeature [

	| parentId |
	parentId := aFeature id ifNil: [ ^ #(  ) ].
	^ self features select: [ :f | f parentIds includes: parentId ]
]

{ #category : 'querying' }
BioGFF3File >> derivesFromOf: aFeature [

	| anId |
	anId := aFeature id ifNil: [ ^ #(  ) ].
	^ self features select: [ :f | f derivesFrom = anId ]
]

{ #category : 'accessing' }
BioGFF3File >> directives [

	^ directives 
		ifNil: [ directives := OrderedCollection new ]
]

{ #category : 'accessing' }
BioGFF3File >> directives: aCollection [

	directives := aCollection
]

{ #category : 'querying' }
BioGFF3File >> featureCount [

	^ self features size
]

{ #category : 'querying' }
BioGFF3File >> featureTypes [

	^ (self features collect: #type) asSet asSortedCollection asArray
]

{ #category : 'querying' }
BioGFF3File >> featureWithId: anId [

	^ self features detect: [ :f | f id = anId ] ifNone: [ nil ]
]

{ #category : 'accessing' }
BioGFF3File >> features [

	^ features 
		ifNil: [ features := OrderedCollection new ]
]

{ #category : 'accessing' }
BioGFF3File >> features: aCollection [

	features := aCollection
]

{ #category : 'querying' }
BioGFF3File >> featuresWithSeqid: aSeqid [

	^ self features select: [ :f | f seqid = aSeqid ]
]

{ #category : 'querying' }
BioGFF3File >> featuresWithType: aType [

	^ self features select: [ :f | f type = aType ]
]

{ #category : 'instance creation' }
BioGFF3File >> fromFile: aFilename filteringSeqid: aSeqid [
	"Parse only features for a specific seqid/chromosome. Memory-efficient."

	| stream line tabSeqid |
	features := OrderedCollection new.
	tabSeqid := aSeqid , (String with: Character tab).
	stream := aFilename asFileReference readStream.
	[ stream atEnd ] whileFalse: [
			line := stream nextLine.
			line ifNotEmpty: [
					line first = $# ifFalse: [
							(line beginsWith: tabSeqid) ifTrue: [
								features add: (self parseFeatureLine: line) ] ] ] ].
	stream close.
	self features: features.
	^ self
]

{ #category : 'instance creation' }
BioGFF3File >> fromFile: aFilename filteringTypes: typeSet [
	"Parse only features whose type is in typeSet. Memory-efficient for large files."

	| stream line |
	features := OrderedCollection new.
	stream := aFilename asFileReference readStream.
	[ stream atEnd ] whileFalse: [
			line := stream nextLine.
			line ifNotEmpty: [
					line first = $# ifFalse: [
							| fields type |
							fields := line findTokens: String tab.
							fields size >= 3 ifTrue: [
									type := fields at: 3.
									(typeSet includes: type) ifTrue: [
										features add: (self parseFeatureLine: line) ] ] ] ] ].
	stream close.
	self features: features.
	^ self
]

{ #category : 'instance creation' }
BioGFF3File >> fromFile: aFilename maxFeatures: maxCount [
	"Parse at most maxCount features. Useful for previews."

	| stream line count |
	features := OrderedCollection new.
	count := 0.
	stream := aFilename asFileReference readStream.
	[ stream atEnd or: [ count >= maxCount ] ] whileFalse: [
			line := stream nextLine.
			line ifNotEmpty: [
					line first = $# ifFalse: [
							| feature |
							feature := self parseFeatureLine: line.
							feature ifNotNil: [
									features add: feature.
									count := count + 1 ] ] ] ].
	stream close.
	self features: features.
	^ self
]

{ #category : 'instance creation' }
BioGFF3File >> fromGFF3FileNode: aNode [

	| directiveTexts featuresList |
	directiveTexts := aNode directives
		                  ifNil: [ OrderedCollection new ]
		                  ifNotNil: [ :dl |
				                  dl directives
					                  ifNil: [ OrderedCollection new ]
					                  ifNotNil: [ :ds |
					                  ds collect: [ :d | d text value ] ] ].
	self directives: directiveTexts.
	featuresList := aNode features
		                ifNil: [ OrderedCollection new ]
		                ifNotNil: [ :fl |
				                fl lines
					                ifNil: [ OrderedCollection new ]
					                ifNotNil: [ :lines |
						                lines collect: [ :line |
							                BioGFF3Feature fromFeatureLine: line ] ] ].
	self features: featuresList.
	^ self
]

{ #category : 'accessing' }
BioGFF3File >> gffVersion [

	gffVersion ifNil: [
			| directive |
			directive := self directives
				             detect: [ :d | d beginsWith: '##gff-version' ]
				             ifNone: [ ^ nil ].
			gffVersion := (directive copyReplaceAll: '##gff-version' with: '')
				              trimBoth ].
	^ gffVersion
]

{ #category : 'querying' }
BioGFF3File >> groupByType [

	| groups |
	groups := Dictionary new.
	self features do: [ :f |
		(groups at: f type ifAbsentPut: [ OrderedCollection new ]) add: f ].
	^ groups
]

{ #category : 'parsing' }
BioGFF3File >> parseFeatureLine: aLine [

	| fields |
	fields := aLine findTokens: String tab.
	fields size < 9 ifTrue: [ ^ nil ].
	^ BioGFF3Feature new
		  seqid: fields first;
		  source: (fields at: 2);
		  type: (fields at: 3);
		  start: (fields at: 4);
		  end: (fields at: 5);
		  score: (fields at: 6);
		  strand: (fields at: 7);
		  phase: (fields at: 8);
		  attributes: (fields at: 9);
		  yourself
]

{ #category : 'querying' }
BioGFF3File >> seqids [

	^ (self features collect: #seqid) asSet asSortedCollection asArray
]

{ #category : 'accessing' }
BioGFF3File >> source [ 

	^ self directives 
		detect: [ :d | d beginsWith: '##source' ] 
		ifNone: [ nil ]
]

{ #category : 'querying' }
BioGFF3File >> streamFeaturesFromFile: aFilename block: aBlock [
	"Evaluate aBlock for each feature parsed from file, without storing all in memory.
	 aBlock receives each BioGFF3Feature."

	| stream line count |
	count := 0.
	stream := aFilename asFileReference readStream.
	[ stream atEnd ] whileFalse: [
			line := stream nextLine.
			line ifNotEmpty: [
					(line beginsWith: '##')
						ifTrue: [ "skip directives" ]
						ifFalse: [
								line first = $#
									ifTrue: [ "skip comments" ]
									ifFalse: [
											| feature |
											feature := self parseFeatureLine: line.
											feature ifNotNil: [
													aBlock value: feature.
													count := count + 1 ] ] ] ] ].
	stream close.
	^ count
]

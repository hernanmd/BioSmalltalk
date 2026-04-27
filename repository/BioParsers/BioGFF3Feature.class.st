Class {
	#name : 'BioGFF3Feature',
	#superclass : 'Object',
	#instVars : [
		'seqid',
		'source',
		'type',
		'start',
		'end',
		'score',
		'strand',
		'phase',
		'attributes',
		'attributesDict'
	],
	#category : 'BioParsers-GFF3',
	#package : 'BioParsers',
	#tag : 'GFF3'
}

{ #category : 'as yet unclassified' }
BioGFF3Feature class >> fromFeatureLine: aNode [

	^ self new
		  seqid: aNode seqid value;
		  source: aNode _source value;
		  type: aNode type value;
		  start: aNode start value;
		  end: aNode end value;
		  score: aNode score value;
		  strand: aNode strand value;
		  phase: aNode phase value;
		  attributes: aNode _attributes value;
		  yourself
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> asBioSequenceFeature [

	| sf |
	sf := BioSequenceFeature new.
	sf primaryTag: self type.
	sf sourceTag: self source.
	sf start: self startInteger.
	sf end: self endInteger.
	sf strand: self strand.
	sf score: self scoreFloat.
	sf chromosome: self seqid.
	sf frame: self phase.
	self id ifNotNil: [ :i | sf addTag: 'ID' -> i ].
	self name ifNotNil: [ :n | sf addTag: 'Name' -> n ].
	^ sf
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> attributeAt: key [ ^ self attributesDict at: key ifAbsent: [ nil ]
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> attributes [ ^ attributes
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> attributes: aString [ attributes := aString. attributesDict := nil
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> attributesDict [

	^ attributesDict ifNil: [ attributesDict := self parseAttributes ]
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> derivesFrom [

	^ self attributesDict at: 'Derives_from' ifAbsent: [ nil ]
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> end [ ^ end
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> end: aString [ end := aString
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> endInteger [

	^ end ifNotNil: [ end asInteger ]
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> hasAttribute: key [ ^ self attributesDict includesKey: key
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> id [

	^ self attributesDict at: 'ID' ifAbsent: [ nil ]
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> isForwardStrand [ ^ strand = (String with: $+)
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> isMiRNAPrimaryTranscript [

	^ self type = 'miRNA_primary_transcript'
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> isMiRNAType [

	^ self type = 'miRNA'
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> isOfCDSType [

	^ self type = 'CDS'
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> isOfExonType [

	^ self type = 'exon'
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> isOfGeneType [

	^ self type = 'gene'
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> isOfMRNAType [

	^ self type = 'mRNA'
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> isReverseStrand [ ^ strand = (String with: $-)
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> isUnstranded [ ^ strand = (String with: $.)
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> name [

	^ self attributesDict at: 'Name' ifAbsent: [ nil ]
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> parentIds [

	| p |
	p := self attributesDict at: 'Parent' ifAbsent: [ ^ #(  ) ].
	p isString ifTrue: [ ^ Array with: p ].
	^ p asArray
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> parseAttributes [

	| dict pairs |
	dict := Dictionary new.
	pairs := attributes splitOn: ';'.
	pairs do: [ :pair |
			| eqIdx k v |
			eqIdx := pair indexOf: $=.
			eqIdx > 0 ifTrue: [
					k := (pair copyFrom: 1 to: eqIdx - 1) trimBoth.
					v := (pair copyFrom: eqIdx + 1 to: pair size) trimBoth.
					dict at: k put: v ] ].
	^ dict
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> phase [ ^ phase
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> phase: aString [ phase := aString
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> score [ ^ score
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> score: aString [ score := aString
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> scoreFloat [

	^ score = (String with: $.)
		  ifTrue: [ nil ]
		  ifFalse: [ score asFloat ]
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> seqid [ ^ seqid
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> seqid: aString [ seqid := aString
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> source [ ^ source
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> source: aString [ source := aString
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> start [ ^ start
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> start: aString [ start := aString
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> startInteger [

	^ start ifNotNil: [ start asInteger ]
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> strand [ ^ strand
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> strand: aString [ strand := aString
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> type [ ^ type
]

{ #category : 'as yet unclassified' }
BioGFF3Feature >> type: aString [ type := aString
]

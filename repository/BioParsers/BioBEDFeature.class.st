"
A BED feature extending BioGenomicInterval with BED-specific fields: score, thickStart, thickEnd, itemRgb, and blocks (exons). Supports BED3, BED6, and BED12 formats.

- BED3 features have only chromosome, start, and end. BED6 adds name, score, and strand. 
- BED12 adds coding region boundaries (thickStart/thickEnd), display color (itemRgb), and exon block structure (blockCount, blockSizes, blockStarts).

## Instance Variables (in addition to inherited BioGenomicInterval slots):

score      <Integer>   Display score (0-1000 in BED convention)
thickStart <Integer>   Start of thick rendering (coding region start)
thickEnd   <Integer>   End of thick rendering (coding region end)
itemRgb    <String>    RGB color string (e.g., 255,0,0)
blocks     <OrderedCollection of BioBEDBlock>  Exon blocks for BED12

## Examples

```
BioBEDFeature fromBED3: anArray.
BioBEDFeature fromBED6: anArray.
BioBEDFeature fromBED12: anArray.
```
"
Class {
	#name : 'BioBEDFeature',
	#superclass : 'BioGenomicInterval',
	#instVars : [
		'score',
		'thickStart',
		'thickEnd',
		'itemRgb',
		'blocks'
	],
	#category : 'BioParsers-BED',
	#package : 'BioParsers',
	#tag : 'BED'
}

{ #category : 'as yet unclassified' }
BioBEDFeature class >> fromBED12: anArray [
	| feature blockCount blockSizes blockStarts |
	feature := self fromBED6: anArray.
	feature thickStart: (anArray at: 7) asNumber.
	feature thickEnd: (anArray at: 8) asNumber.
	feature itemRgb: (anArray at: 9).
	blockCount := (anArray at: 10) asNumber.
	blockSizes := ((anArray at: 11) findTokens: ',') collect: [ :s | s trimBoth asNumber ].
	blockStarts := ((anArray at: 12) findTokens: ',') collect: [ :s | s trimBoth asNumber ].
	1 to: blockCount do: [ :i |
		feature addBlock: (BioBEDBlock start: (blockStarts at: i) size: (blockSizes at: i)) ].
	^ feature
]

{ #category : 'as yet unclassified' }
BioBEDFeature class >> fromBED3: anArray [ ^ self new chromosome: (anArray at: 1); start: (anArray at: 2) asNumber; end: (anArray at: 3) asNumber; yourself
]

{ #category : 'as yet unclassified' }
BioBEDFeature class >> fromBED6: anArray [ ^ self new chromosome: (anArray at: 1); start: (anArray at: 2) asNumber; end: (anArray at: 3) asNumber; name: (anArray at: 4); score: (anArray at: 5) asNumber; strand: (anArray at: 6); yourself
]

{ #category : 'adding' }
BioBEDFeature >> addBlock: aBlock [

	blocks add: aBlock
]

{ #category : 'converting' }
BioBEDFeature >> asBEDString [

	| fields isMinBED3 sep |
	sep := String with: $,.
	fields := OrderedCollection
		          with: self chromosome
		          with: self start asString
		          with: self end asString.
	isMinBED3 := (self name isNil or: [ self name isEmpty ]) and: [
		             score = 0 and: [
			             self strand isNil or: [ self strand = '.' ] ] ].
	isMinBED3 ifFalse: [
			fields add: (self name ifNil: [ '.' ] ifNotNil: [ :n | n ]).
			fields add: self score asString.
			fields add: (self strand ifNil: [ '.' ] ifNotNil: [ :s | s ]) ].
	thickStart isNotNil ifTrue: [
			fields add: thickStart asString.
			fields add:
				(thickEnd ifNil: [ self end ] ifNotNil: [ :e | e ]) asString ].
	itemRgb ifNotNil: [
			fields add: (itemRgb isString
					 ifTrue: [ itemRgb ]
					 ifFalse: [ itemRgb printString ]) ].
	blocks isNotEmpty ifTrue: [
			fields add: blocks size asString.
			fields add: (sep join: (blocks collect: [ :b | b size asString ])).
			fields add: (sep join: (blocks collect: [ :b | b start asString ])) ].
	^ String tab join: fields
]

{ #category : 'converting' }
BioBEDFeature >> asGFF [

	^ String tab join: {
			  self chromosome.
			  'region'.
			  self name.
			  self start asString.
			  self end asString.
			  self score asString.
			  self strand.
			  '.'.
			  '.' }
]

{ #category : 'accessing' }
BioBEDFeature >> blocks [

	^ blocks
]

{ #category : 'accessing' }
BioBEDFeature >> blocks: aCollection [

	blocks := aCollection
]

{ #category : 'accessing' }
BioBEDFeature >> codingLength [

	thickStart ifNil: [ ^ self length ].
	^ thickEnd - thickStart max: 0
]

{ #category : 'initialization' }
BioBEDFeature >> initialize [

	super initialize.
	score := 0.
	blocks := OrderedCollection new
]

{ #category : 'testing' }
BioBEDFeature >> isBED12 [

	^ blocks isNotEmpty
]

{ #category : 'testing' }
BioBEDFeature >> isBED6 [

	^ score > 0 or: [ strand isNotNil and: [ strand isNotNil ] ]
]

{ #category : 'accessing' }
BioBEDFeature >> itemRgb [

	^ itemRgb
]

{ #category : 'accessing' }
BioBEDFeature >> itemRgb: anObject [

	itemRgb := anObject
]

{ #category : 'accessing' }
BioBEDFeature >> score [

	^ score
]

{ #category : 'accessing' }
BioBEDFeature >> score: anInteger [

	score := anInteger
]

{ #category : 'accessing' }
BioBEDFeature >> thickEnd [

	^ thickEnd
]

{ #category : 'accessing' }
BioBEDFeature >> thickEnd: anInteger [

	thickEnd := anInteger
]

{ #category : 'accessing' }
BioBEDFeature >> thickStart [

	^ thickStart
]

{ #category : 'accessing' }
BioBEDFeature >> thickStart: anInteger [

	thickStart := anInteger
]

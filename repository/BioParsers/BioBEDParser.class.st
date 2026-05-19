"
A SmaCC-based hybrid parser for Browser Extensible Data (BED) format files. Supports BED3, BED6, and BED12 formats with automatic format detection based on field count. 

The parser extends SmaCCParser for class hierarchy consistency but reads lines directly from the scanner stream (like BioGFF3File and BioMAFSmaCCParser). 

Lines starting with track or browser are skipped (UCSC headers). Lines starting with # are skipped (comments). 

Empty lines are skipped. 

## API

```
BioBEDParser parseFile: aPath. 
BioBEDParser parseString: aString. 
BioBEDParser parseStream: aStream. 
```

Returns a BioGenomicIntervalCollection containing BioBEDFeature objects.
"
Class {
	#name : 'BioBEDParser',
	#superclass : 'SmaCCParser',
	#instVars : [
		'bedFormat'
	],
	#category : 'BioParsers-BED',
	#package : 'BioParsers',
	#tag : 'BED'
}

{ #category : 'parsing' }
BioBEDParser class >> detectFormat: aFeature [
	aFeature isBED12 ifTrue: [ ^ #bed12 ].
	aFeature isBED6 ifTrue: [ ^ #bed6 ].
	^ #bed3

]

{ #category : 'parsing' }
BioBEDParser class >> parseFile: aFilePath [
	| stream result |
	stream := aFilePath asFileReference readStream.
	[ result := self parseStream: stream ] ensure: [ stream close ].
	^ result

]

{ #category : 'parsing' }
BioBEDParser class >> parseLine: aLine bedFormat: currentFormat [
	| fields |
	fields := (aLine findTokens: (Array with: Character tab)) collect: [ :s | s trimBoth ].
	fields isEmpty ifTrue: [ ^ nil ].
	fields size < 3 ifTrue: [ ^ nil ].
	fields size >= 12
		ifTrue: [ ^ BioBEDFeature fromBED12: fields ]
		ifFalse: [
			fields size >= 6
				ifTrue: [ ^ BioBEDFeature fromBED6: fields ]
				ifFalse: [ ^ BioBEDFeature fromBED3: fields ] ]

]

{ #category : 'parsing' }
BioBEDParser class >> parseStream: aStream [
	| collection line bedFormat |
	collection := BioGenomicIntervalCollection new.
	bedFormat := nil.
	[ aStream atEnd ] whileFalse: [
		line := aStream nextLine.
		line := line trimBoth.
		(line isEmpty or: [ line beginsWith: '#' ]) ifFalse: [
			(line beginsWith: 'track') ifFalse: [
				(line beginsWith: 'browser') ifFalse: [
					| feature |
					feature := self parseLine: line bedFormat: bedFormat.
					feature ifNotNil: [
						bedFormat isNil ifTrue: [ bedFormat := self detectFormat: feature ].
						collection addInterval: feature ] ] ] ] ].
	^ collection

]

{ #category : 'parsing' }
BioBEDParser class >> parseString: aString [
	^ self parseStream: aString readStream

]

{ #category : 'as yet unclassified' }
BioBEDParser class >> scannerClass [ ^ BioBEDScanner
]

{ #category : 'parsing' }
BioBEDParser >> detectFormat: fieldCount [ fieldCount >= 12 ifTrue: [ ^ #bed12 ]. fieldCount >= 6 ifTrue: [ ^ #bed6 ]. ^ #bed3
]

{ #category : 'accessing' }
BioBEDParser >> parse [
	"Parse BED content from stream. Returns a BioGenomicIntervalCollection."
	| collection line stream |
	collection := BioGenomicIntervalCollection new.
	stream := scanner stream.
	bedFormat := nil.
	[ stream atEnd ] whileFalse: [
		line := stream nextLine.
		line ifNil: [ ^ collection ].
		line := line trimBoth.
		(line isEmpty or: [ line beginsWith: '#' ]) ifFalse: [
			(line beginsWith: 'track') ifFalse: [
				(line beginsWith: 'browser') ifFalse: [
					| feature |
					feature := self parseLine: line.
					feature ifNotNil: [ collection addInterval: feature ] ] ] ] ].
	^ collection
]

{ #category : 'parsing' }
BioBEDParser >> parseLine: aLine [
	| fields |
	fields := (aLine findTokens: (Array with: Character tab)) collect: [ :s | s trimBoth ].
	fields isEmpty ifTrue: [ ^ nil ].
	fields size = 1 ifTrue: [ ^ nil ].
	bedFormat isNil ifTrue: [ bedFormat := self detectFormat: fields size ].
	fields size < 3 ifTrue: [ ^ nil ].
	fields size >= 12
		ifTrue: [ ^ BioBEDFeature fromBED12: fields ]
		ifFalse: [
			fields size >= 6
				ifTrue: [ ^ BioBEDFeature fromBED6: fields ]
				ifFalse: [ ^ BioBEDFeature fromBED3: fields ] ]
]

"
Abstract class to work with all the Browser Extensible Data (BED) formats out there, as described in the http://genome.ucsc.edu/FAQ/FAQformat#format1

The formatter holds a orderIndex to ensure the data lines fields are sent in the correct order.

BioBEDFormatter new
	addCFChr:  'chr3' start: 313213  end: 1382913;
	yourself.

	
"
Class {
	#name : #BioBEDFormatter,
	#superclass : #BioSequenceFeatureFormatter,
	#instVars : [
		'properties',
		'browser',
		'orderIndex'
	],
	#category : #'BioFormatters-Formatters-BED'
}

{ #category : #accessing }
BioBEDFormatter class >> description [
	" See superimplementor's comment "

	^ 'Browser Extensible Data (BED) format'
]

{ #category : #examples }
BioBEDFormatter class >> example01 [
	" Example writing one track "
	
	| bedFormatter chrString peaks |
	
	chrString := 'chr12'.
	peaks := { 131838 . 1498174 . 1598174 . 1698174 }.
	bedFormatter := BioBEDFormatter new
		outputFilename: 'Test1.bed';
		addCTrackName: 'Test Track';
		addCTrackVisibility: 2;
		setItemRgbOn;
		dumpHeaders;
		yourself.
	peaks pairsDo: [ : s : e |
		bedFormatter 
			addCFChr: chrString start: s end: e ;
			addCFScore: 960;
			addCFStrand: $+;
			nextPutTerminator ].
	bedFormatter flush.

]

{ #category : #examples }
BioBEDFormatter class >> example02 [
	" Example writing multiple tracks "
	
	| bedFormatter track1 track2 |
	
	track1 := self testFilesFullDirectoryName / '1E-5_Track1.tsv'.
	track2 := self testFilesFullDirectoryName / '1E-5_Track2.tsv'.

	bedFormatter := BioBEDFormatter new
		outputFilename: '1E-5.bed';
		yourself.
		
	bedFormatter	
		addCTrackName: 'ER';
		addCTrackDescription: 'estrogen receptor ChIP-chip';
		addCTrackColor: { 150 . 50 . 150 };
		dumpCTrack;
		yourself.
	
	 track1 readStreamDo: [ : stream | 
		(NeoCSVReader on: stream)
			separator: Character tab;		
			do: [ : r | 
				bedFormatter 
					addCFChr: r first start: r second end: r third;
					addCFName: r fourth;
					nextPutTerminator ] ].

	bedFormatter	
		addCTrackName: 'Pol';
		addCTrackDescription: 'polymerase II ChIP-chip';
		addCTrackColor: { 50 . 100 . 50 };
		dumpCTrack;
		yourself.
		
	track2 readStreamDo: [ : stream | 
		(NeoCSVReader on: stream)
			separator: Character tab;		
			do: [ : r | 
				bedFormatter 
					addCFChr: r first start: r second end: r third;
					addCFName: r fourth;
					nextPutTerminator ] ].
	bedFormatter flush.

]

{ #category : #accessing }
BioBEDFormatter class >> formatExtension [
	"Answer a <String> corresponding for the receiver's file output format"

	^ 'bed'
]

{ #category : #testing }
BioBEDFormatter class >> testFilesFullDirectoryName [
	" Private - See superimplementor's comment "

	^ super testFilesFullDirectoryName / self formatExtension
]

{ #category : #'accessing - adding features' }
BioBEDFormatter >> addCFBlockCount: aNumber [
	" Add the number of blocks (exons) in the BED line. "

	self assert: [ self orderIndex = 10 ].
	self outputFileStream 
		space;
		nextPutAll: aNumber asString.
	self orderIndex: self orderIndex + 1.

]

{ #category : #'accessing - adding features' }
BioBEDFormatter >> addCFBlockSizes: aCollection [
	" Add block sizes in aCollection. The number of items in this list should correspond to blockCount. "

	| csl |
	self assert: [ self orderIndex = 11 ].
	csl := aCollection joinUsing: $,.
	self outputFileStream 
		space;
		nextPutAll: csl.
	self orderIndex: self orderIndex + 1.

]

{ #category : #'accessing - adding features' }
BioBEDFormatter >> addCFBlockStarts: aCollection [
	" Add block sizes in aCollection. All of the blockStart positions should be calculated relative to chromStart. The number of items in this list should correspond to blockCount. "

	| csl |
	self assert: [ self orderIndex = 12 ].
	csl := aCollection joinUsing: $,.
	self outputFileStream 
		space;
		nextPutAll: csl;
		nextPutTerminator

]

{ #category : #'accessing - adding features' }
BioBEDFormatter >> addCFChr: chrString start: chrStart end: chrEnd [
	"
	Write minimal Custom Feature data in BED format.
	 
	chrString = The name of the chromosome: chr2, chrX, 4, c5 
	chrStart  = Starting position of the feature in the chromosome or scaffold
	chrEnd    = Ending position of the feature in the chromosome or scaffold
	"
	self outputFileStream 
		nextPutAll: chrString;
		nextPut: self delimiter;
		nextPutAll: chrStart asString;
		nextPut: self delimiter;
		nextPutAll: chrEnd asString.
	self orderIndex: 4.
]

{ #category : #'accessing - adding features' }
BioBEDFormatter >> addCFLineChr: chrString start: chrStart end: chrEnd [
	"
	Write minimal Custom Feature data line in BED format.
	 
	chrString = The name of the chromosome: chr2, chrX, 4, c5 
	chrStart  = Starting position of the feature in the chromosome or scaffold
	chrEnd    = Ending position of the feature in the chromosome or scaffold
	"
	self 
		addCFChr: chrString start: chrStart end: chrEnd;
		nextPutTerminator
]

{ #category : #'accessing - adding features' }
BioBEDFormatter >> addCFName: aString [
	" Add current feature name for the current data line "

	self assert: [ self orderIndex = 4 ].
	self outputFileStream 
		space;
		nextPutAll: aString.
	self orderIndex: self orderIndex + 1.

]

{ #category : #'accessing - adding features' }
BioBEDFormatter >> addCFRGB: colorCollection [
	" Add current feature individual color for the current data line.
	colorCollection is a <Collection> of <Color> instances in RGB order "

	self assert: [ self orderIndex = 9 ].
	self outputFileStream 
		space;
		nextPutAll: colorCollection first;
		nextPut: $,;
		nextPutAll: colorCollection second;
		nextPut: $,;
		nextPutAll: colorCollection third.
	self orderIndex: self orderIndex + 1.

]

{ #category : #'accessing - adding features' }
BioBEDFormatter >> addCFScore: aNumber [
	" Add a description for custom tracks. aNumber must be between 0 and 1000 "

	self assert: [ aNumber between: 0 and: 1000 ].
	self assert: [ self orderIndex = 5 ].
	self outputFileStream 
		space;
		nextPutAll: aNumber asString.
	self orderIndex: self orderIndex + 1.
]

{ #category : #'accessing - adding features' }
BioBEDFormatter >> addCFStrand: aCharacter [

	self assert: [ self orderIndex = 6 ].
	self assert: [ { $. . $- . $+ } includes: aCharacter ].
	self outputFileStream 
		space;
		nextPut: aCharacter.
	self orderIndex: self orderIndex + 1.
]

{ #category : #'accessing - adding features' }
BioBEDFormatter >> addCFThickEnd: aNumber [

	self assert: [ self orderIndex = 8 ].
	self outputFileStream 
		space;
		nextPutAll: aNumber asString.
	self orderIndex: self orderIndex + 1.
]

{ #category : #'accessing - adding features' }
BioBEDFormatter >> addCFThickStart: aNumber [

	self assert: [ self orderIndex = 7 ].
	self outputFileStream 
		space;
		nextPutAll: aNumber asString.
	self orderIndex: self orderIndex + 1.
]

{ #category : #'accessing - custom track header' }
BioBEDFormatter >> addCTrackColor: colorCollection [
	" Sets the default visibility mode for this track. 
	colorCollection must have 3 <Color> instances "

	| rgbColors |
	
	rgbColors := colorCollection joinUsing: $,.
	self properties
		propertyAt: 'color'
		put: rgbColors
]

{ #category : #'accessing - custom track header' }
BioBEDFormatter >> addCTrackColorByStrand: colorCollection [
	" Sets the default visibility mode for this track. 
	colorCollection must have 6 <Number> RGB instances "

	| plusStrand minorStrand |
	
	plusStrand := (colorCollection first: 3) joinUsing: $,.
	minorStrand := (colorCollection last: 3) joinUsing: $,.
	self properties
		propertyAt: 'colorByStrand'
		put: ((plusStrand , ' ' , minorStrand) surroundedBy: '"')
]

{ #category : #'accessing - custom track header' }
BioBEDFormatter >> addCTrackDescription: aString [
	" Add a description for custom tracks "

	self properties
		propertyAt: 'description'
		put: (aString surroundedBy: '"')
]

{ #category : #'accessing - custom track header' }
BioBEDFormatter >> addCTrackName: aString [
	" Add description name (for custom track displayed in the Genome Browser)"

	self properties
		propertyAt: 'track name'
		put: (aString surroundedBy: '"')
]

{ #category : #'accessing - custom track header' }
BioBEDFormatter >> addCTrackUseScore: aNumber [

	self properties
		propertyAt: 'useScore'
		put: aNumber asString
]

{ #category : #'accessing - custom track header' }
BioBEDFormatter >> addCTrackVisibility: aNumber [
	" Sets the default visibility mode for this track. "

	self properties
		propertyAt: 'visibility'
		put: aNumber asString
]

{ #category : #accessing }
BioBEDFormatter >> asStringFromFeature: aBioSequenceFeature [

	^ String streamContents: [ : writeStream | 
		writeStream 
			nextPutAll: aBioSequenceFeature chromosome asString;
			tab;
			nextPutAll: aBioSequenceFeature start asString;
			tab;
			nextPutAll: aBioSequenceFeature end asString ]
]

{ #category : #accessing }
BioBEDFormatter >> browser [
	^ browser
		ifNil: [ browser := BioPropertyObject new ]
]

{ #category : #'accessing - custom track browser' }
BioBEDFormatter >> browser: aBioPropertyObject [

	browser := aBioPropertyObject
]

{ #category : #accessing }
BioBEDFormatter >> delimiter [
	" Answer the Character used to delimit fields in data lines "
	
	^ Character space
]

{ #category : #private }
BioBEDFormatter >> dumpBrowserHeader [
	" Private - Write custom track browser line "

	self browser properties 
		ifNil: [ ^ self ]
		ifNotNil: [ : bp | 
			bp keysAndValuesDo: [ : key : value |
				self outputFileStream
					nextPutAll: key;
					space;
					nextPutAll: value;
					space ].
			self outputFileStream nextPutTerminator ]
]

{ #category : #accessing }
BioBEDFormatter >> dumpCTrack [
	" Private - Write custom track header line "

	self properties propertiesDo: [ : prop |
		self outputFileStream
				nextPutAll: prop key;
				nextPut: $=;
				nextPutAll: prop value;
				space ].
	self outputFileStream 
			nextPutTerminator;
			flush
]

{ #category : #accessing }
BioBEDFormatter >> dumpHeaders [

	self 
		dumpBrowserHeader;
		dumpCTrack
]

{ #category : #accessing }
BioBEDFormatter >> fileNamePrefix [
	" Answer a default prefix <String> for the output file name "
	
	^ 'BioST-Export-BED_'
]

{ #category : #accessing }
BioBEDFormatter >> nextPutTerminator [
	" Set the end of a data line "

	self outputFileStream nextPutTerminator 
]

{ #category : #accessing }
BioBEDFormatter >> orderIndex [
	^ orderIndex
]

{ #category : #accessing }
BioBEDFormatter >> orderIndex: anObject [
	orderIndex := anObject
]

{ #category : #'accessing - custom track header' }
BioBEDFormatter >> properties [
	" Use properties object to store track properties "

	^ properties
		ifNil: [ properties := BioPropertyObject new ]
]

{ #category : #'accessing - custom track header' }
BioBEDFormatter >> properties: aBioPropertyObject [
	properties := aBioPropertyObject
]

{ #category : #'accessing - custom track browser' }
BioBEDFormatter >> setCTrackBrowserPositionChr: chrString from: startPos to: endPos [
	" Add a description for custom tracks "

	| chrRange |
	
	chrRange := String streamContents: [ : chrStream |
		chrStream
			nextPutAll: chrString;
			nextPut: $:;
			nextPutAll: startPos asString;
			nextPut: $-;
			nextPutAll: endPos asString ].
	self browser
		propertyAt: 'browser position';
		put: chrRange
]

{ #category : #'accessing - custom track browser' }
BioBEDFormatter >> setCTrackBrowserShowAll [
	" Add a description for custom tracks "

	self browser
		propertyAt: 'browser show' 
		put: 'all'
]

{ #category : #'accessing - custom track header' }
BioBEDFormatter >> setItemRgbOn [
	" Set the itemRgb attribute to individually color each data line. "

	self properties
		propertyAt: 'itemRgb'
		put: '"On"'
]

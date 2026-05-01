"
Represents a Microsatellite DNA.  A microsatellite is a region of nuclear DNA in which certain DNA motifs (ranging in length from 2 to 5 base pairs) are repeated.

A microsatellite is defined by a name, fragment size range (bp), dye color, and repeat length. See class side for examples.
	
References 

https://en.wikipedia.org/wiki/Microsatellite
https://en.wikipedia.org/wiki/Sequence_motif
https://tools.thermofisher.com/content/sfs/manuals/cms_042039.pdf


"
Class {
	#name : 'BioSTRSequence',
	#superclass : 'BioRepeatSequence',
	#category : 'BioTools-Repeats',
	#package : 'BioTools',
	#tag : 'Repeats'
}

{ #category : 'converting' }
BioSTRSequence class >> asCSVHeader [
	"Answer CSV header row"

	^ 'Marker,Chromosome,Motif,Repeats,AlleleSize,Start,End,Strand'
]

{ #category : 'examples' }
BioSTRSequence class >> example01 [

	^ self new	
		motif: 'AT';
		repeats: 5;
		yourself.
]

{ #category : 'examples' }
BioSTRSequence class >> example02 [

	^ self new 
		name: 'BM1818';
		motif: 'TG';
		start: 266;
		end: 270;
		yourself;
		inspect
]

{ #category : 'examples' }
BioSTRSequence class >> example03 [

	^ self new 
		name: 'BM1818';
		motif: 'TG';
		positions: 266 -> 270;
		yourself;
		inspect
]

{ #category : 'converting' }
BioSTRSequence >> asAlleleString [
	"Answer allele in standard notation (e.g., D13S317=10)"
	^ String streamContents: [ :s |
		self markerCode ifNotNil: [ s << self markerCode ].
		s << $=.
		s << (self repeats ifNil: [ 0 ]) asString ]
]

{ #category : 'converting' }
BioSTRSequence >> asCSVRow [
	"Answer CSV data row"

	^ String streamContents: [ :s |
			  s
				  << (self markerCode ifNil: [ self name ifNil: [ '' ] ]);
				  << ','.
			  s
				  << (self chromosome ifNil: [ '' ]);
				  << ','.
			  s
				  << self motif;
				  << ','.
			  s
				  << self repeats asString;
				  << ','.
			  s
				  << self alleleSize asString;
				  << ','.
			  s
				  << self start asString;
				  << ','.
			  s
				  << self end asString;
				  << ','.
			  s << (self isForwardStrand
				   ifTrue: [ '+' ]
				   ifFalse: [ '-' ]) ]
]

{ #category : 'converting' }
BioSTRSequence >> asGFFRow [
	"Answer a GFF3 format row"

	^ String streamContents: [ :s |
			  s
				  nextPutAll: (self chromosome ifNil: [ 'chr' ]);
				  nextPut: Character tab.
			  s
				  nextPutAll: 'BioSmalltalk';
				  nextPut: Character tab.
			  s
				  nextPutAll: 'tandem_repeat';
				  nextPut: Character tab.
			  s
				  nextPutAll: self start asString;
				  nextPut: Character tab.
			  s
				  nextPutAll: self end asString;
				  nextPut: Character tab.
			  s
				  nextPut: $.;
				  nextPut: Character tab.
			  s
				  nextPut: (self isForwardStrand
						   ifTrue: [ $+ ]
						   ifFalse: [ $- ]);
				  nextPut: Character tab.
			  s
				  nextPut: $.;
				  nextPut: Character tab.
			  s
				  nextPutAll: 'ID=';
				  nextPutAll:
					  (self markerCode ifNil: [ self name ifNil: [ '.' ] ]).
			  s
				  nextPutAll: ';motif=';
				  nextPutAll: self motif.
			  s
				  nextPutAll: ';repeats=';
				  nextPutAll: self repeats asString ]
]

{ #category : 'converting' }
BioSTRSequence >> asGenBankFeature [
	"Answer a GenBank feature string"

	^ String streamContents: [ :s |
			  s
				  nextPutAll: 'repeat_region';
				  nextPut: Character tab.
			  s
				  nextPutAll: self start asString;
				  nextPutAll: '..';
				  nextPutAll: self end asString;
				  cr.
			  s
				  nextPut: Character tab;
				  nextPutAll: '/note="';
				  nextPutAll: (self markerCode ifNil: [ '.' ]);
				  nextPut: $";
				  cr.
			  s
				  nextPut: Character tab;
				  nextPutAll: '/rpt_type=tandem';
				  cr.
			  s
				  nextPut: Character tab;
				  nextPutAll: '/rpt_unit_seq="';
				  nextPutAll: self motif;
				  nextPut: $";
				  cr.
			  s
				  nextPut: Character tab;
				  nextPutAll: '/rpt_unit_range="';
				  nextPutAll: self repeats asString;
				  nextPut: $" ]
]

{ #category : 'converting' }
BioSTRSequence >> asVCFRow [
	"Answer a VCF format row"

	^ String streamContents: [ :s |
			  s
				  nextPutAll: (self chromosome ifNil: [ 'chr' ]);
				  nextPut: Character tab.
			  s
				  nextPutAll: self start asString;
				  nextPut: Character tab.
			  s
				  nextPutAll: (self markerCode ifNil: [ '.' ]);
				  nextPut: Character tab.
			  s
				  nextPutAll: 'REF';
				  nextPut: Character tab.
			  s
				  nextPutAll: 'ALT';
				  nextPut: Character tab.
			  s
				  nextPut: $.;
				  nextPut: Character tab.
			  s
				  nextPut: $.;
				  nextPut: Character tab.
			  s
				  nextPutAll: 'MOTIF=';
				  nextPutAll: self motif.
			  s
				  nextPutAll: ';REPEATS=';
				  nextPutAll: self repeats asString.
			  s
				  nextPutAll: ';SIZE=';
				  nextPutAll: self alleleSize asString ]
]

{ #category : 'defaults' }
BioSTRSequence >> defaultMaxMotifSize [
	" Microsatellite definition at the US National Library of Medicine Medical Subject Headings (MeSH) "
	
	^ 5
]

{ #category : 'defaults' }
BioSTRSequence >> defaultMinMotifSize [
	" Microsatellite definition at the US National Library of Medicine Medical Subject Headings (MeSH) "
	
	^ 2
]

{ #category : 'accessing' }
BioSTRSequence >> description [
	"Answer a human-readable description"

	^ String streamContents: [ :s |
			  self markerCode ifNotNil: [
					  s
						  << self markerCode;
						  << ': ' ].
			  s
				  << self motif;
				  << ' x ';
				  << self repeats asString.
			  s
				  << ' (';
				  << self alleleSize asString;
				  << ' bp)' ]
]

{ #category : 'testing' }
BioSTRSequence >> isDiNucleotide [
	"Answer true if receiver has a di-nucleotide motif (2 bp)"

	^ self motifSize = 2
]

{ #category : 'testing' }
BioSTRSequence >> isHexaNucleotide [
	"Answer true if receiver has a hexa-nucleotide motif (6 bp)"

	^ self motifSize = 6
]

{ #category : 'testing' }
BioSTRSequence >> isMonoNucleotide [
	"Answer true if receiver has a mono-nucleotide motif (1 bp)"

	^ self motifSize = 1
]

{ #category : 'testing' }
BioSTRSequence >> isPentaNucleotide [
	"Answer true if receiver has a penta-nucleotide motif (5 bp)"

	^ self motifSize = 5
]

{ #category : 'testing' }
BioSTRSequence >> isSTRSequence [
	" Answer <true> if the receiver represents a STR sequence "
	
	^ true
]

{ #category : 'testing' }
BioSTRSequence >> isTetraNucleotide [
	"Answer true if receiver has a tetra-nucleotide motif (4 bp)"

	^ self motifSize = 4
]

{ #category : 'testing' }
BioSTRSequence >> isTriNucleotide [
	"Answer true if receiver has a tri-nucleotide motif (3 bp)"

	^ self motifSize = 3
]

{ #category : 'testing' }
BioSTRSequence >> isWithinRange: aRange [
	"Answer true if allele size is within the expected range"

	^ aRange includes: self alleleSize
]

{ #category : 'testing' }
BioSTRSequence >> matchesExpectedSize: expectedSize [
	"Answer true if allele size matches expected"

	^ self alleleSize = expectedSize
]

{ #category : 'printing' }
BioSTRSequence >> printMotifOn: aStream [

	self motif notNil
		ifTrue: [ 
			aStream
				nextPutAll: self motif between: $( and: $);
				nextPutAll: self repeats asString ]
]

{ #category : 'printing' }
BioSTRSequence >> printOn: aStream [
	" Private - See superimplementor's comment "

	super printOn: aStream.
	self printMotifOn: aStream.

]

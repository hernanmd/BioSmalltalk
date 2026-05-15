"
Abstract class to represent repetitive sequences.


	repeats 				<Number> 	How many times the motif is repeated
	repeatStructure:		<Symbol>	 	#simple, #compound


"
Class {
	#name : 'BioRepeatSequence',
	#superclass : 'BioSequence',
	#instVars : [
		'genotype',
		'repeats',
		'locus',
		'repeatStructure',
		'maxMotifSize',
		'minMotifSize',
		'flankingRegionLeft',
		'flankingRegionRight',
		'chromosome',
		'strand',
		'markerCode',
		'motifSequence'
	],
	#category : 'BioTools-Sequences',
	#package : 'BioTools',
	#tag : 'Sequences'
}

{ #category : 'accessing' }
BioRepeatSequence class >> countTandemRepeats: aMotif in: aSequence [
	"Count consecutive tandem repeats of motif"

	| count pos motifLen |
	count := 0.
	pos := 1.
	motifLen := aMotif size.
	[
		pos <= (aSequence size - motifLen + 1) and: [
			(aSequence copyFrom: pos to: pos + motifLen - 1) = aMotif ] ]
		whileTrue: [
				count := count + 1.
				pos := pos + motifLen ].
	^ count
]

{ #category : 'accessing' }
BioRepeatSequence class >> findMotifsOfLength: len in: aSequence [
	"Find potential repeat motifs of given length"

	| motifs |
	motifs := Set new.
	1 to: aSequence size - len + 1 do: [ :i |
	motifs add: (aSequence copyFrom: i to: i + len - 1) ].
	^ motifs asArray select: [ :m |
		  self countTandemRepeats: m in: aSequence > 1 ]
]

{ #category : 'accessing' }
BioRepeatSequence class >> findRepeatsIn: aSequence motif: aMotifString [
	"Find all occurrences of motif in sequence"

	| positions currentPos |
	positions := OrderedCollection new.
	currentPos := 1.
	[ currentPos <= (aSequence size - aMotifString size + 1) ]
		whileTrue: [
				(aSequence
					 copyFrom: currentPos
					 to: currentPos + aMotifString size - 1) = aMotifString
					ifTrue: [
							positions add: currentPos.
							currentPos := currentPos + aMotifString size ]
					ifFalse: [ currentPos := currentPos + 1 ] ].
	^ positions asArray
]

{ #category : 'instance creation' }
BioRepeatSequence class >> name: nameString sequence: seqString motif: motifString repeats: repNumber [
	" Answer a new object representing a tandem repeat sequence "
	
	^ (self newAmbiguousDNA: seqString named: nameString)
		motif: motifString;
		repeats: repNumber;
		yourself
]

{ #category : 'instance creation' }
BioRepeatSequence class >> name: nameString sequence: seqString motif: motifString repeats: repNumber repeatStartPosition: repStartNumber [
	" Answer a new object representing a tandem repeat sequence "
	
	^ (self newAmbiguousDNA: seqString named: nameString)
		motif: motifString;
		repeats: repNumber;
		start: repStartNumber;
		yourself
]

{ #category : 'instance creation' }
BioRepeatSequence class >> newLocus: aBioLocus markers: anObject [
	" Answer a new object representing a Microsatellite marker "
	
	^ self new
		locus: aBioLocus;
		positions: anObject;
		yourself
]

{ #category : 'instance creation' }
BioRepeatSequence class >> newMotif: motifString repeats: repNumber [
	" Answer a new object representing a tandem repeat sequence "
	
	^ self new
		motif: motifString;
		repeats: repNumber;
		yourself
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> alleleCount [
	"Answer the number of alleles (1 or 2)"

	self genotype alleleA ifNil: [ ^ 0 ].
	self genotype alleleB ifNil: [ ^ 1 ].
	^ 2
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> alleleDifference [
	"Answer the size difference between alleles in bp"

	^ (self genotype alleleA ifNil: [ 0 ])
	  - (self genotype alleleB ifNil: [ 0 ]) abs
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> alleleSize [
	"Answer the allele size in base pairs"

	^ self motifSize * self repeats
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> alleleSizeWithFlanks [
	"Answer total size including flanking regions"

	^ self alleleSize + self leftFlankSize + self rightFlankSize
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> asGFFRow [
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
				  nextPutAll: 'motif=';
				  nextPutAll: self motif.
			  s
				  nextPutAll: ';repeats=';
				  nextPutAll: self repeats asString ]
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> asGenBankFeature [
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
				  nextPutAll: '/rpt_type=tandem';
				  cr.
			  s
				  nextPut: Character tab;
				  nextPutAll: '/rpt_unit_seq="';
				  nextPutAll: self motif;
				  nextPut: $" ]
]

{ #category : 'converting' }
BioRepeatSequence >> asString [
	" Answer a <String> with the receiver's sequence "
	
	^ self generateJoin: self motif repeat: self repeats

]

{ #category : 'accessing - public' }
BioRepeatSequence >> beCompoundRepeat [

	self repeatStructure: #compound
]

{ #category : 'accessing - public' }
BioRepeatSequence >> beSimpleRepeat [

	self repeatStructure: #simple
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> chromosome [

	^ chromosome
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> chromosome: aString [
	chromosome := aString
]

{ #category : 'accessing' }
BioRepeatSequence >> end [
	" Answer an <Integer> with the receiver's genotype end position "
	
	^ self genotype end
]

{ #category : 'accessing' }
BioRepeatSequence >> end: anObject [
	" Set anObject as the receiver's genotype end position "
	
	^ self genotype end:  (self validatePosition: anObject)
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> expectedPCRSize [

	^ self alleleSizeWithFlanks
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> flankingRegionLeft [
	"Answer the left flanking region <String>"

	^ flankingRegionLeft
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> flankingRegionLeft: aString [
	flankingRegionLeft := aString
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> flankingRegionRight [
	"Answer the right flanking region <String>"

	^ flankingRegionRight
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> flankingRegionRight: aString [
	flankingRegionRight := aString
]

{ #category : 'accessing' }
BioRepeatSequence >> genotype [
	" Answer a <BioGenotype> representing the receiver's genotype "

	^ genotype
		ifNil: [ genotype := BioGenotype new ]
]

{ #category : 'accessing' }
BioRepeatSequence >> genotype: aBioGenotype [

	genotype := aBioGenotype
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> hasFlankingRegions [
	"Answer true if flanking regions are defined"

	^ flankingRegionLeft notNil or: [ flankingRegionRight notNil ]
]

{ #category : 'testing' }
BioRepeatSequence >> isCompoundRepeat [
	" Answer <true> if receiver repeat structure is compound "

	^ self repeatStructure = #compound
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> isForwardStrand [

	^ self strand = 1
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> isHeterozygous [
	"Answer true if genotype has two different alleles"

	^ self genotype alleleA ~= self genotype alleleB
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> isHomozygous [
	"Answer true if genotype has same alleles"

	^ self genotype alleleA = self genotype alleleB
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> isInterruptedRepeat [
	"Answer true if the repeat has interruptions"

	^ self isPerfectRepeat not
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> isPerfectRepeat [
	"Answer true if the repeat is perfect (all motifs identical)"

	| motif |
	motif := self motif.
	motif ifNil: [ ^ false ].
	^ self repeatCopyNumber = self repeats
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> isReverseStrand [

	^ self strand = -1
]

{ #category : 'testing' }
BioRepeatSequence >> isSimpleRepeat [
	" Answer <true> if receiver repeat structure is simple "

	^ self repeatStructure = #simple
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> leftFlankSize [
	"Answer the size of the left flanking region"

	^ flankingRegionLeft
		  ifNil: [ 0 ]
		  ifNotNil: [ flankingRegionLeft size ]
]

{ #category : 'accessing' }
BioRepeatSequence >> locus [
	" Answer the receiver's <BioLocus> "

	^ locus
]

{ #category : 'accessing' }
BioRepeatSequence >> locus: aBioLocus [
	" Set the receiver's locus to aBioLocus "
	
	locus := aBioLocus
]

{ #category : 'accessing' }
BioRepeatSequence >> locusName [
	" Answer a <String> with receiver's locus name "
	
	^ self locus name
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> markerCode [

	^ markerCode
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> markerCode: aString [
	markerCode := aString
]

{ #category : 'defaults' }
BioRepeatSequence >> maxMotifSize [
	" See comment in #defaultMotifRange "
	
	^ maxMotifSize
		ifNil: [ maxMotifSize := self defaultMaxMotifSize ]
]

{ #category : 'defaults' }
BioRepeatSequence >> minMotifSize [
	" See comment in #defaultMotifRange "
	
	^ minMotifSize
		ifNil: [ minMotifSize := self defaultMinMotifSize ]
]

{ #category : 'accessing' }
BioRepeatSequence >> motif [
	"Answer the repeat motif"
	^ motifSequence
]

{ #category : 'accessing' }
BioRepeatSequence >> motif: aString [
	motifSequence := aString
]

{ #category : 'defaults' }
BioRepeatSequence >> motifRange [
	" Answer an <Interval> representing the size range allowed for the receiver, using as reference: Microsatellite definition at the US National Library of Medicine Medical Subject Headings (MeSH) "

	^ self minMotifSize to: self maxMotifSize

]

{ #category : 'accessing' }
BioRepeatSequence >> motifSize [
	^ (self motif ifNil: [ ^ 0 ]) size
]

{ #category : 'private' }
BioRepeatSequence >> nullValue [

	^ 9 negated
]

{ #category : 'accessing' }
BioRepeatSequence >> positions [
	" Answer an <Association> with receiver's allelic positions "

	^ self start -> self end 
]

{ #category : 'accessing' }
BioRepeatSequence >> positions: anObject [
	
	anObject setMicrosatelliteGenotypeFor: self
]

{ #category : 'printing' }
BioRepeatSequence >> printOn: aStream [
    " Private - See superimplementor's comment "
   
    super printOn: aStream.
    self locus notNil
        ifTrue: [
            aStream
                nextPutAll: ' - ';
                nextPutAll: self locusName; space ].
"    self genotype notNil
        ifTrue: [ aStream
                        nextPutAll: ' - ';
                        nextPutAll: self genotype asString; space ].
    (self alleleRangeStart notNil and: [ self alleleRangeEnd notNil  ])
        ifTrue: [
            aStream
                space;
                nextPutAll: self alleleRangeStart asString;
                nextPutAll: ' - ';
                nextPutAll: self alleleRangeEnd asString ]"

]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> referenceAllele [

	^ self genotype alleleA
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> repeatCopyNumber [
	"Calculate actual repeat count from the sequence"

	| motif count pos |
	motif := self motif.
	motif ifNil: [ ^ 0 ].
	count := 0.
	pos := 1.
	[ pos <= (self sequence size - motif size + 1) ] whileTrue: [
			(self sequence copyFrom: pos to: pos + motif size - 1) = motif
				ifTrue: [
						count := count + 1.
						pos := pos + motif size ]
				ifFalse: [ pos := pos + 1 ] ].
	^ count
]

{ #category : 'accessing - private' }
BioRepeatSequence >> repeatStructure [
	^ repeatStructure
]

{ #category : 'accessing - private' }
BioRepeatSequence >> repeatStructure: aSymbol [

	repeatStructure := aSymbol
]

{ #category : 'accessing' }
BioRepeatSequence >> repeats [
	^ repeats
]

{ #category : 'accessing' }
BioRepeatSequence >> repeats: anObject [
	repeats := anObject
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> rightFlankSize [
	"Answer the size of the right flanking region"

	^ flankingRegionRight
		  ifNil: [ 0 ]
		  ifNotNil: [ flankingRegionRight size ]
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> sequenceWithFlanks [
	"Answer the full sequence including flanking regions"
	^ String streamContents: [ :s |
		flankingRegionLeft ifNotNil: [ s nextPutAll: flankingRegionLeft ].
		s nextPutAll: self asString.
		flankingRegionRight ifNotNil: [ s nextPutAll: flankingRegionRight ] ]
]

{ #category : 'accessing' }
BioRepeatSequence >> start [
	" Answer an <Integer> with the receiver's genotype start position "
	
	^ self genotype start
]

{ #category : 'accessing' }
BioRepeatSequence >> start: anObject [
	" Set anObject as the receiver's genotype start position "
	
	^ self genotype start: (self validatePosition: anObject)
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> strand [

	^ strand ifNil: [ strand := 1 ]
]

{ #category : 'as yet unclassified' }
BioRepeatSequence >> strand: anInteger [
	strand := anInteger
]

{ #category : 'private' }
BioRepeatSequence >> validatePosition: anObject [
	" Answer a <Number> matching aString "

	anObject isNumber 
		ifTrue: [ ^ anObject ].
	^ (anObject notNil and: [ anObject isAllDigits ])
		ifFalse: [ self nullValue negated ]
		ifTrue: [ anObject asNumber ]
]

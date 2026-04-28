Class {
	#name : 'BioGenomicRanges',
	#superclass : 'BioObject',
	#instVars : [
		'seqnames',
		'ranges',
		'strands',
		'metadata',
		'seqinfo',
		'ignoreStrandFlag'
	],
	#category : 'BioTools-Genomic-Ranges',
	#package : 'BioTools',
	#tag : 'Genomic-Ranges'
}

{ #category : 'examples' }
BioGenomicRanges class >> example01Basic [

	<example>
	| gr gr2 hits reduced bed gff df |
	"Create GRanges-like object"
	gr := self
		      seqnames: #( 'chr1' 'chr1' 'chr2' )
		      starts: #( 1 10 5 )
		      ends: #( 5 20 8 )
		      strands: #( '+' '-' '*' )
		      metadata: (Dictionary new
				       at: #gene put: #( 'A' 'B' 'C' );
				       yourself).

	"Shift and reduce"
	gr2 := gr + 2.
	reduced := gr2 reduce.

	"Overlap queries"
	hits := gr findOverlaps: gr2.

	"Export"
	bed := gr asBEDString.
	gff := gr asGFFString.
	df := gr asDataFrame.

	{
		(#original -> gr).
		(#shifted -> gr2).
		(#reduced -> reduced).
		(#hits -> hits).
		(#bed -> bed).
		(#gff -> gff).
		(#dataFrame -> df) } inspect
]

{ #category : 'examples' }
BioGenomicRanges class >> example02Basic [

	<example>
	| gr gr2 overlaps inter unioned bed gff |
	gr := BioGenomicRanges
		      seqnames: #( 'chr1' 'chr1' 'chr2' )
		      starts: #( 1 10 5 )
		      ends: #( 5 20 8 )
		      strands: #( '+' '-' '*' )
		      metadata: (Dictionary new
				       at: #gene put: #( 'A' 'B' 'C' );
				       yourself).

	gr2 := BioGenomicRanges
		       seqnames: #( 'chr1' 'chr2' )
		       starts: #( 4 1 )
		       ends: #( 12 6 )
		       strands: #( '+' '*' )
		       metadata: Dictionary new.

	overlaps := gr findOverlaps: gr2.

	inter := gr intersect: gr2.
	unioned := gr union: gr2.

	bed := gr asBEDString.
	gff := gr asGFFString.

	{
		(#gr -> gr).
		(#gr2 -> gr2).
		(#overlaps -> overlaps).
		(#intersection -> inter).
		(#union -> unioned).
		(#bed -> bed).
		(#gff -> gff).
		(#dataFrame -> gr asDataFrame) } inspect
]

{ #category : 'instance creation' }
BioGenomicRanges class >> fromBED: aString [
	| lines seq starts ends strands names scores |
	lines := (aString findTokens: String crlf) reject: [ :ln | ln isEmpty or: [ ln first = $# ] ].
	seq := OrderedCollection new.
	starts := OrderedCollection new.
	ends := OrderedCollection new.
	strands := OrderedCollection new.
	names := OrderedCollection new.
	scores := OrderedCollection new.
	lines do: [ :ln |
		| f |
		f := ln findTokens: Character tab asString.
		f size >= 3 ifFalse: [ self error: 'Invalid BED line: ', ln ].
		seq add: (f at: 1).
		"BED start is 0-based half-open; convert to 1-based inclusive"
		starts add: ((f at: 2) asInteger + 1).
		ends add: ((f at: 3) asInteger).
		f size >= 4 ifTrue: [ names add: (f at: 4) ] ifFalse: [ names add: nil ].
		f size >= 5 ifTrue: [ scores add: (f at: 5) ] ifFalse: [ scores add: nil ].
		f size >= 6 ifTrue: [ strands add: (f at: 6) ] ifFalse: [ strands add: '*' ] ].
	^ self
		seqnames: seq
		starts: starts
		ends: ends
		strands: strands
		metadata: (Dictionary new
			at: #name put: names asArray;
			at: #score put: scores asArray;
			yourself)

]

{ #category : 'instance creation' }
BioGenomicRanges class >> fromDataFrame: aDictionary [
	| seq starts ends strands md |
	seq := (aDictionary at: #seqnames ifAbsent: [ aDictionary at: 'seqnames' ]).
	starts := (aDictionary at: #start ifAbsent: [ aDictionary at: 'start' ]).
	ends := (aDictionary at: #end ifAbsent: [ aDictionary at: 'end' ]).
	strands := (aDictionary at: #strand ifAbsent: [ aDictionary at: 'strand' ifAbsent: [ Array new: seq size withAll: '*' ] ]).
	md := aDictionary copy.
	md removeKey: #seqnames ifAbsent: [ md removeKey: 'seqnames' ifAbsent: [ ] ].
	md removeKey: #start ifAbsent: [ md removeKey: 'start' ifAbsent: [ ] ].
	md removeKey: #end ifAbsent: [ md removeKey: 'end' ifAbsent: [ ] ].
	md removeKey: #strand ifAbsent: [ md removeKey: 'strand' ifAbsent: [ ] ].
	^ self seqnames: seq starts: starts ends: ends strands: strands metadata: md
]

{ #category : 'instance creation' }
BioGenomicRanges class >> fromGFF: aString [
	| lines seq starts ends strands type source phase score attr |
	lines := (aString findTokens: String crlf) reject: [ :ln | ln isEmpty or: [ ln first = $# ] ].
	seq := OrderedCollection new.
	starts := OrderedCollection new.
	ends := OrderedCollection new.
	strands := OrderedCollection new.
	type := OrderedCollection new.
	source := OrderedCollection new.
	phase := OrderedCollection new.
	score := OrderedCollection new.
	attr := OrderedCollection new.
	lines do: [ :ln |
		| f |
		f := ln findTokens: Character tab asString.
		f size < 9 ifTrue: [ self error: 'Invalid GFF3 line: ', ln ].
		seq add: (f at: 1).
		source add: (f at: 2).
		type add: (f at: 3).
		starts add: (f at: 4) asInteger.
		ends add: (f at: 5) asInteger.
		score add: (f at: 6).
		strands add: (f at: 7).
		phase add: (f at: 8).
		attr add: (f at: 9) ].
	^ self
		seqnames: seq
		starts: starts
		ends: ends
		strands: strands
		metadata: (Dictionary new
			at: #source put: source asArray;
			at: #type put: type asArray;
			at: #score put: score asArray;
			at: #phase put: phase asArray;
			at: #attributes put: attr asArray;
			yourself)
]

{ #category : 'instance creation' }
BioGenomicRanges class >> newWithSeqnames: seqCollection ranges: aBioIRanges strand: strandCollection [
	^ self newWithSeqnames: seqCollection ranges: aBioIRanges strand: strandCollection metadata: Dictionary new
]

{ #category : 'instance creation' }
BioGenomicRanges class >> newWithSeqnames: seqCollection ranges: aBioIRanges strand: strandCollection metadata: aDictionary [
	| size strandObjs |
	size := seqCollection size.
	(size = aBioIRanges size and: [ size = strandCollection size ]) ifFalse: [
		self error: 'All vectors must have same size' ].
	strandObjs := strandCollection collect: [ :s | (s isKindOf: BioStrand) ifTrue: [ s ] ifFalse: [ BioStrand from: s ] ].
	^ self new
		seqnames: seqCollection asArray;
		ranges: aBioIRanges;
		strands: strandObjs asArray;
		metadata: (aDictionary ifNil: [ Dictionary new ]);
		seqinfo: Dictionary new;
		ignoreStrand: false;
		yourself
]

{ #category : 'instance creation' }
BioGenomicRanges class >> seqnames: seqCollection starts: startCollection ends: endCollection strands: strandCollection metadata: aDictionary [
	| ir |
	ir := BioIRanges starts: startCollection ends: endCollection.
	^ self newWithSeqnames: seqCollection ranges: ir strand: strandCollection metadata: aDictionary

]

{ #category : 'accessing' }
BioGenomicRanges >> + delta [
	^ self plus: delta
]

{ #category : 'accessing' }
BioGenomicRanges >> - delta [
	^ self plus: delta negated
]

{ #category : 'accessing' }
BioGenomicRanges >> addMetadata: valueCollection at: aKey [
	(valueCollection size = self size) ifFalse: [ self error: 'Metadata column size mismatch' ].
	self metadata at: aKey put: valueCollection asArray.
	^ self

]

{ #category : 'convert' }
BioGenomicRanges >> asBEDString [
	| out |
	out := String streamContents: [ :s |
		1 to: self size do: [ :i |
			s
				nextPutAll: (self seqnames at: i) asString; nextPut: Character tab;
				nextPutAll: ((ranges startAt: i) - 1) asString; nextPut: Character tab;
				nextPutAll: (ranges endAt: i) asString; nextPut: Character tab;
				nextPutAll: ((self metadata at: #name ifAbsent: [ Array new: self size withAll: '.' ]) at: i) asString; nextPut: Character tab;
				nextPutAll: ((self metadata at: #score ifAbsent: [ Array new: self size withAll: '0' ]) at: i) asString; nextPut: Character tab;
				nextPutAll: (self strand at: i) symbol asString.
			i < self size ifTrue: [ s cr ] ] ].
	^ out
]

{ #category : 'convert' }
BioGenomicRanges >> asDataFrame [
	| d |
	d := Dictionary new.
	d at: #seqnames put: self seqnames copy.
	d at: #start put: self start copy.
	d at: #end put: self end copy.
	d at: #strand put: ((self strand collect: [ :st | st symbol asString ]) asArray).
	self metadata keysAndValuesDo: [ :k :v | d at: k put: v ].
	^ d
]

{ #category : 'convert' }
BioGenomicRanges >> asGFFString [
	| out |
	out := String streamContents: [ :s |
		1 to: self size do: [ :i |
			s
				nextPutAll: (self seqnames at: i) asString; nextPut: Character tab;
				nextPutAll: ((self metadata at: #source ifAbsent: [ Array new: self size withAll: '.' ]) at: i) asString; nextPut: Character tab;
				nextPutAll: ((self metadata at: #type ifAbsent: [ Array new: self size withAll: 'region' ]) at: i) asString; nextPut: Character tab;
				nextPutAll: (ranges startAt: i) asString; nextPut: Character tab;
				nextPutAll: (ranges endAt: i) asString; nextPut: Character tab;
				nextPutAll: ((self metadata at: #score ifAbsent: [ Array new: self size withAll: '.' ]) at: i) asString; nextPut: Character tab;
				nextPutAll: (self strand at: i) symbol asString; nextPut: Character tab;
				nextPutAll: ((self metadata at: #phase ifAbsent: [ Array new: self size withAll: '.' ]) at: i) asString; nextPut: Character tab;
				nextPutAll: ((self metadata at: #attributes ifAbsent: [ Array new: self size withAll: '.' ]) at: i) asString.
			i < self size ifTrue: [ s cr ] ] ].
	^ out
]

{ #category : 'accessing' }
BioGenomicRanges >> at: anIndex [

	| gr md |
	md := Dictionary new.
	self metadata keysAndValuesDo: [ :k :v |
			(v isCollection and: [ v size = self size ])
				ifTrue: [ md at: k put: (v at: anIndex) ]
				ifFalse: [ md at: k put: v ] ].
	gr := BioGenomicRange
		      seqname: (self seqnames at: anIndex)
		      start: (ranges startAt: anIndex)
		      end: (ranges endAt: anIndex)
		      strand: (self strand at: anIndex) asString.
	gr metadata: md.
	^ gr
]

{ #category : 'accessing' }
BioGenomicRanges >> copyWithSeqnames: aCollection [
	aCollection size = self size
		ifFalse: [ self error: 'Size mismatch' ].
	^ self class
		newWithSeqnames: aCollection
		ranges: ranges
		strand: self strand
		metadata: self metadata copy
]

{ #category : 'accessing' }
BioGenomicRanges >> countOverlaps: anotherGR [
	| counts |
	counts := Array new: self size withAll: 0.
	(self findOverlaps: anotherGR) do: [ :assoc |
		counts at: assoc key put: ((counts at: assoc key) + 1) ].
	^ counts
]

{ #category : 'accessing' }
BioGenomicRanges >> disjoin [
	"Return sorted non-overlapping atomic intervals per seqname/strand."

	^ self reduce.

]

{ #category : 'accessing' }
BioGenomicRanges >> end [
	^ ranges end
]

{ #category : 'accessing' }
BioGenomicRanges >> findOverlaps: anotherGR [

	| hits ignore |
	hits := OrderedCollection new.
	ignore := ignoreStrandFlag ifNil: [ false ].
	1 to: self size do: [ :i |
			| a |
			a := self at: i.
			1 to: anotherGR size do: [ :j |
					| b |
					b := anotherGR at: j.
					(a overlaps: b ignoreStrand: ignore) ifTrue: [ hits add: i -> j ] ] ].
	^ hits asArray
]

{ #category : 'accessing' }
BioGenomicRanges >> flipStrand [
	strands := (self strand collect: [ :s | s flip ]) asArray.
	^ self
]

{ #category : 'accessing' }
BioGenomicRanges >> ignoreStrand [
	ignoreStrandFlag := true.
	^ self
]

{ #category : 'accessing' }
BioGenomicRanges >> ignoreStrand: aBoolean [
	ignoreStrandFlag := aBoolean
]

{ #category : 'accessing' }
BioGenomicRanges >> ignoreStrandFlag [

	^ ignoreStrandFlag
]

{ #category : 'accessing' }
BioGenomicRanges >> ignoreStrandFlag: anObject [

	ignoreStrandFlag := anObject
]

{ #category : 'accessing' }
BioGenomicRanges >> intersect [
	"Self-intersection as reduced disjoint pieces that have multiplicity > 1 is not implemented in v1."
	^ self disjoin
]

{ #category : 'testing' }
BioGenomicRanges >> isEmpty [
	^ self size = 0
]

{ #category : 'accessing' }
BioGenomicRanges >> mcols [
	^ self metadata
]

{ #category : 'accessing' }
BioGenomicRanges >> mcols: aDictionary [
	metadata := aDictionary
]

{ #category : 'accessing' }
BioGenomicRanges >> metadata [

	^ metadata ifNil: [ metadata := Dictionary new ]
]

{ #category : 'accessing' }
BioGenomicRanges >> metadata: anObject [

	metadata := anObject
]

{ #category : 'accessing' }
BioGenomicRanges >> overlapWith: anotherGR [
	| hits indices |
	hits := self findOverlaps: anotherGR.
	indices := (hits collect: [ :assoc | assoc key ]) asSet asOrderedCollection sort.
	^ self subsetAtIndices: indices
]

{ #category : 'accessing' }
BioGenomicRanges >> plus: delta [
	| newStarts newEnds |
	newStarts := self start collect: [ :s | s + delta ].
	newEnds := self end collect: [ :e | e + delta ].
	^ self class
		newWithSeqnames: self seqnames
		ranges: (BioIRanges starts: newStarts ends: newEnds)
		strand: self strand
		metadata: self metadata copy
]

{ #category : 'printing' }
BioGenomicRanges >> printOn: aStream [
	aStream
		nextPutAll: 'BioGenomicRanges(';
		nextPutAll: self size asString;
		nextPutAll: ' ranges)'
]

{ #category : 'accessing' }
BioGenomicRanges >> ranges [

	^ ranges
]

{ #category : 'accessing' }
BioGenomicRanges >> ranges: anObject [

	ranges := anObject
]

{ #category : 'accessing' }
BioGenomicRanges >> reduce [
	| tuples grouped outSeq outStart outEnd outStrand |
	self isEmpty ifTrue: [ ^ self ].
	tuples := OrderedCollection new.
	1 to: self size do: [ :i |
		tuples add: { self seqnames at: i . ranges startAt: i . ranges endAt: i . self strand at: i } ].
	grouped := Dictionary new.
	tuples do: [ :t |
		| key |
		key := { t first. (t fourth symbol) }.
		(grouped at: key ifAbsentPut: [ OrderedCollection new ]) add: (t second -> t third) ].
	outSeq := OrderedCollection new.
	outStart := OrderedCollection new.
	outEnd := OrderedCollection new.
	outStrand := OrderedCollection new.
	grouped keysAndValuesDo: [ :key :intervals |
		| sorted curS curE |
		sorted := intervals asArray sort: [ :a :b | a key < b key ].
		curS := sorted first key.
		curE := sorted first value.
		2 to: sorted size do: [ :i |
			| s e |
			s := (sorted at: i) key.
			e := (sorted at: i) value.
			s <= (curE + 1)
				ifTrue: [ curE := curE max: e ]
				ifFalse: [
					outSeq add: key first.
					outStart add: curS.
					outEnd add: curE.
					outStrand add: (BioStrand from: key second asString).
					curS := s.
					curE := e ] ].
		outSeq add: key first.
		outStart add: curS.
		outEnd add: curE.
		outStrand add: (BioStrand from: key second asString) ].
	^ self class
		newWithSeqnames: outSeq
		ranges: (BioIRanges starts: outStart ends: outEnd)
		strand: outStrand
		metadata: Dictionary new
]

{ #category : 'accessing' }
BioGenomicRanges >> reject: aBlock [

	^ self select: [ :each | (aBlock value: each) not ]
]

{ #category : 'accessing' }
BioGenomicRanges >> select: aBlock [
	| idx |
	idx := OrderedCollection new.
	1 to: self size do: [ :i | (aBlock value: (self at: i)) ifTrue: [ idx add: i ] ].
	^ self subsetAtIndices: idx
]

{ #category : 'accessing' }
BioGenomicRanges >> seqinfo [
	^ seqinfo ifNil: [ seqinfo := Dictionary new ]
]

{ #category : 'accessing' }
BioGenomicRanges >> seqinfo: anObject [

	seqinfo := anObject
]

{ #category : 'accessing' }
BioGenomicRanges >> seqnames [

	^ seqnames ifNil: [ #() ]
]

{ #category : 'accessing' }
BioGenomicRanges >> seqnames: aCollection [
	seqnames := aCollection asArray
]

{ #category : 'accessing' }
BioGenomicRanges >> setdiff [
	"Set difference against self is empty. Included for API compatibility."
	^ self class
		newWithSeqnames: #()
		ranges: (BioIRanges starts: #() ends: #())
		strand: #()
		metadata: Dictionary new
]

{ #category : 'accessing' }
BioGenomicRanges >> size [
	^ self seqnames size
]

{ #category : 'accessing' }
BioGenomicRanges >> start [
	^ ranges start
]

{ #category : 'accessing' }
BioGenomicRanges >> strand [
	^ strands ifNil: [ #() ]
]

{ #category : 'accessing' }
BioGenomicRanges >> strands [
	^ self strand
]

{ #category : 'accessing' }
BioGenomicRanges >> strands: aCollection [
	strands := aCollection asArray
]

{ #category : 'accessing' }
BioGenomicRanges >> subsetAtIndices: indexCollection [
	| newSeq newStarts newEnds newStrands newMd |
	newSeq := indexCollection collect: [ :i | self seqnames at: i ].
	newStarts := indexCollection collect: [ :i | ranges startAt: i ].
	newEnds := indexCollection collect: [ :i | ranges endAt: i ].
	newStrands := indexCollection collect: [ :i | (self strand at: i) ].
	newMd := Dictionary new.
	self metadata keysAndValuesDo: [ :k :v |
		(v isCollection and: [ v size = self size ])
			ifTrue: [ newMd at: k put: (indexCollection collect: [ :i | v at: i ]) asArray ]
			ifFalse: [ newMd at: k put: v ] ].
	^ self class
		newWithSeqnames: newSeq
		ranges: (BioIRanges starts: newStarts ends: newEnds)
		strand: newStrands
		metadata: newMd
]

{ #category : 'accessing' }
BioGenomicRanges >> union [
	"Union within object: concat then reduce."
	^ self reduce
]

{ #category : 'accessing' }
BioGenomicRanges >> width [
	^ ranges width
]

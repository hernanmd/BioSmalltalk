"
Represents a multiple alignment of sequences

    Instance Variables
	set:		<Collection>

"
Class {
	#name : 'BioAlignment',
	#superclass : 'BioNamedObject',
	#instVars : [
		'set',
		'consensusStrategy',
		'isReference'
	],
	#category : 'BioTools-Align',
	#package : 'BioTools',
	#tag : 'Align'
}

{ #category : 'accessing' }
BioAlignment >> addFastaRecord: fastaRecord [
	" Add anObject to the alignment "
	
	^ self addSequence: fastaRecord sequence named: fastaRecord sequenceName
]

{ #category : 'accessing' }
BioAlignment >> addFromSequence: aBioSequence [
	" Add aBioSequence to the receiver's alignments "
	
	set addLast: aBioSequence
]

{ #category : 'accessing' }
BioAlignment >> addFromSequences: aSequenceCollection [
	" Add aSequenceCollection to the receiver's alignments "
	
	aSequenceCollection do: [ : seq | self addSequence: seq asSequence ]

]

{ #category : 'accessing' }
BioAlignment >> addSequence: anObject [
	" Add anObject to the alignment "
	
	^ anObject addToAlignment: self
]

{ #category : 'accessing' }
BioAlignment >> addSequence: anObject named: seqName [
	" Add anObject to the alignment "
	
	^ anObject addToAlignment: self named: seqName
]

{ #category : 'accessing' }
BioAlignment >> addToFastaMultiRecord: aBSTFastaMultiRecord [
	" Add the receiver's sequences to aBSTFastaMultiRecord "
	
	aBSTFastaMultiRecord sequences: self sequences
]

{ #category : 'accessing' }
BioAlignment >> alignMaxSize [
	"Answer the maximum length of sequences in the alignment "
	
	^ (self sequences detectMax: #size) size
]

{ #category : 'accessing' }
BioAlignment >> alignMinSize [
	" Answer the minimum length of sequences in the alignment "
	
	^ (self sequences detectMin: #size) size
]

{ #category : 'accessing' }
BioAlignment >> anyOne [ 
	" Answer a <BioSequence> representative sample of the receiver "

	^ set anyOne
]

{ #category : 'converting' }
BioAlignment >> asFasta [
	" Answer the receiver as a MultiFasta record object "
	
	^ self asMultiFasta
]

{ #category : 'converting' }
BioAlignment >> asMultiFasta [
	" Answer the receiver as a MultiFasta record object "
	
	^ BioFastaMultiRecord from: self sequences
]

{ #category : 'converting' }
BioAlignment >> asMultiFastaString [
	" Answer the receiver as a MultiFasta record object "
	
	^ self asMultiFasta asString
]

{ #category : 'converting' }
BioAlignment >> asString [
	" Answer a String representation of the receiver "
	
	^ String streamContents: [ : stream |
		self sequences do: [ : seq | 
			stream nextPutAll: seq asString.
			seq name 
				ifNotNil: [ : seqName | 
					stream 
						space;
						nextPutAll: seqName ].
			stream cr ] ]
]

{ #category : 'accessing' }
BioAlignment >> at: anObject [
	" Answer a Sequence or a Collection of Sequences at anObject "
	
	^ anObject alignmentAt: self
]

{ #category : 'accessing' }
BioAlignment >> atAccession: aBioAccession [
	" Answer a <BioSequence> identified by aBioAccession "
	
	^ set 
		detect: [ : sequence | sequence accessionName name = aBioAccession name ]
		ifNone: [ self signalAlignmentNotFound: aBioAccession name ]
]

{ #category : 'accessing' }
BioAlignment >> atAccession: accessionString ifPresent: aBlock [

	| found |
	
	found := self sequences
		detect: [ : sequence | sequence name asLowercase = accessionString asLowercase ]
		ifNone: [ nil ].
	^ found
		ifNotNil: aBlock
		ifNil: [ self signalAlignmentNotFound: accessionString ] 
]

{ #category : 'accessing' }
BioAlignment >> atAlignment: alignNumber [
	" Answer a Collection with the receiver's sequences at alignNumber position "
	
	^ (alignNumber between: 1 and: self size)
		ifTrue: [ self sequences at: alignNumber ]
		ifFalse: [ self signalInvalidObject: alignNumber asString , ' is out of range in the receiver''s sequences' ]
]

{ #category : 'accessing' }
BioAlignment >> atAlignments: anInterval [
	" Answer a Collection with the receiver's sequences at alignNumber position "
	
	^ (anInterval first >= 1 and: [ anInterval last <= self numberOfBases ])
		ifTrue: [ self copyFrom: anInterval first to: anInterval last ]
		ifFalse: [ self signalInvalidObject: anInterval asString , ' is out of range in the receiver''s sequences' ]
]

{ #category : 'accessing' }
BioAlignment >> atColumn: aColumnSpec [
	" Answer a <BioSequence> with the receiver's sequences at aColumnSpec position(s) "
	
	^ BioSequence newWith: (aColumnSpec atColumnFromBioAlignment: self)
]

{ #category : 'accessing' }
BioAlignment >> atColumns: aColumnRangeSpec [
	" Answer a <String> with the receiver's sequences at aColumnSpec position(s) "
	
	^ aColumnRangeSpec atColumnFromBioAlignment: self
]

{ #category : 'accessing' }
BioAlignment >> beReference [
	" Set the receiver's to be a reference alignment "
	
	self isReference: true.
]

{ #category : 'enumerating' }
BioAlignment >> collect: aBlock [ 
	" Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into a collection like the receiver. Answer  
	the new collection."

	^ set collect: aBlock
]

{ #category : 'scoring' }
BioAlignment >> columnScore [
	"Answer the column score - fraction of columns with all matching residues.
    A column scores 1 if all residues match, 0 otherwise."

	| matchingColumns |
	matchingColumns := 0.
	1 to: self numberOfBases do: [ :col |
			(self isConservedAt: col) ifTrue: [
				matchingColumns := matchingColumns + 1 ] ].
	^ matchingColumns asFloat / self numberOfBases asFloat
]

{ #category : 'accessing' }
BioAlignment >> consensus [
	" Consensus sequence is the calculated order of most frequent residues, either nucleotide or amino acid, found at each position in a sequence alignment. Only DNA and RNA sequences are valid. 
	Answer a <BioSequence> representing the consensus sequence "

	| consensusSeq |
	
	consensusSeq := BioMutableSeq newWith: (String new: self numberOfBases) alphabet: BioIUPACAmbiguousDNA.
	1 to: self numberOfBases do: [ : index | consensusSeq at: index put: (self consensusAt: (self atColumn: index)) ].
    ^ consensusSeq
]

{ #category : 'private' }
BioAlignment >> consensusAt: anObject [ 
	" See comment in bioConsensusFor: "

	^ anObject bioConsensusFor: self 

]

{ #category : 'private' }
BioAlignment >> consensusStrategy [

	^ consensusStrategy
		ifNil: [ consensusStrategy := self defaultConsensusStrategy ]
]

{ #category : 'accessing' }
BioAlignment >> copyFrom: startIndex to: stopIndex [
	" Answer a String representation of the receiver "
	
	^ startIndex <= stopIndex
		ifTrue: [ self sequences copyFrom: startIndex to: stopIndex ]
		ifFalse: [ self signalInvalidObject: 'First index should be minor or equal than stop index' ]
]

{ #category : 'defaults' }
BioAlignment >> defaultConsensusStrategy [

	^ BioDummyConsensusStrategy new
]

{ #category : 'scoring' }
BioAlignment >> defaultSubstitutionMatrix [

	^ BioSubstitutionMatrix blosum62
]

{ #category : 'enumerating' }
BioAlignment >> do: aBlock [
	" Evaluate aBlock with each of the receiver's set as the argument. "
	
	^ set do: aBlock
]

{ #category : 'enumerating' }
BioAlignment >> do: aBlockClosure displayingProgress: aString [ 
	"Evaluate aBlock with each of the receiver's set as the argument."

	^ set do: aBlockClosure displayingProgress: aString
]

{ #category : 'enumerating' }
BioAlignment >> doWithIndex: aFullBlockClosure [ 

	self sequences doWithIndex: aFullBlockClosure 
]

{ #category : 'scoring' }
BioAlignment >> entropyAtColumn: colIndex [

	| column counts total entropy |
	column := self atColumn: colIndex.
	counts := Dictionary new.
	total := 0.
	column do: [ :c |
			(c ~= $- and: [ c isLetter ]) ifTrue: [
					counts
						at: c asUppercase
						put: (counts at: c asUppercase ifAbsent: [ 0 ]) + 1.
					total := total + 1 ] ].
	total = 0 ifTrue: [ ^ 0.0 ].
	entropy := 0.0.
	counts valuesDo: [ :count |
			| p |
			p := count asFloat / total asFloat.
			entropy := entropy + (p * p ln) ].
	^ entropy negated
]

{ #category : 'accessing' }
BioAlignment >> first [
	" Return a <BioSequence> representing the first element in the receiver "

	^ self at: 1
]

{ #category : 'accessing' }
BioAlignment >> head: aNumber [
	" Answer the first aNumber of <BioSequence> in the receiver "
	
	^ self sequences first: aNumber
]

{ #category : 'initialization' }
BioAlignment >> initialize [
	" Private - Initialize the receiver's contents "

	super initialize.
	set := OrderedCollection new
]

{ #category : 'scoring' }
BioAlignment >> isConservedAt: colIndex [

	| column seen |
	column := self atColumn: colIndex.
	seen := Set new.
	column do: [ :c | c ~= $- ifTrue: [ seen add: c asUppercase ] ].
	^ seen size = 1
]

{ #category : 'testing' }
BioAlignment >> isEmpty [
	" Answer whether the receiver contains any elements. "
	
	^ set isEmpty
]

{ #category : 'testing' }
BioAlignment >> isReference [
	" Answer a <Boolean> if the receiver represents a reference alignment, an usually well-annotated set of sequences "

	^ isReference
		ifNil: [ isReference := false ]
]

{ #category : 'testing' }
BioAlignment >> isReference: aBoolean [
	" Set aBoolean to <true> if the receiver represents a reference alignment, an usually well-annotated set of sequences "
	
	isReference := aBoolean
]

{ #category : 'accessing' }
BioAlignment >> last [
	"Return the last element in the receiver"

	^ self at: self size
]

{ #category : 'accessing' }
BioAlignment >> longestConsecutive: aCharacter [
	" Answer the sequence in the receiver with the longest substring containing only letter for each element of aCharacter.
	
	From Biostrings: 
		v = c('AAACTGTGFG', 'GGGAATT', 'CCAAAAAAAAAATT')
		longestConsecutive(v, 'A') "

	self sequences max: [ : seq | seq longestConsecutive: aCharacter ]
]

{ #category : 'accessing' }
BioAlignment >> maxSequenceLength [
	"Answer a <Number> representing the sequence of maximum length in the receiver."
	
	^ self sequences max: #size
]

{ #category : 'accessing' }
BioAlignment >> numberOfBases [
	" Answer a <Number> with the receiver's sequence size (considering all having the same size) "
	
	^ self sequences first size

]

{ #category : 'printing' }
BioAlignment >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream
		space;
		nextPutAll: self size between: $[ and: $];
		space.
	set do: [ : seq |
		aStream 
			cr;
			nextPutAll: seq asString ]
]

{ #category : 'filtering' }
BioAlignment >> rejectTaxa: taxaNameOrCollectionOfTaxons [
	"Answer a <Collection> of <BioSequence> removing the sequences annotated with taxaName "
	
	^ taxaNameOrCollectionOfTaxons rejectFromBioAlignment: self
]

{ #category : 'accessing' }
BioAlignment >> select: aBlock [
	"Refer to the comment in Collection|select:."

	set := self sequences select: aBlock.
]

{ #category : 'accessing' }
BioAlignment >> sequenceNames [
	" Answer a Collection of receiver's alignments names. If any or all of the receiver's sequences are unnamed, then assign a numeric identifier corresponding to the position in the receiver's alignment set "
	
	| alignNames |
	
	alignNames := OrderedCollection new: set size.
	set doWithIndex: [ : seq : index | 
		alignNames add: (seq name
				ifNil: [ index asString ]
				ifNotNil: [ seq name ]) ].
	^ alignNames
		
]

{ #category : 'accessing' }
BioAlignment >> sequenceStrings [
	" Answer a <Collection> of receiver's alignments String's "
	
	^ set collect: #asString
]

{ #category : 'accessing' }
BioAlignment >> sequences [
	" Answer a Collection of the receiver's sequences "
	
	^ set
]

{ #category : 'private' }
BioAlignment >> signalAlignmentNotFound: accessionString [
	" Private - Signal an exception "
	
	self signalNotFound: (String streamContents: [ : stream |
		stream
			nextPutAll: 'Alignment not found for accession: ' translated;
			nextPutAll: accessionString ])
]

{ #category : 'accessing' }
BioAlignment >> size [
	"Answer how many sequences the receiver contains."
	
	^ set size
]

{ #category : 'scoring' }
BioAlignment >> sumOfPairsAtColumn: colIndex matrix: matrix [
	"Answer the sum-of-pairs score for a single column."

	| column score |
	column := self atColumn: colIndex.
	score := 0.
	1 to: column size do: [ :i |
			i + 1 to: column size do: [ :j |
					| c1 c2 |
					c1 := column at: i.
					c2 := column at: j.
					(c1 = $- or: [ c2 = $- ])
						ifTrue: [ score := score + matrix gapOpenPenalty ]
						ifFalse: [ score := score + (matrix score: c1 with: c2) ] ] ].
	^ score
]

{ #category : 'scoring' }
BioAlignment >> sumOfPairsScore [
	"Answer the Sum-of-Pairs (SP) score for the receiver's alignment.
    The SP score is the sum of all pairwise alignment scores for each column.
    Uses BLOSUM62 for proteins, nucleotide default for DNA."

	| matrix total |
	matrix := self defaultSubstitutionMatrix.
	total := 0.
	1 to: self numberOfBases do: [ :col |
		total := total + (self sumOfPairsAtColumn: col matrix: matrix) ].
	^ total
]

{ #category : 'scoring' }
BioAlignment >> sumOfPairsScoreWithMatrix: aMatrix [
	"Answer the Sum-of-Pairs score using the specified substitution matrix."

	| total |
	total := 0.
	1 to: self numberOfBases do: [ :col |
		total := total + (self sumOfPairsAtColumn: col matrix: aMatrix) ].
	^ total
]

{ #category : 'scoring' }
BioAlignment >> totalColumnScore [
	"Answer the TC (Total Column) score - fraction of correctly aligned columns 
    compared to a reference alignment. Returns 1.0 if no reference set."

	| reference |
	reference := self referenceAlignment.
	reference ifNil: [ ^ 1.0 ].
	^ self totalColumnScoreAgainst: reference
]

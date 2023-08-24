"
BioSequence represents a sequence collection with a name and alphabet (BioAlphabet).

If you need to add annotations or features to the sequence use BioSeqRecord.

Instance Variables:
	seq				<String>
	alphabet 			<Alphabet>
	name			<String>
	sequenceFeatures 	<Collection>

"
Class {
	#name : #BioSequence,
	#superclass : #BioObject,
	#instVars : [
		'seq',
		'alphabet',
		'name',
		'sequenceRecord',
		'gcContent',
		'gcSkew'
	],
	#category : #'BioTools-Sequences'
}

{ #category : #'accessing - disambiguation' }
BioSequence class >> disambiguateLetter: letter [
	" Private - Answer a <String> of disambiguations for letter "
	
	^ BioIUPACAmbiguousDNA ambiguousLettersMap 
		keyAtValue: letter asString
		ifAbsent: [ letter asString ]
]

{ #category : #convenience }
BioSequence class >> expected: m probabilitySeqOfSize: n patternLength: k alphabetSize: a occurrences: t [
	" Answer a <Float> representing the expected k-mer occurrences in m (random) strings of length n formed from an alphabet of a letters.
	n = Length of each String.
	k = Length of pattern sequence (k-mer).
	a = Alphabet size (Number of letters in alphabet).
	t = Number of times where pattern appears.
	"
	
	^ ((n - (t * (k - 1)) choose:  t) / (a raisedTo: (t * k))) asFloat * m
]

{ #category : #'instance creation - dna' }
BioSequence class >> forAlphabet: aBioAlphabetClass [
	" Answer a new instance of the receiver with aBioAlphabetClass as its alphabet "
	
	^ self new 
		alphabet: aBioAlphabetClass new;
		yourself
]

{ #category : #'instance creation - dna' }
BioSequence class >> fromUmambiguousDNASequences: aCollection [
	" Answer a <Collection> of receivers taking each <BioSequence> from aCollection "
	
	^ aCollection collect: [ : seqString | self newUnambiguousDNA: seqString ]
]

{ #category : #'instance creation - rna' }
BioSequence class >> fromUmambiguousRNASequences: aCollection [
	" Answer a <Collection> of receivers taking each <BioSequence> from aCollection "
	
	^ aCollection collect: [ : seqString | self newUnambiguousRNA: seqString ]
]

{ #category : #convenience }
BioSequence class >> joinSequence: aCollection [
	" Private - Answer a String with the sequence ensambled from aCollection.
	aCollection is a collection of collections with each element composed by
	Strings or Characters "
	
	^ (aCollection flatCollect: [ : each | each select: #isBiologicalSequence ]) joinUsing: String empty
]

{ #category : #convenience }
BioSequence class >> joinString: aCollection [
	" Private - Answer a String with the sequence ensambled from aCollection.
	aCollection is a collection of collections with each element composed by
	Strings or Characters "
	
	^ (aCollection flatCollect: [ : each | each select: #isString ]) joinUsing: String empty
]

{ #category : #'instance creation - dna' }
BioSequence class >> newAmbiguousDNA: aString [
	" Answer a new instance of the receiver with aString as its sequence "
	
	^ self new 
		initializeWith: aString
		alphabet: BioIUPACAmbiguousDNA new
]

{ #category : #'instance creation - dna' }
BioSequence class >> newAmbiguousDNA: aString named: aName [
	" Answer a new instance of the receiver with aString as the sequence "
	
	^ self new 
		name: aName;
		initializeWith: aString
		alphabet: BioIUPACAmbiguousDNA new;
		yourself
]

{ #category : #'instance creation - rna' }
BioSequence class >> newAmbiguousRNA: aString [
	" Answer a new instance of the receiver with aString as the sequence string "
	
	^ self new 
		initializeWith: aString
		alphabet: BioIUPACAmbiguousRNA new
]

{ #category : #'instance creation - dna' }
BioSequence class >> newDNA: aString [
	" Answer a new instance of the receiver with aString as the sequence "
	
	^ self newUnambiguousDNA: aString
]

{ #category : #'instance creation - dna' }
BioSequence class >> newDNANamed: aString [
	" Answer a new instance of the receiver with aString as its name "
	
	^ self new
		name: aString;
		alphabet: BioIUPACAmbiguousDNA new;
		yourself
]

{ #category : #'instance creation' }
BioSequence class >> newFrom: aPath [
	" Answer a new instance of the receiver reading from aPath "
	
	^ self new initializeFrom: aPath
]

{ #category : #'instance creation' }
BioSequence class >> newNamed: aNameString [
	" Answer a new instance of the receiver named aNameString. No alphabet is guessed "
	
	^ self new 
		name: aNameString;
		yourself
]

{ #category : #'instance creation' }
BioSequence class >> newNamed: aNameString sequence: aSeqString [
	" Answer a new instance of the receiver using aString as sequence. Alphabet is guessed from aSeqString "
	
	^ self new 
		initializeWith: aSeqString;
		name: aNameString;
		yourself
]

{ #category : #'instance creation - protein' }
BioSequence class >> newProtein: aString [
	" Answer a new instance of the receiver with aString as its protein sequence string "
	
	^ self new 
		initializeWith: aString
		alphabet: BioIUPACProtein new
]

{ #category : #'instance creation - protein' }
BioSequence class >> newProtein: aString named: aName [
	" Answer a new instance of the receiver with aString as the sequence "
	
	^ self new 
		name: aName;
		initializeWith: aString alphabet: BioIUPACProteinExtended new;
		yourself
]

{ #category : #'instance creation - protein' }
BioSequence class >> newProteinExtended: aString [
	" Answer a new instance of the receiver with aString as its protein sequence string "
	
	^ self new 
		initializeWith: aString
		alphabet: BioIUPACProteinExtended new
]

{ #category : #'instance creation - protein' }
BioSequence class >> newProteinNamed: aString [
	" Answer a new instance of the receiver with aString as its name "
	
	^ self new
		name: aString;
		alphabet: BioIUPACProtein new;
		yourself
]

{ #category : #'instance creation - rna' }
BioSequence class >> newRNA: aString [
	" Answer a new instance of the receiver with aString as its sequence "
	
	^ self newUnambiguousRNA: aString
]

{ #category : #'instance creation - rna' }
BioSequence class >> newRNANamed: aString [
	" Answer a new instance of the receiver with aString as its name "
	
	^ self new
		name: aString;
		alphabet: BioIUPACAmbiguousRNA new;
		yourself
]

{ #category : #'instance creation - dna' }
BioSequence class >> newUnambiguousDNA: aString [
	" Answer a new instance of the receiver with aString as its sequence "
	
	^ self new 
		initializeWith: aString
		alphabet: BioIUPACUnambiguousDNA new
]

{ #category : #'instance creation - rna' }
BioSequence class >> newUnambiguousRNA: aString [
	" Answer a new instance of the receiver with aString as its sequence string "
	
	^ self new 
		initializeWith: aString
		alphabet: BioIUPACUnambiguousRNA new
]

{ #category : #'instance creation' }
BioSequence class >> newWith: aString [
	" Answer a new instance of the receiver using aString as sequence. Alphabet is guessed "
	
	^ self new initializeWith: aString
]

{ #category : #'instance creation' }
BioSequence class >> newWith: aString alphabet: aBioAlphabet [
	" Answer a new instance of the receiver with aString as the sequence and anAlphabet as the alphabet for the sequence "
	
	^ aBioAlphabet isBehavior
		ifTrue: [ 
			self new 
				initializeWith: aString
				alphabet: aBioAlphabet new ]
		ifFalse: [
			self new 
				initializeWith: aString
				alphabet: aBioAlphabet ]
]

{ #category : #accessing }
BioSequence >> , aBioSequence [
	" Concatenate the receiver with aBioSequence if their alphabets are compatible "
	
	self flag: #todo. " Also concatenate the seqhences into a single SequenceRecord " 
	^ self alphabet class = aBioSequence alphabet class
		ifFalse: [ self signalInvalidObject: 
						self alphabet class asString , 
						'Incompatible alphabet with: ' translated ,
						aBioSequence alphabet class asString  ]
		ifTrue: [ self newPrototypeWith: self asString , aBioSequence asString ]
]

{ #category : #comparing }
BioSequence >> <= aBioSequence [
	" Answer whether the receiver size is less than the argument "

	^ self size <= aBioSequence size
]

{ #category : #comparing }
BioSequence >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ self asString = anObject asString and: [ alphabet = anObject alphabet ]
]

{ #category : #accessing }
BioSequence >> accessionName [
	" Answer a <String> representing the receiver's accession number, if available. Otherwise answer an empty string "
	
	^ self sequenceRecord name
]

{ #category : #accessing }
BioSequence >> accessionName: aString [
	" Set aString to represent the receiver's accession number "
	
	^ self sequenceRecord name: aString
]

{ #category : #'accessing - sequence record' }
BioSequence >> addSeqFeature: aBioSequenceFeature [
	" Attach aBioSequenceFeature to the receiver "
	
	self sequenceRecord addSeqFeature: aBioSequenceFeature.
]

{ #category : #accessing }
BioSequence >> addToAlignment: aBioAlignment [
	" Add the receiver to the alignment aBioAlignment "

	^ aBioAlignment
		name: self name;
		addFromSequence: self;
		yourself
	
]

{ #category : #accessing }
BioSequence >> addToAlignment: aBioAlignment named: seqName [
	" Add the receiver to the alignment aBioAlignment "

	self name: seqName.
	^ aBioAlignment
		addFromSequence: self;
		yourself
]

{ #category : #accessing }
BioSequence >> allButFirst [
	" Answer a copy of the receiver containing all but the first element. Raise an error if there are not enough elements."
	
	^ self newPrototypeWith: self sequence allButFirst
]

{ #category : #accessing }
BioSequence >> allButLast [
	" Answer a copy of the receiver containing all but the last element. Raise an error if there are not enough elements."
	
	^ self newPrototypeWith: self sequence allButLast 
]

{ #category : #'accessing - alphabet' }
BioSequence >> alphabet [
	" Answer a <BioAlphabet> representing the receiver's sequence alphabet "

	^ alphabet
		ifNil: [ alphabet := self defaultAlphabetClass new ]
]

{ #category : #'accessing - alphabet' }
BioSequence >> alphabet: aBioAlphabet [
	" Set aBioAlphabet as receiver's alphabet "

	alphabet := aBioAlphabet
]

{ #category : #'accessing - alphabet' }
BioSequence >> alphabetCodes [
	" Answer a sorted <String> with receiver's codes "

	^ self alphabet codes sorted
]

{ #category : #'accessing public - utils' }
BioSequence >> ambiguityCodes [
	" Answer a <String> with the ambiguity codes for the receiver's alphabet "

	^ self alphabet ambiguityCodes
]

{ #category : #'accesing public - protein synthesis' }
BioSequence >> aminoacidNames [
	" Answer a <String> with receiver's letters as aminoacid names "

	| aminoacidNames |
	
	aminoacidNames := OrderedCollection new: self size.
	self sequence do: [ : seqLetter |
		aminoacidNames add: seqLetter asAminoacidName ].
	^ aminoacidNames
]

{ #category : #converting }
BioSequence >> asFastaRecord [
	" Answer a <BioFastaRecord> filled with the receiver's name and sequence "

	^ BioFastaRecord
		named: self name
		sequence: seq
]

{ #category : #converting }
BioSequence >> asLowercase [
	" Modify the receiver with its sequence with characters all lowercased "
	
	seq := seq asLowercase
]

{ #category : #converting }
BioSequence >> asMutableSequence [
	" Answer a copy of the receiver converted to a mutable object "
	
	^ BioMutableSeq 
		newWith: self asString copy
		alphabet: self alphabet class

]

{ #category : #converting }
BioSequence >> asNumber [
	" Interpret the receiver as a k-mer pattern and answer the <Number> at the index array defined by the receiver's size (PatternToNumber)  "
	
	| map |
	map := Dictionary new
		at: $A put: '00';
		at: $C put: '01';
		at: $G put: '10';
		at: $T put: '11';
		yourself.
	^ (Number 
			readFrom: (String streamContents: [ : stream | self sequence do: [ : n | stream nextPutAll: (map at: n) ] ]) 
			base: 2) + 1


]

{ #category : #converting }
BioSequence >> asSequence [
	" Answer the receiver "
	
	^ self

]

{ #category : #accessing }
BioSequence >> asSequenceForAlphabet: anAlphabet [
	" Answer the receiver "
	
	^ self

]

{ #category : #converting }
BioSequence >> asString [
	" Answer a <String> with the receiver's sequence "
	
	^ seq trimBoth withoutCRs
]

{ #category : #converting }
BioSequence >> asUppercase [
	" Modify the receiver with its sequence with characters all uppercased "
	
	seq := seq asUppercase
]

{ #category : #accessing }
BioSequence >> at: anInteger [
	" Access the receiver's element at anInteger position "
	
	^ seq 
		at: anInteger
		ifAbsent: [ self signalInvalidObject: 'Out of range exception' ]
]

{ #category : #accessing }
BioSequence >> at: anInteger put: aLetter [
	" Store aLetter in the position of the receiver indicated by the anInteger. Answer the receiver "
	
	self signalInvalidObject: 'Sequence is read-only. Use #asMutable to enable modifications it then #asSequence' 
]

{ #category : #'accesing public - protein synthesis' }
BioSequence >> backTranscribe [
	" Answer a new instance of the receiver's with the receiver's sequence transcribed to its corresponding DNA, adjusting the alphabet "
	
	^ self class 
		newWith: self backTranscription 
		alphabet: BioIUPACUnambiguousDNA new

]

{ #category : #'accessing private - protein synthesis' }
BioSequence >> backTranscription [ 
	" Answer a String with the back transcription of the receiver's sequence "
	
	| backTranscript |
	
	backTranscript := seq asUppercase copyReplaceAll: 'U' with: 'T'.
	backTranscript := backTranscript copyReplaceAll: 'u' with: 't'.
	^ backTranscript
]

{ #category : #accessing }
BioSequence >> bioConsensusFor: aBioAlignment [ 
	" Answer a <Character> representing a consensus base for the receiver "

	^ aBioAlignment consensusStrategy consensusAt: self asString asUppercase
]

{ #category : #accessing }
BioSequence >> buildFrequencies: k [
	" Generates a frequency array by first initializing every element in the frequency array to zero (4k operations) and then making a single pass down receiver's sequence (approximately |sequence size| · k operations). 
	For each k-mer Pattern that we encounter, we add 1 to the value of the frequency array corresponding to Pattern "
	| freqArray j |
	
	freqArray := (Array new: self alphabet size ** k) atAllPut: 0.
	1 to: self size - k + 1 do: [ : i |
		j := (self copyFrom: i to: k + i - 1) asNumber.
		freqArray at: j put: (freqArray at: j) + 1 ].
	^ freqArray 
]

{ #category : #testing }
BioSequence >> canTranslate [
	" Answer <true> if a sequence can be translated using the receiver "
	
	self alphabet canTranslate 
		ifFalse: [ ^ false ].
	(self startCodons includes: (seq copyFrom: 1 to: 3)) 
		ifFalse: [ 
			self signalInvalidObject: 'First codon is not a start codon: ' , (seq copyFrom: 1 to: 3).
			^ false ].
	(self stopCodons includes: (seq copyFrom: seq size to: seq size - 3)) 
		ifFalse: [ 
			self signalInvalidObject: 'Last codon is not a stop codon: ' , (seq copyFrom: seq size to: seq size - 3).			
			^ false ].
	seq size \\ 3 ~= 0 
		ifFalse: [ 
			self signalInvalidObject: 'Sequence length is not a multiple of three.' , seq size asString.
			^ false ].
	^ true
]

{ #category : #accessing }
BioSequence >> clumpFindK: k length: l times: t [ 
	" Given integers L and t, a string Pattern forms an (L, t)-clump inside a (larger) string Genome if there is an interval of Genome of length L in which Pattern appears at least t times. This method search for the k-mer pattern in the receiver, appearing at least t times in a l window size. Answer a <Collection> "
	
	| lookup sequences |
	lookup := Dictionary new.
	sequences := Set new.
	1 to: self size - k do: [ : index |
		| seg |
		seg := self sequence copyFrom: index to: index + k - 1.
		[ (lookup at: seg ifAbsentPut: [ OrderedCollection new ]) notEmpty and: [ (index + k - (lookup at: seg) first) > l ] ]
			whileTrue: [ (lookup at: seg) removeFirst ].
		lookup at: seg ifPresent: [ : c | c add: index ] ifAbsentPut: [ OrderedCollection with: index ].
		(lookup at: seg) size = t
			ifTrue: [ sequences add: seg ] ].
	^ sequences
]

{ #category : #'accesing public - protein synthesis' }
BioSequence >> codonTables [
	" Answer the appropriate <BioCodonTables> for the receiver "
	
	^ self alphabet codonTable 
]

{ #category : #accessing }
BioSequence >> complement [
	" Answer a new instance of the receiver's with the complement of the receiver's sequence "
	
	^ self newPrototypeWith: self complementary 
]

{ #category : #accessing }
BioSequence >> complementary [
	" Answer a String with the complement of the receiver's sequence "
	
	^ String streamContents: [ : stream |
		seq do: [ : nc | stream nextPut: (self complementaryAt: nc) ] ]
]

{ #category : #'accessing private' }
BioSequence >> complementaryAt: aCharacter [
	" Private - Answer a <Character> with the receiver's complement for aCharacter "
	
	^ self alphabet complementaryTable at: aCharacter
]

{ #category : #accessing }
BioSequence >> contents [
	" Compatibility with #dumpToFileNamed: . Answer the receiver's sequence <String> "

	^ self sequence.
]

{ #category : #copying }
BioSequence >> copyFrom: startInteger [
	" Answer a copy of the receiver sliced from startInteger position up to the last position.
	The startInteger and endInteger are inclusive, i.e. #copyFrom: 1 to: 2 answer the first two bases of the sequence. " 
	
	^ self newPrototypeWith: (self subSeqFrom: startInteger to: seq size)
	
	
]

{ #category : #copying }
BioSequence >> copyFrom: startInteger to: endInteger [
	" Answer a copy of the receiver sliced from startInteger position up to endInteger position.
	The startInteger and endInteger are inclusive, i.e. #copyFrom: 1 to: 2 answer the first two bases of the sequence. " 
	
	^ self newPrototypeWith: (self subSeqFrom: startInteger to: endInteger)

	
	
]

{ #category : #copying }
BioSequence >> copyTo: stopInteger [
	" Answer a copy of the receiver sliced from the first position up to the stopInteger position.
	The startInteger and endInteger are inclusive, i.e. #copyFrom: 1 to: 2 answer the first two bases of the sequence. " 
	
	^ self newPrototypeWith: (self subSeqFrom: 1 to: stopInteger)
	
	
]

{ #category : #'accessing - checksum' }
BioSequence >> crc32 [
	"Answer a <Number> with the CRC checksum (edundancy check) for the receiver's sequence"

	^ CRC crc32FromCollection: self asString
]

{ #category : #'accessing private' }
BioSequence >> defaultAlphabetClass [

	^ BioAlphabet
]

{ #category : #converting }
BioSequence >> degenerateBasesAsMultibases [
	" Answer a <String> converting the receiver's degenerate bases in IUPAC notation to non-degenerate codes in the form [G/C] for S for example "
	
	^ (String streamContents: [ : stream |
			self do: [ : letter | 
				(BioIUPACAmbiguousDNA ambiguityCodes includes: letter)
					ifTrue: [ 
						stream
							nextPutAll: '[';
							nextPutAll: ('/' join: (BioIUPACAmbiguousDNA ambiguousLettersMap keyAtValue: letter asString));
							nextPutAll: ']' ]
					ifFalse: [ 
						stream
							nextPutAll: letter asString ] ] ])

]

{ #category : #'accessing - disambiguation' }
BioSequence >> dfsExpandSeq: currentDFSNode cumSequences: cumList [

    currentDFSNode beVisited.
    currentDFSNode remainingSeqSize > 0
		ifTrue: [ 
			" construct neighbors of currentDFSNode based on remaining sequence "
			(self class disambiguateLetter: (currentDFSNode remainingSeqAt: 1)) do: [ : nucleotide |
				currentDFSNode neighbors add: 
					(BioDFSNode 
						newWith: (String streamContents: [ : stream | stream nextPutAll: currentDFSNode cumulSeq; nextPutAll: nucleotide asString ])
						remaining: currentDFSNode remainSeq allButFirst) ].
        "# implement recursive DFS"
			currentDFSNode neighbors do: [ : neighbor | 
				neighbor isVisited
					ifFalse: [ self dfsExpandSeq: neighbor cumSequences: cumList ] ] ]
		ifFalse: [ 
			currentDFSNode remainingSeqSize = 0
				ifTrue: [ cumList add: currentDFSNode cumulSeq ] ]


]

{ #category : #'accessing - disambiguation' }
BioSequence >> disambiguate [
	" Answer a <Collection> with receiver's sequence disambiguated using IUPAC ambiguity codes "
	| expandedList startNode |
	expandedList := OrderedCollection new.
	startNode := BioDFSNode newWith: String empty remaining: seq.
	self dfsExpandSeq: startNode cumSequences: expandedList.
	^ expandedList

]

{ #category : #accessing }
BioSequence >> do: aClosure [
	" Evaluate aBlock with each of the receiver's elements as the argument. "
	
	self sequence do: aClosure	

]

{ #category : #copying }
BioSequence >> findHotspots [
	" Answer a <Collection> of the receiver's substrings tokenized by hostspots : [ ] "
	
	^ seq findTokens: '[]'

	
]

{ #category : #accessing }
BioSequence >> from: start to: stop do: aClosure [
	" Evaluate aBlock for all elements between start and stop (inclusive). "
	
	^ self sequence from: start to: stop do: aClosure	

]

{ #category : #accessing }
BioSequence >> gcContent [
	" Answer a <Number> representing the GC-content of a DNA string: the percentage of symbols in the string that are 'C' or 'G' "

	^ gcContent 
		ifNil: [ gcContent := self gcContentCalc ]
	

]

{ #category : #accessing }
BioSequence >> gcContent: anObject [
	gcContent := anObject
]

{ #category : #accessing }
BioSequence >> gcContentCalc [
	" Answer a <Number> representing the GC-content of a DNA string: the percentage of symbols in the string that are 'C' or 'G' "
	| cCount gCount |	
	cCount := 0.
	gCount := 0.
	self do: [ : each | 
		each asUppercase = $C 
			ifTrue: [ cCount := cCount + 1]
			ifFalse: [ each asUppercase = $G 
				ifTrue: [ gCount := gCount + 1 ] ] ].
	^ (((gCount + cCount / self size) * 100) round: 6) asScaledDecimal
	

]

{ #category : #accessing }
BioSequence >> gcContentStep: step window: w [
	" Answer a <Collection> of GC-content regions of window size w by step increments, in percentages. "

	| index ranges |

	index := 1.
	ranges := OrderedCollection new.
	[ (index + w) < self size ] whileTrue: [ 
		| cCount gCount |		
		cCount := 0.
		gCount := 0.	
		self from: index to: index + w do: [ : each |
			each asUppercase = $C 
				ifTrue: [ cCount := cCount + 1]
				ifFalse: [ each asUppercase = $G 
					ifTrue: [ gCount := gCount + 1 ] ] ].
		ranges add: (((gCount + cCount / self size) * 100) round: 6).
		index := index + step ].
	^ ranges
	

]

{ #category : #accessing }
BioSequence >> gcContentUppercased [
	" Answer a <Number> representing the GC-content of the receiver: the percentage of symbols in the string that are 'C' or 'G'. Assume the receiver's sequence is already all uppercased "

	| cCount gCount |	
	cCount := 0.
	gCount := 0.
	self do: [ : each | 
		each = $C 
			ifTrue: [ cCount := cCount + 1]
			ifFalse: [ 
				each = $G 
					ifTrue: [ gCount := gCount + 1 ] ] ].
	^ (((gCount + cCount / self size) * 100) round: 6) asScaledDecimal
	

]

{ #category : #accessing }
BioSequence >> gcSkew [
	" Answer a <Collection> with ratios <Float>. Calculate receiver's GC skew (G-C)/(G+C) for windows of size wLength.
	Set 0 for windows without any G/C by handling zero division errors. Does NOT look at any ambiguous nucleotides. "
	
	^ gcSkew
		ifNil: [ gcSkew := self gcSkewCalc ]

]

{ #category : #accessing }
BioSequence >> gcSkew: anObject [
	gcSkew := anObject
]

{ #category : #accessing }
BioSequence >> gcSkewCalc [
	" Answer a <Collection> with ratios <Float>. Calculate receiver's GC skew (G-C)/(G+C) for windows of size wLength.
	Set 0 for windows without any G/C by handling zero division errors. Does NOT look at any ambiguous nucleotides. "
	
	^ self gcSkewCalc: 1

]

{ #category : #accessing }
BioSequence >> gcSkewCalc: wLength [
	" Answer a <Collection> with <Float> representing ratios. Calculate receiver's GC skew (G-C)/(G+C) for windows of size wLength. Answer 0.0 for windows without any G/C by handling zero division errors. Does NOT look at any ambiguous nucleotides. "
	
	| ranges index |
	ranges := OrderedCollection new: wLength.
	index := 1.
	[ (index + wLength) < self size ] whileTrue: [ 
		| cCount gCount skew |		
		cCount := 0.
		gCount := 0.	
		self from: index to: index + wLength do: [ : each |
			each asUppercase = $C 
				ifTrue: [ cCount := cCount + 1 ]
				ifFalse: [ each asUppercase = $G 
					ifTrue: [ gCount := gCount + 1 ] ] ].
		skew := [ (gCount - cCount) / (gCount + cCount) ]			
			on: ZeroDivide
			do: [ : ex | 0.0 ].			
		ranges add: ((skew * 100) round: 6).
		index := index + wLength ].
	^ ranges	


]

{ #category : #accessing }
BioSequence >> gcSkewInt [
	" Answer a <Collection> with <Integer>. Calculate receiver's GC skew for each position. Does NOT look at any ambiguous nucleotides. "

	| skews |
	skews := OrderedCollection with: 0.
	self sequence
		keysAndValuesDo: [ :index :nuc | 
			nuc asUppercase = $G
				ifTrue: [ skews add: (skews at: index) + 1 ]
				ifFalse: [ nuc asUppercase = $C
						ifTrue: [ skews add: (skews at: index) - 1 ]
						ifFalse: [ skews add: (skews at: index) ] ] ].
	^ skews
]

{ #category : #'accessing - checksum' }
BioSequence >> gcg [
	"Answer a <Number> with the GCG checksum (edundancy check) for the receiver's sequence"

	| index checksum |

	index := 0.
	checksum := 0.

	self do: [ :char |
		index := index + 1.
		checksum := checksum + (index * (char asUppercase asciiValue)).
		index = 57
			ifTrue: [ index := 0 ] ].

	^ checksum \\ 10000.
]

{ #category : #testing }
BioSequence >> hasAmbiguousBases [
	" Answer <true> if receiver contains ambiguity codes "
	
	^ self alphabet hasAmbiguousBases: seq

]

{ #category : #comparing }
BioSequence >> hash [
	" Private - hash is implemented because #= is implemented "

	^ seq hash bitXor: alphabet hash

]

{ #category : #copying }
BioSequence >> hotspotRegionsLeft: leftSize right: rightSize [
	" Answer a <Collection> with the receiver's subcollections such as the left and right flanking regions of a hostpot are at least leftSize and rightSize respectively "

	^ self findHotspots tripleSelect: [ : a : b : c | a size >= leftSize and: [ c size >= rightSize ] ].
]

{ #category : #accessing }
BioSequence >> indicesOfSubsequence: aBioSequence [
	" See comment in #indicesOfSubstring: "

	^ self asString indicesOfSubstring: aBioSequence asString
]

{ #category : #'initialize-release' }
BioSequence >> initializeAlphabetFrom: aString [
	" Private - Set the receiver's alphabet guessing from aString
	or assigning a default if not possible "

	alphabet :=	[ (BioAlphabet guessAlphabetFrom: aString) new ]
		on: BioErrorSpecificationObject
		do: [ : ex | 
				self bioLog: ex messageText.
				self defaultAlphabetClass new ]
]

{ #category : #'initialize-release' }
BioSequence >> initializeWith: aString [
	" Private - Initialize the receiver's sequence to be aString "
	
	seq := aString.
	self initializeAlphabetFrom: aString.

]

{ #category : #'initialize-release' }
BioSequence >> initializeWith: aString alphabet: anAlphabet [
	" Private - Initialize the receiver's sequence to be aString and anAlphabet. Notice the receiver knows how to instantiate the alphabet "
	
	seq := aString.
	alphabet := anAlphabet
]

{ #category : #testing }
BioSequence >> isBioSequence [
	"Answer whether the receiver represents a Biological sequence."
	
	^ true
]

{ #category : #testing }
BioSequence >> isDNASequence [
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ seq isDNASequence and: [ self alphabet isDNA ]

]

{ #category : #testing }
BioSequence >> isEmpty [
	" Answer <true> if the receiver's sequence string contains no elements "
	
	^ seq isEmpty

]

{ #category : #testing }
BioSequence >> isMinisatelliteSequence [
	" Answer <true> if the receiver represents a STR sequence "
	
	^ false
]

{ #category : #testing }
BioSequence >> isNil [
	" Answer <true> if receiver's sequence is nil "

	^ seq isNil
]

{ #category : #testing }
BioSequence >> isProteinSequence [
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ self alphabet isProtein and: [ seq isProteinSequence ].
]

{ #category : #testing }
BioSequence >> isRNASequence [
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ seq isRNASequence and: [ self alphabet isRNA ].
]

{ #category : #testing }
BioSequence >> isSTRSequence [
	" Answer <true> if the receiver represents a STR sequence "
	
	^ false
]

{ #category : #testing }
BioSequence >> isSatelliteSequence [
	" Answer <true> if the receiver represents a classic satellite sequence "
	
	^ false
]

{ #category : #accessing }
BioSequence >> kmersCount: patString [
	" Answer the number of times that k-mers patString appears as substring of the receiver "
	
	^ (1 to: self size - patString size + 1) count: [ : i |
		(self copyFrom: i to: i + patString size - 1) sequence = patString ].
]

{ #category : #accessing }
BioSequence >> kmersCount: patString mismatches: d [
	" Answer the number of times that k-mers patString appears as substring of the receiver allowing d mismatches "
	
	^ (self sequence indicesOfSubstring: patString mismatches: d) size
]

{ #category : #accessing }
BioSequence >> lcc [
	"Answer a <Collection> of <Float> with the Local Composition Complexity (LCC) value for the receiver. Assume the receiver is unambiguous sequence "

	| l4 lccValues |
	l4 := 4 log.  
	lccValues := OrderedCollection new: 4.

	'ACTG' do: [ : nuc |
		| occCount |
	
		lccValues add: ((occCount := self occurrencesOf: nuc) = 0
			ifTrue: [ 0 ]
			ifFalse: [ occCount / self size * (occCount / self size log) / l4 ]) negated ].

	^ lccValues
]

{ #category : #accessing }
BioSequence >> lccWSize: wsize [

	| l4 compone lccsal window cant_a cant_c cant_t cant_g term_a term_c term_t term_g tail |
        
	l4 := (4 log).
	compone := #(0).
	lccsal := OrderedCollection new.
        
	1 to: wsize do: [ : i |
		compone := compone , (((i + 1) / wsize) * ((i + 1) / wsize log) / l4) asArray ].
        
		window := seq first: wsize.
		cant_a := (window occurrencesOf: 'A').
		cant_c := (window occurrencesOf: 'C').
		cant_t := (window occurrencesOf: 'T').
		cant_g := (window occurrencesOf: 'G').
		term_a := compone at: cant_a + 1.
		term_c := compone at: cant_c + 1.
		term_t := compone at: cant_t + 1.
		term_g := compone at: cant_g + 1.
		lccsal add: (term_a + term_c + term_t + term_g) negated.
        
		tail := seq first.
		(1 to: self size - wsize) do: [ : x |
			window := (seq copyFrom: x + 1 to: x + wsize).
            
		 tail = (window at: wsize)
			ifTrue: [ lccsal add: lccsal last ] 
			ifFalse: [
				tail = 'A' 
					ifTrue: [
                    cant_a := cant_a - 1.
                    (window endsWith: 'C') ifTrue: [
                        cant_c := cant_c + 1.
                        term_a := compone at: cant_a + 1.
                        term_c := compone at: cant_c + 1.
                        lccsal add: (term_a + term_c + term_t + term_g) negated.
                    ] ifFalse: [
                        (window endsWith: 'T') ifTrue: [
                            cant_t := cant_t + 1.
                            term_a := compone at: cant_a + 1.
                            term_t := compone at: cant_t + 1.
                            lccsal add: (term_a + term_c + term_t + term_g) negated.
                        ] ifFalse: [
                            (window endsWith: 'G') 
										ifTrue: [
         	                      cant_g := cant_g + 1.
                                term_a := compone at: cant_a + 1.
                                term_g := compone at: cant_g + 1.
                                lccsal add: (term_a + term_c + term_t + term_g) negated.
                            ] ifFalse: [
                                "No matching base found."
                            ].
                        ].
                    ].
                ] ifFalse: [
                    (tail = 'C') ifTrue: [
                        cant_c := cant_c - 1.
                        (window endsWith: 'A')
								 ifTrue: [
                            cant_a := cant_a + 1.
                            term_a := compone at: cant_a + 1.
                            term_c := compone at: cant_c + 1.
                            lccsal add: (term_a + term_c + term_t + term_g) negated.
                        ] ifFalse: [
                            (window endsWith: 'T') ifTrue: [
                                cant_t := cant_t + 1.
                                term_c := compone at: cant_c + 1.
                                term_t := compone at: cant_t + 1.
                                lccsal add: (term_a + term_c + term_t + term_g) negated.
                            ] ifFalse: [
                                (window endsWith: 'G') ifTrue: [
                                    cant_g := cant_g + 1.
                                    term_c := compone at: cant_c + 1.
                                    term_g := compone at: cant_g + 1.
                                    lccsal add: (term_a + term_c + term_t + term_g) negated.
                                ] ifFalse: [
                                    "No matching base found."
                                ].
                            ].
                        ].
                    ] ifFalse: [
                        (tail = 'T') ifTrue: [
                            cant_t := cant_t - 1.
                            (window endsWith: 'A') ifTrue: [
                                cant_a := cant_a + 1.
                                term_a := compone at: cant_a + 1.
                                term_t := compone at: cant_t + 1.
                                lccsal add: (term_a + term_c + term_t + term_g) negated.
                            ] ifFalse: [
                                (window endsWith: 'C') ifTrue: [
                                    cant_c := cant_c + 1.
                                    term_c := compone at: cant_c + 1.
                                    term_t := compone at: cant_t + 1.
                                    lccsal add: (term_a + term_c + term_t + term_g) negated.
                                ] ifFalse: [
                                    (window endsWith: 'G') ifTrue: [
                                        cant_g := cant_g + 1.
                                        term_t := compone at: cant_t + 1.
                                        term_g := compone at: cant_g + 1.
                                        lccsal add: (term_a + term_c + term_t + term_g) negated.
                                    ] ifFalse: [
                                        "No matching base found."
                                    ].
                                ].
                            ].
                        ] ifFalse: [
                            (tail = 'G') ifTrue: [
                                cant_g := cant_g - 1.
                                (window endsWith: 'A') ifTrue: [
                                    cant_a := cant_a + 1.
                                    term_a := compone at: cant_a + 1.
                                    term_g := compone at: cant_g + 1.
                                    lccsal add: (term_a + term_c + term_t + term_g) negated.
                                ] ifFalse: [
                                    (window endsWith: 'C') ifTrue: [
                                        cant_c := cant_c + 1.
                                        term_c := compone at: cant_c + 1.
                                        term_g := compone at: cant_g + 1.
                                        lccsal add: (term_a + term_c + term_t + term_g) negated.
                                    ] ifFalse: [
                                        (window endsWith: 'T') ifTrue: [
                                            cant_t := cant_t + 1.
                                            term_t := compone at: cant_t + 1.
                                            term_g := compone at: cant_g + 1.
                                            lccsal add: (term_a + term_c + term_t + term_g) negated.
                                        ] ifFalse: [
                                            "No matching base found."
                                        ].
                                    ].
                                ].
                            ] 
		ifFalse: [
			"No matching base found."
       ] ] ] ] ].
		tail := window at: 1 ].
		^ lccsal.
]

{ #category : #accessing }
BioSequence >> length [
	" Answer how many bases contains the receiver "
	
	^ self size
]

{ #category : #accessing }
BioSequence >> longestConsecutive: aCharacter [
	" Answer the length of the longest substring containing only letter for each element of aCharacter.
	
	From Biostrings: 
		v = c('AAACTGTGFG', 'GGGAATT', 'CCAAAAAAAAAATT')
		longestConsecutive(v, 'A') "

	| longestLength currentLength |

	longestLength := 0.
	currentLength := 0.

	self do: [ :char |
		(char asUppercase = aCharacter asUppercase) 
			ifTrue: [
				currentLength := currentLength + 1.
				longestLength := currentLength max: longestLength ] 
			ifFalse: [ currentLength := 0 ] ].
	^ longestLength.

]

{ #category : #accessing }
BioSequence >> minGCSkewInt [
	" Answer a <Collection> with all the positions where the GC skew reaches its minimum position "
	
	| min minGCs |
	min := self gcSkewInt min.
	minGCs := OrderedCollection new: self size.
	self gcSkewInt withIndexDo: [ : int : i | 
		min = int ifTrue: [ minGCs add: i - 1 ] ].
	^ minGCs
]

{ #category : #accessing }
BioSequence >> molecularWeightDegen [

	| lowerBoundsSequence upperBoundsSequence |
	
	lowerBoundsSequence := self asMutableSequence.
	upperBoundsSequence := self asMutableSequence.
	"replace all other degenerates with lightest base possible in lowerBoundsSequence"
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'r' with: 'a').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'y' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 's' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'w' with: 't').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'k' with: 't').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'm' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'b' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'd' with: 't').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'h' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'v' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'n' with: 'c').

	"replace all other degenerates with heaviest base possible in upperBoundsSequence"
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'r' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'y' with: 't').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 's' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'w' with: 'a').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'k' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'm' with: 'a').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'b' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'd' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'h' with: 'a').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'v' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'n' with: 'g').

	^ { lowerBoundsSequence molecularWeightNonDegen . upperBoundsSequence molecularWeightNonDegen }

]

{ #category : #accessing }
BioSequence >> molecularWeightNonDegen [

	| dict |
	
	dict := self occurrencesOfLetters.
	^ ((dict at: $G) * 329.21) + 
		((dict at: $A) * 313.21) + 
		((dict at: $T) * 304.2) + 
		((dict at: $C) * 289.18) + 17.01.
]

{ #category : #accessing }
BioSequence >> mostFrequentKmer: k [
	" Answer a <Collection> of receiver with the most frequent k-mers of size k "

	| maxCount maxKmers |
	maxCount := 0.
	maxKmers := OrderedCollection new.
	(((1 to: self size - k) 
		collect: [ : i | self copyFrom: i to: i + k - 1 ]) 
		as: Bag) doWithOccurrences: [ : elem : count |
			count = maxCount
				ifTrue: [ maxKmers add: elem ]
				ifFalse: [ 
					count > maxCount
						ifTrue: [ 
							maxCount := count.
							maxKmers := OrderedCollection with: elem ] ] ].
	^ maxKmers.
]

{ #category : #accessing }
BioSequence >> mostFrequentKmer: k mismatches: d [
	" Answer a <Collection> of receiver with the most frequent k-mers of size k allowing mismatches of size d "
	" Frequent Words with Mismatches Problem
		Input : A string  Text  as well as integers  k  and  d . (You may assume  k  ≤ 12 and  d  ≤ 3.)
		Output : All most frequent  k -mers with up to  d  mismatches in  Text . "

	| counter |
	
	counter := Bag new: (4 ** k). 
	('ACGT' enumerationsOfSize: k) 
			do: [ : kmer | 
				counter 
					add: kmer 
					withOccurrences: (self sequence indicesOfSubstring: kmer mismatches: d) size ].
	^ counter maxElements
]

{ #category : #accessing }
BioSequence >> mostFrequentKmerRevComp: k mismatches: d [
	" Answer a <Collection> of receiver with the most frequent k-mers of size k allowing mismatches of size d "
	" Frequent Words with Mismatches Problem
		Input : A string  Text  as well as integers  k  and  d . (You may assume  k  ≤ 12 and  d  ≤ 3.)
		Output : All most frequent  k -mers with up to  d  mismatches in  Text . "

	| counter |
	
	counter := Bag new: (4 ** k). 
	('ACGT' enumerationsOfSize: k) 
			do: [ : kmer | 
				counter 
					add: kmer 
					withOccurrences: (self sequence indicesOfSubstring: kmer mismatches: d) size + (self reverseComplement sequence indicesOfSubstring: kmer mismatches: d) size ].
	^ counter maxElements

]

{ #category : #accessing }
BioSequence >> name [

	^ name

]

{ #category : #accessing }
BioSequence >> name: anObject [
	name := anObject
]

{ #category : #'accessing private' }
BioSequence >> newPrototypeWith: aString [
	" Private - Note that you cannot copy because Sequence objects are not mutable "
	
	^ self class 
			newWith: aString 
			alphabet: self alphabet
]

{ #category : #testing }
BioSequence >> notEmpty [
	" Answer <true> if the receiver's sequence string contains elements "
	
	^ seq notEmpty
]

{ #category : #accessing }
BioSequence >> occurrencesOf: aCharacter [
	" Answer how many of the receiver's elements are equal to aLetter "
	
	^ seq asUppercase occurrencesOf: aCharacter asAminoacidLetter asUppercase
]

{ #category : #accessing }
BioSequence >> occurrencesOfLetters [
	" Answer a <Dictionary> of occurrence mappings for the receiver "
	
	| occurrences |
	
	occurrences := Dictionary new.
	self do: [ : each | 
		occurrences 
			at: each asUppercase 
			put: (occurrences at: each asUppercase ifAbsentPut: [ 0 ]) + 1 ].
	^ occurrences
]

{ #category : #accessing }
BioSequence >> positionsOf: aCharacterOrString [
	" Answer a Collection with the positions of aminoacidLetter in the receiver's sequence "
	
	| positions inputLetter |
	
	inputLetter := aCharacterOrString asAminoacidLetter.
	positions := OrderedCollection new.
	seq withIndexDo: [ : letter : index |
		letter = inputLetter
			ifTrue: [ positions add: index ] ].
	^ positions
]

{ #category : #printing }
BioSequence >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	seq ifNotNil: [
		aStream
			nextPutAll: self size asString between: $( and: $);
			space;
			nextPutAll: self alphabet asString between: $( and: $);
			space;
			nextPutAll: seq asString between: $[  and: $] ]
]

{ #category : #accessing }
BioSequence >> randomLength: size [
	" See comment in randomLength:for: "
	
	^ self randomLength: size for: self alphabet class
]

{ #category : #accessing }
BioSequence >> randomLength: size for: anAlphabetClass [
	" This method modifies the receiver. Set the receiver configured with random residues accordingly anAlphabetClass "
	
	| gen |
	self alphabet: anAlphabetClass.
	gen := (Generator on: [ : g | size timesRepeat: [ (g yield: anAlphabetClass codes atRandom) asString ] ]).
	seq := gen upToEnd
				inject: String new
				into: [ : a : b | String streamContents: [ : stream |
							stream 
								nextPutAll: a;
								nextPutAll: b asString ] ].
]

{ #category : #'accessing - sequence record' }
BioSequence >> removeSeqFeature: aBioSequenceFeature [
	" Remove aBioSequenceFeature from the receiver "
	
	self sequenceFeatures remove: aBioSequenceFeature
]

{ #category : #'accesing public - protein synthesis' }
BioSequence >> reverseComplement [
	" Answer a copy of the receiver's sequence complemented and with element order reversed "
	
	^ self complement reversed
]

{ #category : #'accesing public - protein synthesis' }
BioSequence >> reversed [
	" Answer a copy of the receiver with element order reversed "
	
	^ self newPrototypeWith: seq reversed
]

{ #category : #'accessing - checksum' }
BioSequence >> seguid [
	"Answer a <Number> with the SEquence Globally Unique IDentifier checksum (edundancy check) for the receiver's sequence"

	| hashedSeq id seqIntegers |
        
	seqIntegers := ByteArray new: 20 streamContents: [ : stream |.
		self do: [ :char | stream nextPut: char asUppercase asInteger ] ].

	hashedSeq := ByteArray new: 20.
	seqIntegers doWithIndex: [ :byte :index |
		| charValue |
		
		charValue := (byte bitAnd: 16rFF) asCharacter asciiValue.
		hashedSeq at: index put: charValue ].

	id := (Base64MimeConverter mimeEncode: hashedSeq readStream) contents.
	 ^ id copyFrom: 1 to: id size - 1.
]

{ #category : #accessing }
BioSequence >> sequence [
	" Answer a <String> representing the receiver's sequence "

	^ seq
]

{ #category : #accessing }
BioSequence >> sequence: aString [
	" Set the receiver's sequence to be aString "
	seq := aString
]

{ #category : #'accessing - sequence record' }
BioSequence >> sequenceFeatures [
	" Answer a <Collection> of <BioSequenceFeature>, the receiver's sequence features "

	^ self sequenceRecord sequenceFeatures
]

{ #category : #'accessing - sequence record' }
BioSequence >> sequenceRecord [
	" Answer the receiver's <BioSeqRecord> "

	^ sequenceRecord
		ifNil: [ sequenceRecord := BioSeqRecord new: self ]
]

{ #category : #'accessing - sequence record' }
BioSequence >> sequenceRecord: anObject [
	sequenceRecord := anObject
]

{ #category : #accessing }
BioSequence >> size [
	" Answer how many symbols the receiver contains "
	
	^ seq size
]

{ #category : #accessing }
BioSequence >> sizeExcludeTerminals [
	"Answer how many symbols (bases or amino acids) contains the receiver, excluding stop/terminal letters (like $*) "
	
	| count |
	
	count := 0.
	seq do: [ : letter |
		letter == self stopSymbol
			ifFalse: [ count := count + 1 ] ].
	^ count
]

{ #category : #accessing }
BioSequence >> splitByCodons [
	"Answer a <Collection> with the receiver splitted at stop codons"
	
	^ self sequence findTokens: $*
]

{ #category : #'accessing private' }
BioSequence >> stopSymbol [
	" Answer a terminator <Character> "
	
	^ self alphabet stopSymbol

]

{ #category : #accessing }
BioSequence >> subSeqFrom: startInteger to: endInteger [
	" Answer the <String> in the receiver's sequence from startInteger to endInteger.
	startInteger cannot be larger than endInteger, otherwise raise an Exception "
	
	^ seq copyFrom: startInteger to: endInteger
	
	
]

{ #category : #accessing }
BioSequence >> tmStaluc [

	self shouldBeImplemented
]

{ #category : #'accesing public - protein synthesis' }
BioSequence >> transcribe [
	" Answer a new instance of the receiver's with the receiver's sequence transcribed to its corresponding mRNA, adjusting the alphabet "
	
	| transcribed |
	transcribed := self class 
		newWith: self transcription 
		alphabet: BioIUPACUnambiguousRNA.
	transcribed sequenceRecord 
		annotationsAt: 'molecule_type'
		put: BioIUPACUnambiguousRNA.
	^ transcribed

]

{ #category : #'accessing private - protein synthesis' }
BioSequence >> transcription [ 
	" Answer a <String> with the transcription of the receiver's sequence "
	
	^ seq asUppercase copyReplaceAll: 'T' with: 'U'
]

{ #category : #'accesing public - protein synthesis' }
BioSequence >> translate [
	"Answer a new instance of the receiver's with the receiver's sequence translated to its corresponding Protein, adjusting the alphabet. Use the defaults.
	See comment in #translateTable:stopSymbol:toStop:cds:"
	
	^ self class 
		newWith: (self translationTable: (self codonTables atCodonTable: 1) 
				stopSymbol: $* 
				toStop: false 
				cds: false)
		alphabet: BioIUPACProtein new

]

{ #category : #'accesing public - protein synthesis' }
BioSequence >> translateToStop [
	" Answer a new instance of the receiver's with the receiver's sequence translated to its corresponding Protein, adjusting the alphabet. Use the defaults.
	See comment in #translateTable:stopSymbol:toStop:cds: "
	
	^ self class 
		newWith: (self translationTable: (self codonTables atCodonTable: 1) 
				stopSymbol: $* 
				toStop: true 
				cds: false)
		alphabet: BioIUPACProtein new

]

{ #category : #'accesing public - protein synthesis' }
BioSequence >> translateWithTableId: tableIdentifier [
	" Answer a new instance of the receiver's with the receiver's sequence translated to its corresponding Protein, adjusting the alphabet. Use the defaults.
	See comment in #translateTable:stopSymbol:toStop:cds: "
	
	^ self class 
		newWith: (self translationTable: (self codonTables atCodonTable: tableIdentifier) 
				stopSymbol: $* 
				toStop: false 
				cds: false)
		alphabet: BioIUPACProtein new

]

{ #category : #'accesing public - protein synthesis' }
BioSequence >> translateWithTableId: tableIdentifier stopSymbol: stopCharacter [
	" Answer a new instance of the receiver's with the receiver's sequence translated to its corresponding Protein, adjusting the alphabet. Use the defaults.
	See comment in #translateTable:stopSymbol:toStop:cds: "
	
	^ self class 
		newWith: (self translationTable: (self codonTables atCodonTable: tableIdentifier) 
				stopSymbol: stopCharacter 
				toStop: false 
				cds: false)
		alphabet: BioIUPACProtein new

]

{ #category : #'accesing public - protein synthesis' }
BioSequence >> translateWithTableId: aTableIdentifier stopSymbol: stopCharacter toStop: stopBoolean cds: cdsBoolean [
	" Answer a new instance of the receiver's with the receiver's sequence translated to its corresponding Protein, adjusting the alphabet. 

	aTableIdentifier		Specifies which codon table to use.
			Evaluate BioCodonTables tableIdentifiers to get the NCBI identifiers (Integer).
			Evaluate BioCodonTables tableNames to get only the table Names (String) 
			Evaluate BioCodonTables tableAllNames to get a mapping of NCBI identifiers and names (Dictionary)
			Default = 1 (Standard table)
			
	stopSymbol			Specifies terminator Character. 
						Default is asterisk ($*) 
				
	stopBoolean			<true>	specifies to stop the translation after the first stop codon is found, the stopSymbol is not appended to the answered protein sequence 
						<false>	specifies a full translation continuing on past any stop codons (translated as the specified stop_symbol)
						Default = <false>
						
	cdsBoolean			<true>	specifies a complete CDS. 
			Checks the sequence starts with a valid alternative start codon (translated as methionine, M), 
			Checks that the sequence length is a multiple of three, 
			Checks that there is a single in frame stop codon at the end (this will be excluded from the protein sequence, regardless of the to_stop option).
			If these tests fail, an exception is raised.
						Default = <false>
	"
	
	^ self class 
		newWith: (self translationTable: aTableIdentifier 
				stopSymbol: stopCharacter 
				toStop: stopBoolean 
				cds: cdsBoolean)
		alphabet: BioIUPACProtein new

]

{ #category : #'accessing private - protein synthesis' }
BioSequence >> translationTable: aTableIdentifier stopSymbol: stopCharacter toStop: stopBoolean cds: cdsBoolean [
	<lint: 'Long methods' rationale: 'Algorithm method' author: 'HernanMoralesDurand'>
	
	| seqStream codon |
	
	seqStream := WriteStream on: String new.
	(cdsBoolean and: [ self canTranslate ])
		ifTrue: [ seqStream 
					nextPutAll: ((seq allButLast: 3) allButFirst: 3);
					nextPut: $M ].
	1 to: seq size by: 3 do: [ : startIndex |
		startIndex + 2 <= seq size ifFalse: [ ^ seqStream contents ].
		codon := seq copyFrom: startIndex to: startIndex + 2.
		(self codonTables isStopCodon: codon)
			ifTrue: [ 
				cdsBoolean ifTrue: [ ^ self signalInvalidObject: 'Extra in frame stop codon found' ].
				stopBoolean ifTrue: [ ^ seqStream contents ].
				seqStream nextPut: stopCharacter ]
			ifFalse: [ seqStream nextPutAll: (self codonTables translate: codon) ] ].
	^ seqStream contents
	
]

{ #category : #'accessing public - utils' }
BioSequence >> trim: aCharacter [
	" Modify the receiver by removing aCharacter in its sequence "
	
	seq := seq copyWithout: aCharacter.
]

{ #category : #'accessing public - utils' }
BioSequence >> trimAmbiguityCodes [
	" This method modifies the receiver. Trim off all ambiguity codes "
	
	self ambiguityCodes do: [ : ambCharacter |
		self sequence copyWithout: ambCharacter ]

]

{ #category : #accessing }
BioSequence >> truncateFrom: startInteger [
	" Modify the receiver slicing the sequence from startInteger position up to the last position.
	The startInteger is inclusive " 
	
	^ self 
		initializeWith: (self subSeqFrom: startInteger to: self size)
		alphabet: self alphabet
	
	
]

{ #category : #accessing }
BioSequence >> truncateFrom: startInteger to: endInteger [
	" Modify the receiver slicing the sequence from startInteger position up to endInteger position.
	The startInteger and endInteger are inclusive, i.e. #copyFrom: 1 to: 2 answer the first two bases of the sequence. " 
	
	^ self 
		initializeWith: (self subSeqFrom: startInteger to: endInteger)
		alphabet: self alphabet
	
	
]

{ #category : #accessing }
BioSequence >> truncateTo: endInteger [
	" Modify the receiver slicing the sequence from the beggining up to endInteger position.
	The endInteger is inclusive, " 
	
	^ self 
		initializeWith: (self subSeqFrom: 1 to: endInteger)
		alphabet: self alphabet
	
	
]

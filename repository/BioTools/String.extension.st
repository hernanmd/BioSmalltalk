Extension { #name : #String }

{ #category : #'*BioTools' }
String >> addToAlignment: aBioAlignment [
	" Private - Add the receiver to aBioAlignment "

	aBioAlignment addSequence: (BioSequence newWith: self)
]

{ #category : #'*BioTools' }
String >> asAccessionStringWithoutVersion [
	" Answer a copy of the receiver without the version number "
	
	| accessionString |
	^ (accessionString := self findTokens: '.') size = 2
		ifTrue: [ accessionString first ]
		ifFalse: [ self ]
]

{ #category : #'*BioTools' }
String >> asAminoacidLetter [
	" Answer a <Character> representing an aminoacid letter. "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>
	
	self size = 1 ifFalse: [ BioObject signalInvalidObject: 'Receiver''s sequence size must match a Character' ].
	^ self first
]

{ #category : #'*BioTools' }
String >> asAminoacidName [
	" Answer the complete name of each receiver's aminoacid. Input may be one or three letter code. "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self size = 1
		ifTrue: [ self first asAminoacidName ]
		ifFalse: [ 
			self size = 3
				ifTrue: [ 
					BioIUPACAlphabet threeLetterAminoacidNames 
							at: self asUppercase
							ifAbsent: [ self signalNotFound: 'Three letter code not recognized as aminoacid' ] ]
				ifFalse: [ self signalInvalidObject: 'This method only accepts one or three letter codes' ] ]
]

{ #category : #'*BioTools' }
String >> asBioDataFileReference [
	" Answer a <FileReference> using the receiver as a file name in the DATA BioSmalltalk subdirectory "

	^ ((BioObject dataFilesFullDirectoryName allChildrenMatching: self) select: #isFile) anyOne
]

{ #category : #'*BioTools' }
String >> asBioFileReference [
	" Answer a <FileReference> using the receiver as a file name in one of the BioSmalltalk subdirectories "

	^ ((self asBioDataFileReference union: self asBioTestFileReference) union: self asBioScriptFileReference) anyOne
]

{ #category : #'*BioTools' }
String >> asBioScriptFileReference [
	" Answer a <FileReference> using the receiver as a file name in the SCRIPTS BioSmalltalk subdirectory "

	^ ((BioObject scriptsFullDirectoryName allChildrenMatching: self) select: #isFile) anyOne
]

{ #category : #'*BioTools' }
String >> asBioTestFileReference [
	" Answer a <FileReference> using the receiver as a file name in the TESTS BioSmalltalk subdirectory "

	^ ((BioObject testFilesFullDirectoryName allChildrenMatching: self) select: #isFile) anyOne
]

{ #category : #'*BioTools' }
String >> asDNANucleotide [
	" Answer the receiver as a <BioDNANucleotide> "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ BioDNANucleotide with: self
]

{ #category : #'*BioTools' }
String >> asDNASequence [
	" Answer a new Sequence object. Defaults to BioIUPACAmbiguousDNA "
	
	^ self asSequenceForAlphabet: BioIUPACAmbiguousDNA new
]

{ #category : #'*BioTools' }
String >> asDNASimpleSequence [
	" Answer a new Sequence object guessing the Alphabet. See #guessAlphabetFrom: for details "
	
	^ self asSequenceForAlphabet: BioDNAAlphabet
]

{ #category : #'*BioTools' }
String >> asFastaRecord [
	" Answer a new <BioFastaRecord> filled with the receiver's name and sequence.
	Assume first line is a FASTA identifier line, and subsequent lines contains the sequences possibly separated by CRs  "
	
	| parsedSeq |
	
	parsedSeq := (self lines allButFirst joinUsing: Character cr) withoutCRs.
	^ BioFastaRecord
		named: self lines first
		sequence: parsedSeq asSequence
]

{ #category : #'*BioTools' }
String >> asProteinSequence [
	" Answer a new protein sequence object. Alphabet defaults to BioIUPACProteinExtended "
	
	^ self asSequenceForAlphabet: BioIUPACProteinExtended new
]

{ #category : #'*BioTools' }
String >> asRNASequence [
	" Answer a new protein sequence object. Alphabet defaults to BioIUPACAmbiguousRNA "
	
	^ self asSequenceForAlphabet: BioIUPACAmbiguousRNA new
]

{ #category : #'*BioTools' }
String >> asSequence [
	" Answer a new Sequence object guessing the Alphabet. See #guessAlphabetFrom: for details "
	
	^ BioSequence newWith: self asCondensedString
]

{ #category : #'*BioTools' }
String >> asSequenceForAlphabet: anAlphabet [
	" Answer a new Sequence object using anAlphabet. If anAlphabet is null then guess an alphanet using the receiver, see #guessAlphabetFrom: "
	
	^ BioSequence 
		newWith: self asCondensedString
		alphabet: anAlphabet
]

{ #category : #'*BioTools' }
String >> bioReader [
	" Answer a BioReader on the receiver "
	
	| readerClass |
	
	readerClass := BioReader for: self.
	^ self isXML 
		ifTrue: [ readerClass newFromXML: self ]
		ifFalse: [ readerClass newFromFlat: self ]
]

{ #category : #'*BioTools' }
String >> dumpToStream: aStream [
	" Private - Write the receiver's contents into aStream "

	aStream 
		nextPutAll: self;
		bioCr.
]

{ #category : #'*BioTools' }
String >> hasAmbiguousDNABases [
	" Answer <true> if receiver contains ambiguity codes "
	
	^ (BioAlphabet guessAlphabetFrom: self) isAmbiguousAlphabet

]

{ #category : #'*BioTools' }
String >> hasAmbiguousRNABases [
	" Answer <true> if receiver contains ambiguity codes "
	
	^ (BioAlphabet guessAlphabetFrom: self) isAmbiguousAlphabet


]

{ #category : #'*BioTools' }
String >> includesDtd: aDtdFilename [
	" Private - Answer <true> if receiver's first bytes in header includes aDtdFilename "

	^ ((self first: 150) findTokens: $") includes: aDtdFilename
]

{ #category : #'*BioTools' }
String >> instancesOf: aCharacter [

	| count |
	count := 0.
	self do: [ :char | aCharacter = char ifTrue: [ count := count + 1. ]. ].
	^ count.
]

{ #category : #'*BioTools' }
String >> isAllele [

	^ #(
	'AA' 'AC' 'AG' 'AT'
	'CA' 'CC' 'CG' 'CT'
	'GA' 'GC' 'GG' 'GT'
	'TA' 'TC' 'TG' 'TT'
	'---'
	) includes: self
]

{ #category : #'*BioTools' }
String >> rejectFromBioAlignment: aBioAlignment [
	" Receiver represents a name of a taxon used to filter aBioAlignment "

	^ aBioAlignment sequences reject: [ : seq |
		| annotation |
		annotation := seq annotationsAt: 'taxonomy' ifAbsent: [  ].
		annotation asLowercase = self asLowercase ]
]

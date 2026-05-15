"
Parser for PHYLIP format files. Handles both sequential and interleaved PHYLIP formats including relaxed variants. Instance Variables: numTaxa numChars taxaNames sequences isInterleaved isStrict currentLine lines errorLine
"
Class {
	#name : 'BioPhylipParser',
	#superclass : 'BioObject',
	#instVars : [
		'numTaxa',
		'numChars',
		'taxaNames',
		'sequences',
		'isInterleaved',
		'isStrict',
		'currentLine',
		'lines',
		'errorLine'
	],
	#category : 'BioParsers-PHYLIP',
	#package : 'BioParsers',
	#tag : 'PHYLIP'
}

{ #category : 'parsing' }
BioPhylipParser class >> parseFile: aFileReference [
	^ self new parseFile: aFileReference
]

{ #category : 'parsing' }
BioPhylipParser class >> parseString: aString [
	^ self new parseString: aString
]

{ #category : 'converting' }
BioPhylipParser >> asAlignment [
	"Build a BioAlignment from the parsed data.
	 Uses BioSequence class>>newNamed:sequence: which auto-detects the alphabet."
	| alignment |
	alignment := BioAlignment new.
	1 to: numTaxa do: [ :i |
		| seq |
		seq := BioSequence newNamed: (taxaNames at: i) sequence: (sequences at: i) asUppercase.
		alignment addFromSequence: seq ].
	^ alignment
]

{ #category : 'converting' }
BioPhylipParser >> asPhylipStringRelaxed: anAlignment [
	"Answer a relaxed PHYLIP string from anAlignment (variable-length names, sequential)."

	^ String streamContents: [ :s |
			  s
				  nextPutAll: anAlignment size asString;
				  space;
				  nextPutAll: anAlignment numberOfBases asString;
				  cr.
			  anAlignment sequences do: [ :seq |
					  s
						  nextPutAll: (seq name ifNil: [ 'Unnamed' ]);
						  space;
						  nextPutAll: seq asString;
						  cr ] ]
]

{ #category : 'converting' }
BioPhylipParser >> asPhylipStringStrict: anAlignment [
	"Answer a strict PHYLIP string from anAlignment (10-char names, sequential)."

	^ String streamContents: [ :s |
			  s
				  nextPutAll: anAlignment size asString;
				  space;
				  nextPutAll: anAlignment numberOfBases asString;
				  cr.
			  anAlignment sequences do: [ :seq |
					  | name padded |
					  name := seq name ifNil: [ 'Unnamed' ].
					  padded := name size > 10
						            ifTrue: [ name copyFrom: 1 to: 10 ]
						            ifFalse: [
						            name
						            ,
						            (String new: 10 - name size withAll: Character space) ].
					  s
						  nextPutAll: padded;
						  nextPutAll: seq asString;
						  cr ] ]
]

{ #category : 'private' }
BioPhylipParser >> cleanSequence: aString [
	"Remove whitespace from sequence data. PHYLIP allows spaces within sequences."

	^ aString reject: [ :c | c isSeparator ]
]

{ #category : 'accessing' }
BioPhylipParser >> currentLine [
	
	^ currentLine
]

{ #category : 'accessing' }
BioPhylipParser >> currentLine: anInt [ 

	currentLine := anInt
]

{ #category : 'private' }
BioPhylipParser >> detectFormat [
	"Auto-detect strict/relaxed and sequential/interleaved."

	| firstDataLine nameField |
	currentLine > lines size ifTrue: [
		Error signal: 'No data lines after header' ].
	firstDataLine := lines at: currentLine.
	nameField := self extractNameFromLine: firstDataLine.
	isStrict := nameField size <= 10 and: [
			            firstDataLine size >= 10 and: [
					            (firstDataLine
						             copyFrom: 1
						             to: (10 min: firstDataLine size)) trimBoth
					            = nameField ] ].
	isInterleaved := self detectInterleaved
]

{ #category : 'private' }
BioPhylipParser >> detectInterleaved [
	"Determine if the file is interleaved or sequential.
	 If the first taxon has numChars chars, it is sequential (or single-block).
	 Otherwise, skip first N taxa lines, then check if the next N lines
	 are pure sequence (=> interleaved) or include a new taxon name (=> sequential)."

	| i firstSeqLen firstDataLineIdx consecutiveContLines |
	firstDataLineIdx := currentLine.
	[
		firstDataLineIdx <= lines size and: [
			(lines at: firstDataLineIdx) trimBoth isEmpty ] ] whileTrue: [
		firstDataLineIdx := firstDataLineIdx + 1 ].
	firstDataLineIdx > lines size ifTrue: [ ^ false ].
	firstSeqLen := (self extractSequenceFromLine:
		                (lines at: firstDataLineIdx)) size.
	firstSeqLen >= numChars ifTrue: [ ^ false ].
	i := firstDataLineIdx.
	numTaxa timesRepeat: [
			[ i <= lines size and: [ (lines at: i) trimBoth isEmpty ] ]
				whileTrue: [ i := i + 1 ].
			i := i + 1 ].
	[ i <= lines size and: [ (lines at: i) trimBoth isEmpty ] ]
		whileTrue: [ i := i + 1 ].
	i > lines size ifTrue: [ ^ false ].
	consecutiveContLines := 0.
	[ i <= lines size and: [ consecutiveContLines < numTaxa ] ]
		whileTrue: [
				| trimmed |
				trimmed := (lines at: i) trimBoth.
				trimmed isEmpty
					ifTrue: [ i := i + 1 ]
					ifFalse: [
							(self nextLineLooksLikeNewTaxon: (lines at: i)) ifTrue: [
								^ false ].
							consecutiveContLines := consecutiveContLines + 1.
							i := i + 1 ] ].
	^ consecutiveContLines >= numTaxa
]

{ #category : 'private' }
BioPhylipParser >> detectSequenceClass [
	"Answer the sequence class to use for creating sequences.
	 BioSequence newNamed:sequence: auto-detects the alphabet from the sequence content."
	^ BioSequence
]

{ #category : 'private' }
BioPhylipParser >> detectStrictOrRelaxed [
	"Detect whether the file uses strict (10-char names) or relaxed (variable-length names) format."

	| firstDataLine nameField |
	currentLine > lines size ifTrue: [
			isStrict := false.
			^ self ].
	firstDataLine := lines at: currentLine.
	nameField := self extractNameFromLineRelaxed: firstDataLine.
	isStrict := nameField size <= 10 and: [
			            firstDataLine size >= 10 and: [
					            (firstDataLine
						             copyFrom: 1
						             to: (10 min: firstDataLine size)) trimBoth
					            = nameField ] ]
]

{ #category : 'accessing' }
BioPhylipParser >> errorAt: lineNum message: aString [
	"Signal a parse error with line number context."

	self error:
		'Phylip parse error at line ' , lineNum asString , ': ' , aString
]

{ #category : 'private' }
BioPhylipParser >> extractNameFromLine: aLine [
	"Extract the taxon name from a data line.
	 In relaxed mode: name is everything before the first whitespace.
	 In strict mode: name is the first 10 characters (trimmed).
	 Returns the trimmed name string."

	| trimmed wsIdx |
	isStrict ifNotNil: [
			isStrict ifTrue: [
					aLine size < 10 ifTrue: [ ^ aLine trimBoth ].
					^ (aLine copyFrom: 1 to: 10) trimBoth ] ].
	"Relaxed or unknown: name ends at first whitespace"
	trimmed := aLine trimBoth.
	wsIdx := self indexOfFirstWhitespaceIn: trimmed.
	wsIdx = 0 ifTrue: [ ^ trimmed ].
	^ trimmed copyFrom: 1 to: wsIdx - 1
]

{ #category : 'private' }
BioPhylipParser >> extractNameFromLineRelaxed: aLine [
	"Extract the taxon name assuming relaxed format (name ends at first whitespace)."

	| trimmed wsIdx |
	trimmed := aLine trimBoth.
	wsIdx := self indexOfFirstWhitespaceIn: trimmed.
	wsIdx = 0 ifTrue: [ ^ trimmed ].
	^ trimmed copyFrom: 1 to: wsIdx - 1
]

{ #category : 'private' }
BioPhylipParser >> extractSequenceFromLine: aLine [
	"Extract the sequence portion from a data line (after the taxon name)."

	| nameSeq nameEnd |
	isStrict ifTrue: [
			aLine size <= 10 ifTrue: [ ^ '' ].
			^ self cleanSequence: (aLine copyFrom: 11 to: aLine size) ].
	"Relaxed: find end of name, rest is sequence"
	nameSeq := aLine trimBoth.
	nameEnd := self indexOfFirstWhitespaceIn: nameSeq.
	nameEnd = 0 ifTrue: [ ^ '' ].
	^ self cleanSequence:
		  (nameSeq copyFrom: nameEnd + 1 to: nameSeq size)
]

{ #category : 'accessing' }
BioPhylipParser >> indexOfFirstWhitespaceIn: aString [
	"Answer the 1-based index of the first whitespace character (space or tab) in aString,
	 or 0 if none."

	1 to: aString size do: [ :i |
	(aString at: i) isSeparator ifTrue: [ ^ i ] ].
	^ 0
]

{ #category : 'initialization' }
BioPhylipParser >> initialize [

	super initialize.
	taxaNames := OrderedCollection new.
	sequences := OrderedCollection new.
	currentLine := 0.
	lines := #(  ).
	errorLine := 0
]

{ #category : 'accessing' }
BioPhylipParser >> isInterleaved [ ^ isInterleaved
]

{ #category : 'accessing' }
BioPhylipParser >> isInterleaved: aBool [ isInterleaved := aBool
]

{ #category : 'testing' }
BioPhylipParser >> isSequenceChar: c [
	"^ true if c is a valid PHYLIP sequence character (IUPAC nucleotide/amino acid + gap)."

	^ 'ACGTURYNWSMKHDVBacgturynwsmkhbdvb-?.' includes: c
]

{ #category : 'accessing' }
BioPhylipParser >> isStrict [ ^ isStrict
]

{ #category : 'accessing' }
BioPhylipParser >> isStrict: aBool [ isStrict := aBool
]

{ #category : 'private' }
BioPhylipParser >> lineStartsWithName: aLine [
	"Check if aLine starts with a taxon name (vs being a pure sequence continuation line).
	 In strict mode: the first 10 chars contain a name followed by spaces/padding.
	 In relaxed mode: the line has a name (non-sequence-like prefix) followed by whitespace
	 and then sequence data."

	| trimmed wsIdx potentialName first10 |
	trimmed := aLine trimBoth.
	trimmed isEmpty ifTrue: [ ^ false ].
	isStrict ifTrue: [
			trimmed size < 10 ifTrue: [ ^ true ]. "Short lines in strict mode must be names"
			first10 := (trimmed copyFrom: 1 to: 10) trimBoth.
			^ (self looksLikeSequence: first10) not ].
	"Relaxed: check for name + whitespace + sequence pattern"
	wsIdx := self indexOfFirstWhitespaceIn: trimmed.
	wsIdx = 0 ifTrue: [ ^ false ]. "No whitespace = pure sequence continuation"
	wsIdx > 50 ifTrue: [ ^ false ]. "Whitespace too far in = sequence not name"
	potentialName := trimmed copyFrom: 1 to: wsIdx - 1.
	^ (self looksLikeSequence: potentialName) not
]

{ #category : 'accessing' }
BioPhylipParser >> lines: anArray [ lines := anArray
]

{ #category : 'private' }
BioPhylipParser >> looksLikeSequence: aString [
	"Check if aString looks like sequence data (mostly IUPAC characters)."

	| seqChars totalChars ratio |
	totalChars := aString size.
	totalChars = 0 ifTrue: [ ^ false ].
	seqChars := 0.
	aString do: [ :c |
		(self isSequenceChar: c) ifTrue: [ seqChars := seqChars + 1 ] ].
	ratio := seqChars / totalChars.
	^ ratio > 0.9
]

{ #category : 'private' }
BioPhylipParser >> nextLineLooksLikeContinuation: aLine [
	"Check if aLine looks like a sequence continuation (no name prefix)."

	| trimmed wsIdx potentialName first10 |
	trimmed := aLine trimBoth.
	trimmed isEmpty ifTrue: [ ^ true ].
	isStrict ifTrue: [
			trimmed size >= 10 ifTrue: [
					first10 := (trimmed copyFrom: 1 to: 10) trimBoth.
					first10 isEmpty ifTrue: [ ^ true ].
					^ self looksLikeSequence: first10 ].
			^ true ].
	"Relaxed: check if line starts with a name"
	wsIdx := self indexOfFirstWhitespaceIn: trimmed.
	wsIdx = 0 ifTrue: [ ^ true ].
	wsIdx > 30 ifTrue: [ ^ true ].
	potentialName := trimmed copyFrom: 1 to: wsIdx - 1.
	^ self looksLikeSequence: potentialName
]

{ #category : 'private' }
BioPhylipParser >> nextLineLooksLikeNewTaxon: aLine [
	"Check if aLine looks like a new taxon name + sequence (vs pure sequence continuation).
	 Returns true if it looks like a new taxon (=> interleaved).
	 Returns false if it looks like continuation (=> sequential)."

	| trimmed wsIdx potentialName first10 |
	trimmed := aLine trimBoth.
	trimmed isEmpty ifTrue: [ ^ false ].
	isStrict ifTrue: [ "Strict: first 10 chars should be a name (not sequence chars)"
			trimmed size < 10 ifTrue: [ ^ self looksLikeSequence: trimmed not ].
			first10 := (trimmed copyFrom: 1 to: 10) trimBoth.
			first10 isEmpty ifTrue: [ ^ false ].
			^ (self looksLikeSequence: first10) not ].
	"Relaxed: name ends at first whitespace, check if it looks like a name"
	wsIdx := self indexOfFirstWhitespaceIn: trimmed.
	wsIdx = 0 ifTrue: [ ^ false ]. "No whitespace = pure sequence, not a name"
	wsIdx > 30 ifTrue: [ ^ false ]. "Whitespace very far in = probably sequence not name"
	potentialName := trimmed copyFrom: 1 to: wsIdx - 1.
	^ (self looksLikeSequence: potentialName) not
]

{ #category : 'accessing' }
BioPhylipParser >> numChars [ ^ numChars
]

{ #category : 'accessing' }
BioPhylipParser >> numTaxa [ ^ numTaxa
]

{ #category : 'parsing' }
BioPhylipParser >> parseAsInterleaved: aString [
	"Parse assuming interleaved format."

	self initialize.
	lines := (aString lines select: [ :l | l notEmpty ]) asArray.
	self parseHeader.
	isInterleaved := true.
	self detectStrictOrRelaxed.
	self parseBodyInterleaved.
	self validate.
	^ self asAlignment
]

{ #category : 'parsing' }
BioPhylipParser >> parseAsSequential: aString [
	"Parse assuming sequential format."

	self initialize.
	lines := (aString lines select: [ :l | l notEmpty ]) asArray.
	self parseHeader.
	isInterleaved := false.
	self detectStrictOrRelaxed.
	self parseBodySequential.
	self validate.
	^ self asAlignment
]

{ #category : 'parsing' }
BioPhylipParser >> parseBody [
	"Parse the data body after the header. Dispatches to sequential or interleaved parser."

	isInterleaved
		ifTrue: [ self parseBodyInterleaved ]
		ifFalse: [ self parseBodySequential ]
]

{ #category : 'parsing' }
BioPhylipParser >> parseBodyInterleaved [
	"Parse interleaved format: first block has N name+seq lines, subsequent blocks are seq-only."

	| totalRead |
	numTaxa timesRepeat: [
			[
				currentLine <= lines size and: [
					(lines at: currentLine) trimBoth isEmpty ] ] whileTrue: [
				currentLine := currentLine + 1 ].
			currentLine > lines size ifTrue: [
				Error signal: 'Unexpected end of input in interleaved block' ].
			taxaNames add: (self extractNameFromLine: (lines at: currentLine)).
			sequences add:
				(self extractSequenceFromLine: (lines at: currentLine)).
			currentLine := currentLine + 1 ].
	totalRead := 0.
	[ currentLine <= lines size ] whileTrue: [
			| line trimmed |
			line := lines at: currentLine.
			trimmed := line trimBoth.
			trimmed isEmpty
				ifTrue: [ currentLine := currentLine + 1 ]
				ifFalse: [
						| idx |
						idx := totalRead \\ numTaxa.
						idx := idx + 1.
						sequences
							at: idx
							put: (sequences at: idx) , (self cleanSequence: trimmed).
						totalRead := totalRead + 1.
						currentLine := currentLine + 1 ] ]
]

{ #category : 'parsing' }
BioPhylipParser >> parseBodySequential [
	"Parse sequential format: each taxon's data appears on consecutive lines.
	 A taxon starts with a name line, followed by optional continuation lines.
	 We detect name lines by checking if the line starts with a taxon name
	 (has a recognizable name prefix followed by whitespace then sequence data)."

	| taxonIndex currentSeq charsRead |
	taxonIndex := 0.
	currentSeq := ''.
	charsRead := 0.
	[ currentLine <= lines size ] whileTrue: [
			| line trimmed name seq |
			line := lines at: currentLine.
			trimmed := line trimBoth.
			trimmed isEmpty
				ifTrue: [ currentLine := currentLine + 1 ]
				ifFalse: [
						(taxonIndex < numTaxa and: [ self lineStartsWithName: line ])
							ifTrue: [ "New taxon line - save previous sequence if any"
									taxonIndex > 0 ifTrue: [ sequences add: currentSeq ].
									name := self extractNameFromLine: line.
									seq := self extractSequenceFromLine: line.
									taxaNames add: name.
									currentSeq := seq.
									charsRead := seq size.
									taxonIndex := taxonIndex + 1 ]
							ifFalse: [ "Continuation of current taxon"
									seq := self cleanSequence: trimmed.
									currentSeq := currentSeq , seq.
									charsRead := charsRead + seq size ].
						currentLine := currentLine + 1 ] ].
	"Add last sequence"
	currentSeq ifNotEmpty: [ sequences add: currentSeq ]
]

{ #category : 'parsing' }
BioPhylipParser >> parseFile: aFileReference [
	"Parse a PHYLIP format file. Answer a <BioAlignment>."

	^ self parseString: aFileReference asFileReference contents
]

{ #category : 'parsing' }
BioPhylipParser >> parseHeader [

	| header firstNum secondNum |
	currentLine < lines size ifFalse: [
		Error signal: 'Empty PHYLIP input' ].
	header := lines first trimBoth.
	firstNum := self readFirstNumber: header.
	secondNum := self readSecondNumber: header.
	firstNum ifNil: [ Error signal: 'Cannot read taxa count' ].
	secondNum ifNil: [ Error signal: 'Cannot read character count' ].
	firstNum < 2 ifTrue: [ Error signal: 'Need at least 2 taxa' ].
	secondNum < 1 ifTrue: [ Error signal: 'Need at least 1 character' ].
	numTaxa := firstNum.
	numChars := secondNum.
	currentLine := 2
]

{ #category : 'parsing' }
BioPhylipParser >> parseString: aString [
	"Parse a PHYLIP format string. Auto-detect sequential/interleaved.
	 Try sequential first; if validation fails, try interleaved."

	| aln |
	aln := [ self parseAsSequential: aString ]
		       on: Error
		       do: [ nil ].
	aln ifNotNil: [ ^ aln ].
	^ self parseAsInterleaved: aString
]

{ #category : 'private' }
BioPhylipParser >> readFirstNumber: aString [
	"Read the first integer from the header line."

	| idx |
	idx := aString indexOf: Character space startingAt: 1.
	idx = 0 ifTrue: [
		idx := aString indexOf: Character tab startingAt: 1 ].
	idx = 0 ifTrue: [ ^ nil ].
	^ [ (aString copyFrom: 1 to: idx - 1) asInteger ]
		  on: Error
		  do: [ nil ]
]

{ #category : 'private' }
BioPhylipParser >> readSecondNumber: aString [
	"Read the second integer from the header line."

	| idx rest |
	idx := aString indexOf: Character space startingAt: 1.
	idx = 0 ifTrue: [
		idx := aString indexOf: Character tab startingAt: 1 ].
	idx = 0 ifTrue: [ ^ nil ].
	rest := (aString copyFrom: idx + 1 to: aString size) trimBoth.
	^ [ rest asInteger ]
		  on: Error
		  do: [ nil ]
]

{ #category : 'initialization' }
BioPhylipParser >> resetForParse: aString [
	"Reset parser state and set up lines from aString."

	self initialize.
	lines := (aString lines select: [ :l | l notEmpty ]) asArray.
	currentLine := 2.
	self parseHeader
]

{ #category : 'accessing' }
BioPhylipParser >> sequences [ ^ sequences
]

{ #category : 'accessing' }
BioPhylipParser >> taxaNames [ ^ taxaNames
]

{ #category : 'private' }
BioPhylipParser >> tryParseInterleaved: aString [
	"Try to parse assuming interleaved format. Signal error on failure."

	| savedState |
	savedState := self deepCopy.
	[
		self resetForParse: aString.
		isInterleaved := true.
		self detectStrictOrRelaxed.
		self parseBodyInterleaved.
		self validate.
		^ self asAlignment ]
		on: Error
		do: [ :ex | "Restore state and re-raise"
				savedState restoreTo: self.
				ex pass ]
]

{ #category : 'private' }
BioPhylipParser >> tryParseSequential: aString [
	"Try to parse assuming sequential format."

	self initialize.
	lines := (aString lines select: [ :l | l notEmpty ]) asArray.
	self parseHeader.
	isInterleaved := false.
	self detectStrictOrRelaxed.
	self parseBodySequential.
	self validate.
	^ self asAlignment
]

{ #category : 'accessing' }
BioPhylipParser >> validate [
	"Validate the parsed data."

	taxaNames size = numTaxa ifFalse: [
			Error signal: 'Expected ' , numTaxa asString , ' taxa but found '
				, taxaNames size asString ].
	sequences size = numTaxa ifFalse: [
			Error signal:
				'Expected ' , numTaxa asString , ' sequences but found '
				, sequences size asString ].
	1 to: numTaxa do: [ :i |
			(sequences at: i) size = numChars ifFalse: [
					Error signal: 'Sequence for ' , (taxaNames at: i) , ' has '
						, (sequences at: i) size asString
						, ' chars but header specifies ' , numChars asString ] ]
]

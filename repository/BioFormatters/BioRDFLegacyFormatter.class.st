"
Produces output files for the Fluxus Network program. The output corresponds to the RDF legacy formatted files. Example:

       11111111111111111111111111
       66666666666666666666666666
       01111111222222222223333333
       91124788112457779991222466
       21497259373260480489457227
                                 
Nuu1a  TCCGCTCCATTCCCGTCCTGTTCTTA  1
Nuu1b  TCCGCTCCATTCCCGTCCTGTTCTTA  1
Nuu1c  TCCGCTCCATTCCCGTCCTGTTCTTA  1
Nuu2a  TCCGCTCTATTCCCGTCCTGTTCTTA  1
Nuu2b  TCCGCTCTATTCCCGTCCTGTTCTTA  1
Nuu3   TCCGCTCTGTTCCCGTCCTGTTCTTA  1
Nuu4   TCCGCTCTGTTCCCGTCCTGTTCTCA  1
Nuu5a  TTCACTTTGTTCCCGCTCTATTCTCA  1
Nuu5b  TTCACTTTGTTCCCGCTCTATTCTCA  1
Nuu6a  TTCACTCTGTTCCCGCCCTATTCTCA  1
Nuu6b  TTCACTCTGTTCCCGCCCTATTCTCA  1

1010101010101010101010101010101010101010101010101010

"
Class {
	#name : #BioRDFLegacyFormatter,
	#superclass : #BioMatrixFormatter,
	#instVars : [
		'frequencies',
		'positionCiphers',
		'nameIndex'
	],
	#category : #'BioFormatters-Formatters'
}

{ #category : #accessing }
BioRDFLegacyFormatter class >> description [
	" Answer a Collection of identifiers of the receiver "
	
	^ 'Fluxus Network Legacy RDF Format'
]

{ #category : #accessing }
BioRDFLegacyFormatter class >> identifiers [
	" Answer a Collection of identifiers of the receiver "
	
	^ #('Obsolete Fluxus' 'Obsolete Network')
]

{ #category : #exporting }
BioRDFLegacyFormatter >> exportCellAtRow: rIndex atColumn: cIndex [

	| contents |
	
	contents := (matrix at: rIndex at: cIndex) ifNil: [ ' ' ].
	self outputFileStream nextPutAll: contents asString.
]

{ #category : #exporting }
BioRDFLegacyFormatter >> exportFirstCellColumnAt: rowIndex [
	" Write contents for the first column(s) at rowIndex position "

	| headerPosition |
	headerPosition := self positionCiphers + 2.

	" Header - Fill with empty spaces "	
	( rowIndex < headerPosition and: [ rowIndex < self matrix numberOfRows ] )
		ifTrue: [ self outputFileStream nextPutAll: ( BioObject generateJoin: String space repeat: 7 ) ].
	
	" Body - Fill with sequences 'names' "
	( rowIndex >= headerPosition and: [ rowIndex <= self matrix numberOfRows ] )
		ifTrue: [
			self outputFileStream 
				nextPutAll: self rowIdentifier;
				space ].
]

{ #category : #exporting }
BioRDFLegacyFormatter >> exportFromBLAST: hitCollection [
	" Write two files: 
	1) A time-stamped file in the receiver's format from hitCollecction
	2) A CSV file linking the receiver's RFLP and STR names with the HIT description information from the BLAST "

	| columns |

	columns := self fillDataColumnsFrom: hitCollection.
	self needsWork.	" Adapt to take positions specified by user "
	positionCiphers := columns last numberOfDigits.
	self initMatrixRows: hitCollection size + positionCiphers + 1
		columns: columns size + 3.	" 2 spaces + 1 character for the frequency column"
	self fillHeaderColumns: columns.
	self fillMatrixFrom: hitCollection columns: columns.
	self fillFrequenciesColumn.
	self exportMatrix.
	self exportWeights.
	self outputFileStream close.
	self exportIdentifiers: hitCollection.	
]

{ #category : #exporting }
BioRDFLegacyFormatter >> exportIdentifiers: hitCollection [

	| tmpFile |
	
	tmpFile := self newFileNamed: 'FNetwork-Identifiers-' , Time totalSeconds asString , '.csv'.
	nameIndex := 1.
	hitCollection do: [ : hit |
		tmpFile 
			nextPutAll: self rowIdentifier;
			nextPut: $;;
			nextPutAll: ( self escapeDelimiters: hit hitDefinition );
			cr ].
	tmpFile close.
]

{ #category : #exporting }
BioRDFLegacyFormatter >> exportWeights [
	" Private - Write the weight row "
	
	self outputFileStream cr.
	self matrix numberOfColumns 
		timesRepeat: [
			self outputFileStream
				nextPutAll: '10' ]

]

{ #category : #exporting }
BioRDFLegacyFormatter >> fileNamePrefix [
	" Answer a String for prefixing the output file name "
	
	^ 'BioST-Exported-fluxus-old-rdf_'
]

{ #category : #populating }
BioRDFLegacyFormatter >> fillDataColumnsFrom: hitCollection [

	| columns alignLength |

	self bioLog: 'Started filling columns...'.
	alignLength := hitCollection first alignLength asNumber.	
	columns := OrderedCollection new: alignLength.
	1 to: alignLength do: [: index |
		| column |
		column := Set new: hitCollection size.
		hitCollection do: [: each |
			index <= each hSequence size
				ifTrue: [ column add: ( each hSequence at: index ) ].
		].
		" Add to difference columns collection if there are 
		differences in the current column "
		column size > 1
			ifTrue: [ columns add: index ].
	].
	self bioLog: 'Finished filling columns...'.
	^ columns
	
]

{ #category : #populating }
BioRDFLegacyFormatter >> fillFrequenciesColumn [
	" Fill the receiver's matrix with the frequencies at last column. If frequencies
	were not provided, then fill the frequencies column with 1's "
	
	self 
		atColumn: self matrix numberOfColumns 
		fillWith: self frequencies
		startingAt: self positionCiphers + 1
	
]

{ #category : #populating }
BioRDFLegacyFormatter >> fillHeaderColumns: columns [
	" Private - columns is a Collection where differences were found "
	
	columns doWithIndex: [: colIndex : index |
		colIndex numberOfDigits < positionCiphers
			ifTrue: [ 
				| position |
				position := self fillPosition: colIndex for: self positionCiphers.
				self atColumn: index fillWith: position contents ]
			ifFalse: [ 
				self atColumn: index fillWith: colIndex asString ]
		]
]

{ #category : #populating }
BioRDFLegacyFormatter >> fillMatrixFrom: hitCollection columns: columns [

	columns doWithIndex: [: colIndex : cIndex |
		hitCollection doWithIndex: [: each : rIndex |
			| sequence |
			colIndex > ( sequence := each hSequence ) size
				ifFalse: [
					matrix 
						at: rIndex + 4
						at: cIndex 
						put: ( sequence at: colIndex ) ] ].
		].
	
]

{ #category : #populating }
BioRDFLegacyFormatter >> fillPosition: colIndex for: maxDigits [
	" Private - Build a column position, answer a String 001 005 032 145 ... "
	
	| pad position |

	pad := maxDigits - colIndex numberOfDigits.
	position := ( WriteStream on: String new ) 
					nextPutAll: ( BioObject generateJoin: '0' repeat: pad );				
					nextPutAll: colIndex asString;
					yourself.
	^ position contents

]

{ #category : #accessing }
BioRDFLegacyFormatter >> formatExtension [
	" Private - Answer a String corresponding for the receiver's file output format "

	^ 'rdf'

]

{ #category : #accessing }
BioRDFLegacyFormatter >> frequencies [
	" Answer a Collection with the receiver's frequencies "
	
	^ frequencies
		ifNil: [ 
			frequencies := 
				BioObject 
					generate: '1' 
					repeat: matrix numberOfRows - self positionCiphers - 1 ].

	
]

{ #category : #accessing }
BioRDFLegacyFormatter >> nameCharacterLimit [
	" Answer a Number representing the max number of characters
	allowed to represent names "
	
	^ 6
]

{ #category : #accessing }
BioRDFLegacyFormatter >> nameIndex [
	" Answer a Number representing the current processed name "
	
	^ nameIndex
		ifNil: [ nameIndex := 1 ]

]

{ #category : #accessing }
BioRDFLegacyFormatter >> nameIndex: aNumber [
	" Set the number representing the current processed name to aNumber "
	
	^ nameIndex := aNumber
]

{ #category : #accessing }
BioRDFLegacyFormatter >> positionCiphers [
	" Answer a Number of the digits for making space in the vertical positions header "

	^ positionCiphers
]

{ #category : #exporting }
BioRDFLegacyFormatter >> rowIdentifier [
	" Answer a String "
	| eName |

	self nameIndex numberOfDigits = self nameCharacterLimit
		ifFalse: [ 
			| pad |
			pad := BioObject generateJoin: '0' 	repeat: self nameCharacterLimit - self nameIndex numberOfDigits.
			eName := pad , self nameIndex asString ]
		ifTrue: [ 
			eName := self nameIndex asString ].
	self nameIndex: self nameIndex + 1.		
	^ eName
]

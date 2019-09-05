"
A Blast filter is used as a container of a filtered result and a Blast reader, along with cumulative status.

It contains utility methods for easy querying of Blast filtered results. For example the #alignsFullIdentity select hits with full alignments, (i.e. Identities is 100%) this is, if Hsp_positive = 326 and Hsp_align-len = 327 identity is 99%.


"
Class {
	#name : #BioBlastFilter,
	#superclass : #BioFilter,
	#category : 'BioBlast-Local'
}

{ #category : #accessing }
BioBlastFilter class >> blastCategories [

	^ self organization categories select: [: cat | cat beginsWith: 'filtering-blast' ]
]

{ #category : #accessing }
BioBlastFilter class >> blastMethods [
	" self blastMethods "

	^ self blastCategories flatCollect: [: cat | BioBlastFilter organization listAtCategoryNamed: cat ]
]

{ #category : #accessing }
BioBlastFilter class >> userCommentAt: aSymbol [

	| userCommentPragma textComment |
	
	textComment := String new.
	userCommentPragma :=  ( self >> aSymbol ) pragmas 
		detect: [: pragma | pragma key = #userComment: ]
		ifNone: [ textComment := 'No description was defined for the selected method' translated ].
	textComment isEmpty
		ifTrue: [ textComment := userCommentPragma argumentAt: 1 ].
	^ textComment
]

{ #category : #comparing }
BioBlastFilter >> = aBioBlastFilter [
	"Answer whether the receiver and anObject represent the same object."

	self class = aBioBlastFilter class
		ifFalse: [ ^ false ].
	self contents = aBioBlastFilter contents
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #accessing }
BioBlastFilter >> addFilteredResultsFrom: collection [
	
	"^ collection ifNotEmpty: [ self addFilterFrom: collection ] ifEmpty: [ self contents ]"
	^ self addFilterFrom: collection
	
]

{ #category : #accessing }
BioBlastFilter >> alignments [
	" Answer the <BioAlignment> of the receiver "

	^ self reader alignments
]

{ #category : #'filtering-blast-alignments' }
BioBlastFilter >> alignsFullIdentity [
	" Answer a filter with the receiver's nodes which were fully aligned (i.e. Identities is 100%)
	i.e. if Hsp_positive = 326 and Hsp_align-len = 327 identity is 99%"
	<userComment: 'Select hits with full alignments, (i.e. Identities is 100%) for example, if Hsp_positive = 326 and Hsp_align-len = 327 identity is 99%"'>

	| collection |
	
	collection := self hits select: [: node | node selectHspAlign = node hspPositive ].
	^ self addFilteredResultsFrom: collection


]

{ #category : #'filtering-blast-alignments' }
BioBlastFilter >> alignsPositivesWithThresholdDiff: aNumber [
	" Answer a filter with the receiver's hit nodes which were identities are aligned at least up to aNumber "

	| collection parameter |
	
	parameter := aNumber anyOne asNumber.
	collection := self hits select: [: node | node selectHspAlign - node selectHspPositive <= parameter ].
	^ self addFilteredResultsFrom: collection

]

{ #category : #'filtering-blast-alignments' }
BioBlastFilter >> alignsWithLengthBetween: minAlignLength and: maxAlignLength [
	" Answer a filter with the receiver's hit nodes which were identities are aligned between maxAlignLength and minAlignLength "
	<userComment: 'Select hits with alignments between a given range. In the BlastOutput XML file it matches with the Hsp_align-len node. The Hsp_align-len is an integer value which contains the length of the alignment used. If there are multiple HSPs, this will answer a Number with the one with the highest alignment.'>

	| collection |
	collection := self hits
		select: [ :node | 
			| alignSize |
			alignSize := node selectHspAlign.
			alignSize >= minAlignLength and: [ alignSize <= maxAlignLength ] ].
	^ self addFilteredResultsFrom: collection
]

{ #category : #'filtering-blast-alignments' }
BioBlastFilter >> alignsWithMaxLength: maxAlignLength [
	" Answer a filter with the receiver's hit nodes which were identities are aligned up to maxAlignLength "

	| collection |
	
	collection := self hits select: [: node | node selectHspAlign <= maxAlignLength ].
	^ self addFilteredResultsFrom: collection
]

{ #category : #'filtering-blast-alignments' }
BioBlastFilter >> alignsWithMinLength: minAlignLength [
	" Answer a filter with the receiver's hit nodes which were identities are aligned up to minAlignLength "

	| collection |
	
	collection := self hits select: [: node | node selectHspAlign >= minAlignLength ].
	^ self addFilteredResultsFrom: collection
]

{ #category : #accessing }
BioBlastFilter >> atHitAccession: aString [
	" Answer the <BlastNode> in the receiver's hits matching aString accession number. 
	See also comment in #asAccessionString "

	^ self hits detect: [ : node | node asAccessionString = aString asAccessionStringWithoutVersion asLowercase ]
]

{ #category : #accessing }
BioBlastFilter >> defaultReaderClass [

	^ BioNCBIBlastReader
]

{ #category : #private }
BioBlastFilter >> definition: aString condition: cmpSymbol [
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	| collection |
	
	collection := self hits select: [: node | 
			node hitDefinition blastValue asLowercase 
				perform: cmpSymbol 
				with: aString asLowercase ].
	^ self addFilteredResultsFrom: collection
]

{ #category : #private }
BioBlastFilter >> definitions: aStringCollection condition: cmpSymbol [
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	| collection |
	collection := 
		aStringCollection collect: [ : srchStr |
			self hits select: [: node | node hitDefinition blastValue perform: cmpSymbol with: srchStr ] ].
	^ self addFilteredResultsFrom: collection
]

{ #category : #'filtering-blast-definitions' }
BioBlastFilter >> definitionsBeginWith: aTermCollection [
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	<userComment: 'Select hits with definition lines (for the database sequence) matching at the beggining of the definition string. A definition string is a mandatory description of the origin and function of a sequence, and is typically found in FASTA descriptions. Although the string line is structured, it doesn''t use a controlled vocabulary, which means you can''t be sure which words will or won''t appear. In the BlastOutput XML file it matches with the Hit_def node. Examples:
	
	''H.sapiens CDK2 mRNA.'' beginsWith: ''H.sapiens CDK2''. ==> true
	''H.sapiens CDK2 mRNA.'' beginsWith: ''H.sapiens'' ==> true'>

	^ aTermCollection size = 1
		ifTrue: [ 
			self 
				definition: aTermCollection anyOne
				condition: #beginsWith: ]
		ifFalse: [
			self 
				definitions: aTermCollection 
				condition: #beginsWith: ]
]

{ #category : #testing }
BioBlastFilter >> hasBehaviorNamed: aSelector [ 
	" Private - For calculated queries, aSelector should be understood by the receiver "
	
	^ self class canUnderstand: aSelector
]

{ #category : #testing }
BioBlastFilter >> hasNewResults [
	" Answer <false> since receiver represents a new filter "

	^ true
]

{ #category : #comparing }
BioBlastFilter >> hash [

	^ self contents hash

]

{ #category : #accessing }
BioBlastFilter >> hits [
	" Answer a Collection with the receiver hits. If we have already filtered results, then use the hits from the last filter "
	
	^ self reader filters isEmpty
		ifTrue: [ self reader hitHspsNodes hits ]
		ifFalse: [ 
			self isCumulativeFilter
				ifTrue: [ self contents result ]
				ifFalse: [ self reader contents result ] ]
]

{ #category : #accessing }
BioBlastFilter >> hspIdentities [
	" Answer a filter with the receiver's HSP identity nodes "

	| collection |
	
	collection := self hits collect: [: node | node hspIdentities ].
	^ self addFilteredResultsFrom: collection
]

{ #category : #accessing }
BioBlastFilter >> hspMidLines [
	" Answer a filter with the receiver's HSP identity nodes "

	| collection |
	
	collection := self hits collect: [: node | node hspMidLines ].
	^ self addFilteredResultsFrom: collection
]

{ #category : #accessing }
BioBlastFilter >> merge: aBioBlastFilter [ 
	" Merge the receiver with aBioBlastFilter"
	
	self filteredResultContents  addAll: (aBioBlastFilter filteredResultContents 
		reject: [ :  blastNode | self filteredResultContents includes: blastNode ]) 
]

{ #category : #'filtering-blast-alignments' }
BioBlastFilter >> percentIdentityOverAlignment: aPercentageFloat cmpSelector: cmpSymbol [
	" Answer a filter with the receiver's hit nodes which were identities are aligned up to aPercentageFloat. "

	| nodes pct |
	
	pct := aPercentageFloat asNumber roundTo: 0.1.	
	nodes := self hits select: [: node | 
						| ident align |
						ident := node selectIdentity asFloat.
						align := node selectHspAlign asFloat.
						(ident / align * 100.0 roundTo: 0.1) perform: cmpSymbol with: pct  ] .
	^ self addFilteredResultsFrom: nodes


]

{ #category : #'filtering-blast-alignments' }
BioBlastFilter >> percentMinPositiveOverAlignment: aPercentageFloat [
	" Answer a filter with the receiver's hit nodes which were identities are aligned up to aPercentageFloat "

	| collection |
	collection := self hits select: [: node | 
						( aPercentageFloat roundTo: 0.1 ) >= 
							( node hspPositive asFloat / node alignLength asFloat * 100.0 roundTo: 0.1 ) ].
	^ self addFilteredResultsFrom: collection
]

{ #category : #private }
BioBlastFilter >> perform: cmpSymbol node: nodeName withArgument: aString [
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	^ (self hasBehaviorNamed: nodeName asSymbol)
		ifTrue: [ self performBehavior: cmpSymbol named: nodeName asSymbol withArgument: aString ]
		ifFalse: [ self performNode: cmpSymbol node: nodeName withArgument: aString ]

]

{ #category : #accessing }
BioBlastFilter >> performBehavior: cmpSymbol named: aSelector withArgument: argString [

	^ self perform: aSelector withArguments: { argString . cmpSymbol }.

]

{ #category : #accessing }
BioBlastFilter >> performNode: cmpSymbol node: nodeName withArgument: argString [ 

	| nodes hits |

	hits := self hits.
	nodes := OrderedCollection new: hits size.
	hits do: [ : node | | recv |
		recv := (node selectNodesNamed: nodeName) blastValue.
		(argString asBlastParameter matches: cmpSymbol receiver: recv)
			ifTrue: [ nodes add: node ] ].
	^ self addFilteredResultsFrom: nodes
]

{ #category : #printing }
BioBlastFilter >> printBlastFilterOn: aStream [
	" Private - Append receiver's information on aStream "

	| currentTime |
	currentTime := DateAndTime current.
	aStream
		nextPutAll: 'a ';
		nextPutAll: self class name; space;
		nextPutAll: self contents size asString , ' hits' between: $( and: $); space;
		nextPutAll: currentTime asDate asString; space;
		nextPutAll: currentTime asTime asString			

]

{ #category : #printing }
BioBlastFilter >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	self contents isNil
		ifTrue: [ aStream nextPutAll: 'Empty Blast Filter' ]
		ifFalse: [ self printBlastFilterOn: aStream ]
]

{ #category : #'filtering-entrez' }
BioBlastFilter >> selectGenBankRecords: aBlock [
	" Answer a Collection of GenBank records satisfying condition in aBlock "
	
	^ self reader 
			selectGenBankRecords: self lastResult result
]

{ #category : #'filtering-entrez' }
BioBlastFilter >> selectGenBankRecords: aBlock from: aDataSource [
	" Answer a Collection of GenBank records from aDataSource satisfying condition in aBlock "
	
	^ self reader 
			selectGenBankRecords: self lastResult result
			from: aDataSource
]

{ #category : #accessing }
BioBlastFilter >> selectHitDefinitions [

	^ self hits contents collect: [: h | h hitDefinition blastValue ]
]

{ #category : #accessing }
BioBlastFilter >> selectHitLengths [
	" Answer a <Collection> of receiver's hit lengths "

	^ self hits collect: #hitLength
]

{ #category : #accessing }
BioBlastFilter >> selectHitScores [

	^ self hits collect: #selectHitScore
]

{ #category : #accessing }
BioBlastFilter >> selectHspAlignLengths [
	
	^ self hits collect: [: h | h hspAlignLengths blastValue]
]

{ #category : #accessing }
BioBlastFilter >> selectHspEValues [

	^ self hits collect: #selectHspEValue
]

{ #category : #accessing }
BioBlastFilter >> selectHspHSeqs [

	^ self hits collect: #selectHspHSeq
]

{ #category : #accessing }
BioBlastFilter >> selectHspHitFroms [

	^ self hits collect: #selectHspHitFrom
]

{ #category : #accessing }
BioBlastFilter >> selectHspHitTos [

	^ self hits collect: #selectHspHitTo
]

{ #category : #accessing }
BioBlastFilter >> selectHspIdentities [

	^ self hits collect: #selectHspIdentity
]

{ #category : #accessing }
BioBlastFilter >> selectHspMidLines [

	^ self hits collect: #selectHspMidLine
]

{ #category : #accessing }
BioBlastFilter >> selectHspNumberOfGaps [

	^ self hits collect: #selectHspNumberOfGaps
]

{ #category : #accessing }
BioBlastFilter >> selectHspPositives [

	^ self hits collect: #selectHspPositive
]

{ #category : #accessing }
BioBlastFilter >> selectHspQueryFroms [

	^ self hits collect: #selectHspQueryFrom
]

{ #category : #accessing }
BioBlastFilter >> selectHspQueryTos [

	^ self hits collect: #selectHspQueryTo
]

{ #category : #accessing }
BioBlastFilter >> selectHspScoreDensities [

	^ self hits collect: #selectHspScoreDensities
]

{ #category : #accessing }
BioBlastFilter >> selectHspScores [

	^ self hits collect: #selectHspBitScores
]

{ #category : #accessing }
BioBlastFilter >> selectPercentagesOverAlignment [

	^ self hits collect: #selectPercentageOverAlignment
]

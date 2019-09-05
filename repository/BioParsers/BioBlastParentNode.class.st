Class {
	#name : #BioBlastParentNode,
	#superclass : #BioBlastContainerNode,
	#category : 'BioParsers-Support'
}

{ #category : #'instance creation' }
BioBlastParentNode class >> new: nodes [

	^ self new initialize: nodes
]

{ #category : #accessing }
BioBlastParentNode class >> nodeDescriptions [ 

	^ #('' '' '' '' '' '' '' '' '' '' '')
]

{ #category : #accessing }
BioBlastParentNode class >> nodeNames [

	^ #('Hsp' 'Hit_hsps' 'Hit')
]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> accessionId [

	^ BioParser parseAccession: self hitAccession blastValue
]

{ #category : #'accessing nodes' }
BioBlastParentNode >> addHitNode: aGTBLASTHitNode [

	self nodes add: aGTBLASTHitNode
]

{ #category : #'accessing nodes' }
BioBlastParentNode >> addHspNode: aGTHspNode [

	self lastHsp addNode: aGTHspNode
]

{ #category : #'accessing nodes' }
BioBlastParentNode >> addNode: aNode [
	" Add aNode to the receiver's nodes "
	
	self nodes add: aNode
]

{ #category : #'accessing nodes' }
BioBlastParentNode >> addParentNode: aGTBLASTParentNode [

	self nodes isEmpty
		ifTrue: [ self nodes add: aGTBLASTParentNode ]
		ifFalse: [ 
			self nodes last isParentNode 
				ifTrue: [ self nodes last addNode:  aGTBLASTParentNode ]
				ifFalse: [ self nodes add: aGTBLASTParentNode ] ]
]

{ #category : #'accessing nodes' }
BioBlastParentNode >> addTo: aGTBLASTNodeCollection [

	aGTBLASTNodeCollection addLast: self.
	^ self hspsNode
]

{ #category : #'accessing nodes' }
BioBlastParentNode >> addToParent: aNode [

	aNode addParentNode: self
]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> asAccessionString [
	" Answer a <String> of receiver's accession number from the accession node, for example: 'AAF52530.1' 
	Note: The value from the accession node usually doesn't contain the accession version number "
	
	^ self asAccessionToken first

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> asAccessionToken [
	" Answer a <String> of receiver's accession number from the accession node, for example: 'AAF52530.1' 
	Note: The value from the accession node usually doesn't contain the accession version number "
	
	^ BioParser tokenizeAccession: self hitAccession blastValue

]

{ #category : #'accessing hsps' }
BioBlastParentNode >> asGeneId [
	" Answer a <Collection> of gene identifiers "
	
	^ BioParser tokenizeGi: self hitIdentifier blastValue
]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hitAccession [
	" Answer a <String> of receiver's accession number from the accession node, for example: 'AAF52530.1' 
	Note: The value from the accession node usually doesn't contain the accession version number "
	
	^ self selectNodeNamed: 'Hit_accession'

]

{ #category : #'accessing hits' }
BioBlastParentNode >> hitAccessions [
	" Answer a <Collection> of receiver's accession of the database sequence (e.g., 'AAF57408.1')
	Note: This method parses dhe accession number from the HIT identifier, not from the Hit_accession node "

	^ (BioParser tokenizeAccession: (self selectNodeNamed: 'Hit_id') blastValue) joinUsing: '.'.

]

{ #category : #'accessing hits' }
BioBlastParentNode >> hitDefinition [
	" Answer a Collection of receiver's definition lines of the database sequence "
	
	^ (self selectNodeNamed: 'Hit_def') value.

]

{ #category : #'accessing hits' }
BioBlastParentNode >> hitDefinitions [
	" Answer a Collection of receiver's accession of the database sequence (e.g., 'AAF57408.1')
	Note: This method parses dhe accession number from the HIT identifier, not from the Hit_accession node "

	^ (self selectNodesNamed: 'Hit_def') collect: #blastValue

]

{ #category : #'accessing hits' }
BioBlastParentNode >> hitHsps [
	"  "
	
	^ self selectNodeNamed: 'Hit_hsps'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hitIdentifier [
	" Answer a String of receiver's identifier of the database sequence (e.g., 'gi|7297267|gb|AAF52530.1|') "
	
	^ self selectNodeNamed: 'Hit_id'

]

{ #category : #'accessing hits' }
BioBlastParentNode >> hitIdentifiers [
	" Answer a Collection of receiver's identifier of the database sequence (e.g., 'gi|7297267|gb|AAF52530.1|') "
	
	^ self selectNodesNamed: 'Hit_id'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hitLength [
	" Answer the receiver's hit length "
	
	^ (self selectNodeNamed: 'Hit_len') blastValue.

]

{ #category : #'accessing hits' }
BioBlastParentNode >> hitNumbers [
	" Answer a Collection of receiver's ordinal number of the hit, with one-offset (e.g., '1, 2...') "
	
	^ self selectNodesNamed: 'Hit_num'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspAlignLength [
	" Answer a <Number> of receiver's align length "
	
	^ self selectNodeNamed: 'Hsp_align-len'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspAlignLengths [
	" Answer a Collection of receiver's align lengths nodes in each HSP node "
	
	^ self selectNodesNamed: 'Hsp_align-len'.

]

{ #category : #'accessing hsps' }
BioBlastParentNode >> hspAlignLengths: aBlock [
	" Possibly deprecated "
	" Answer a Collection of hits satisfying conditions specified in aBlock for align lengths in each HSP node for each HIT "
	
	| hits |
	
	hits := OrderedCollection new.
	self hits do: [: pHit | 
		( pHit hspsNode hspAlignLengths anySatisfy: [ : v | aBlock value: v ] )
			ifTrue: [ hits add: pHit ] ].
	^ hits
]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspBitScore [
	" Answer a Collection of receiver's scores (in bits) of the HSPs "
	
	^ self selectNodeNamed: 'Hsp_bit-score'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspBitScores [
	" Answer a Collection of receiver's scores (in bits) of the HSPs "
	
	^ self selectNodesNamed: 'Hsp_bit-score'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspEValue [
	" Answer a Number of receiver's expect value of the HSPs "
	
	^ self selectNodeNamed: 'Hsp_evalue'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspEValues [
	" Answer a Collection of receiver's expect values of the HSPs "
	
	^ self selectNodesNamed: 'Hsp_evalue'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspGaps [
	" Answer a <Number> of receiver's number of gaps in the alignment "
	
	^ self selectNodesNamed: 'Hsp_gaps'.
]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspHSeq [
	" Answer a <String> of receiver's alignment strings (for the database) nodes in each HSP node "
	
	^ self selectNodeNamed: 'Hsp_hseq'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspHSeqs [
	" Answer a Collection of receiver's alignment strings (for the database) nodes in each HSP node "
	
	^ self selectNodesNamed: 'Hsp_hseq'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspHitFrame [
	" Answer a <Number> of receiver's number of frames of the database sequence if applicable "
	
	^ self selectNodeNamed: 'Hsp_hit-frame'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspHitFrames [
	" Answer a Collection of receiver's number of frames of the database sequence if applicable "
	
	^ self selectNodesNamed: 'Hsp_hit-frame'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspHitFrom [
	" Answer a <Number> of receiver's offset of sequence at the start of the alignment (one-offset) "
	
	^ self selectNodesNamed: 'Hsp_hit-from'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspHitScores [
	" Answer a Collection of receiver's expect values of the HSPs "
	
	^ self selectNodesNamed: 'Hsp_score'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspHitTo [
	" Answer a <Number> of receiver's offsets of sequence at the end of the alignment (one-offset) "
	
	^ self selectNodesNamed: 'Hsp_hit-to'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspHitTos [
	" - "
	
	^ self selectNodesNamed: 'Hsp_hit-to'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspIdentities [
	" Answer a Collection of receiver's number of identities in the alignment "
	
	^ self selectNodesNamed: 'Hsp_identity'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspIdentity [
	" Answer a <Number> of receiver's number of identities in the alignment "
	
	^ self selectNodeNamed: 'Hsp_identity'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspMidLine [
	" Answer a <String> of receiver's formatting middle line as normally seen in BLAST report "
	
	^ self selectNodeNamed: 'Hsp_midline'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspMidLines [
	" Answer a Collection of receiver's formatting middle lines as normally seen in BLAST report "
	
	^ self selectNodesNamed: 'Hsp_midline'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspPositive [
	" Answer a <Number> of receiver's number of positive (conservative) substitutions in the alignment "
	
	^ self selectNodeNamed: 'Hsp_positive'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspPositives [
	" Answer a Collection of receiver's number of positive (conservative) substitutions in the alignment "
	
	^ self selectNodesNamed: 'Hsp_positive'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspQSeq [
	" Answer a <String> of receiver's alignment strings (for the query, this is the originally sent by the Blast user) "
	
	^ self selectNodeNamed: 'Hsp_qseq'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspQSeqs [
	" Answer a Collection of receiver's alignment strings (for the query, this is the originally sent by the Blast user) "
	
	^ self selectNodesNamed: 'Hsp_qseq'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspQueryFrame [
	" Answer a <Number> of receiver's frame of the query if applicable "
	
	^ self selectNodeNamed: 'Hsp_query-frame'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspQueryFrames [
	" Answer a <Collection> of receiver's frames of the query if applicable "
	
	^ self selectNodesNamed: 'Hsp_query-frame'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspQueryFrom [
	" Answer a <Number> of receiver's offsets of query at the start of the alignment (one-offset) "
	
	^ self selectNodesNamed: 'Hsp_query-from'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspQueryFroms [
	" Answer the start of HSP in query"
	
	^ self selectNodesNamed: 'Hsp_query-from'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspQueryTo [
	" Answer a <Number> of receiver's offset of query at the end of the alignment (one-offset) "
	
	^ self selectNodesNamed: 'Hsp_query-to'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspQueryTos [
	" - "
	
	^ self selectNodesNamed: 'Hsp_query-to'.

]

{ #category : #'accessing hit individually' }
BioBlastParentNode >> hspScore [
	" Answer a Collection of receiver's scores of the HSP "
	
	^ self selectNodeNamed:  'Hsp_score'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspScoreDensity [
	" Answer a Collection of receiver's scores of the HSP "
	
	^ self selectNodesNamed:  'Hsp_density'.

]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspScores [
	" Answer a <Collection> of receiver's scores of the HSP "
	
	^ self selectNodesNamed:  'Hsp_score'.

]

{ #category : #'accessing hsps' }
BioBlastParentNode >> hspsDo: aBlock [

	self hspsNodes do: [: node | aBlock value: node ]
]

{ #category : #'filtering - hsps' }
BioBlastParentNode >> hspsGaps [
	" Answer a Collection of receiver's number of gaps in the alignment "
	
	^ self selectNodesNamed: 'Hsp_gaps'.
]

{ #category : #'accessing hsps' }
BioBlastParentNode >> hspsNode [

	^ self nodes 
			detect: [: node | node nodeName = 'Hit_hsps' ]
			ifNone: [ self nodes add: ( self nodeFor: 'Hit_hsps' ) ]
]

{ #category : #'accessing hsps' }
BioBlastParentNode >> hspsNodes [

	^ self nodes select: [: node | node nodeName = 'Hit_hsps' ]

]

{ #category : #'initialize-release' }
BioBlastParentNode >> initialize: numberOfNodes [
	" Private - Initialize the receiver's nodes <Collection> "
	
	nodes := OrderedCollection new: numberOfNodes
]

{ #category : #testing }
BioBlastParentNode >> isHitNode [
	" Answer <true> if receiver's type is a HIT node "
	
	^ self nodeName = 'Hit'
]

{ #category : #testing }
BioBlastParentNode >> isParentNode [

	^ true
]

{ #category : #'accessing hsps' }
BioBlastParentNode >> lastHsp [

	^ self hspsNode lastHspNode
]

{ #category : #'accessing hsps' }
BioBlastParentNode >> lastHspNode [

	^ self nodes reversed
		detect: [: node | node nodeName = 'Hsp' ]
		ifNone: [ self nodes add: ( self nodeFor: 'Hsp' ) ]
]

{ #category : #'accessing nodes' }
BioBlastParentNode >> nodeFor: aNodeName [
	" Answer a new node setting the element name to aNodeName "
	
	^ BioBlastNode nodeFor: aNodeName
]

{ #category : #'accessing hsps' }
BioBlastParentNode >> percentageOverAlignment [

	^ self nodes collect: [: node | 
		| ident align |
		ident := self selectIdentity asFloat.
		align := self selectHspAlign asFloat.
		(ident / align * 100.0 roundTo: 0.1) ]

]

{ #category : #'accessing hsps' }
BioBlastParentNode >> selectAccessionNumber [
	" Answer a BioAccession object "
	
	^ self selectAccessionNumbers first
]

{ #category : #'accessing hsps' }
BioBlastParentNode >> selectAccessionNumbers [
	" Answer a <Collection> of accession numbers "
	
	^ (self hitIdentifiers collect: #blastValue) collect: [: defString | BioParser parseAccession: defString ]
]

{ #category : #'accessing hsps' }
BioBlastParentNode >> selectGeneIdentifiers [
	" Answer a <Collection> of gene identifiers "
	
	^ (self hitIdentifiers collect: #blastValue) collect: [: defString | BioParser tokenizeGi: defString ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHitScore [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspHitScores size > 1
		ifFalse: [ self hspHitScores anyOne blastValue ]
		ifTrue: [ (self hspHitScores detectMax: [: e | e blastValue asNumber ]) blastValue asNumber ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspAlign [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspAlignLengths size > 1
		ifFalse: [ self hspAlignLengths anyOne blastValue ]
		ifTrue: [ ( self hspAlignLengths detectMax: [: align | align blastValue asNumber ] ) blastValue asNumber ]
]

{ #category : #'accessing hsps' }
BioBlastParentNode >> selectHspAlignLengths [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspAlignLengths collect: #blastValue
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspBitScores [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspBitScores size > 1
		ifFalse: [ self hspBitScores anyOne blastValue ]
		ifTrue: [ (self hspBitScores detectMax: [: e | e blastValue asNumber ]) blastValue asNumber ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspEValue [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspEValues size > 1
		ifFalse: [ self hspEValues anyOne blastValue ]
		ifTrue: [ (self hspEValues detectMax: [: e | e blastValue asNumber ]) blastValue asNumber ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspHSeq [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspHSeqs size > 1
		ifFalse: [ self hspHSeqs anyOne blastValue ]
		ifTrue: [ ( self hspHSeqs detectMax: [: hspMidLine | hspMidLine blastValue size ] ) blastValue ]

]

{ #category : #'accessing hsps' }
BioBlastParentNode >> selectHspHSeqs [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspHSeqs collect: #blastValue

]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspHitFrom [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspHitFrom size > 1
		ifFalse: [ self hspHitFrom anyOne blastValue ]
		ifTrue: [ (self hspHitFrom detectMax: [: hspHitFrom | hspHitFrom blastValue size ]) blastValue ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspHitTo [
	" - "

	^ self hspHitTo size > 1
		ifFalse: [ self hspHitTo anyOne blastValue ]
		ifTrue: [ (self hspHitTo detectMax: [ : hspHitFrom | hspHitFrom blastValue size ]) blastValue ]


]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspIdentity [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspIdentities size > 1
		ifFalse: [ self hspIdentities anyOne blastValue ]
		ifTrue: [ ( self hspIdentities detectMax: [: id | id blastValue asNumber ] ) blastValue asNumber ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspMidLine [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspMidLines size > 1
		ifFalse: [ self hspMidLines anyOne blastValue ]
		ifTrue: [ ( self hspMidLines detectMax: [: hspMidLine | hspMidLine blastValue size ] ) blastValue ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspNumberOfGaps [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	| gaps |
	^ (gaps := self hspGaps) size > 1
		ifFalse: [ 
			gaps isEmpty 
				ifTrue: [ 'Not present' ]
				ifFalse: [ gaps anyOne blastValue ] ]
		ifTrue: [ (gaps detectMax: [: hspGaps | hspGaps blastValue ]) blastValue ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspPositive [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer the one with the highest percent alignment. "
	
	^ self hspPositives size > 1
		ifFalse: [ self hspPositives anyOne blastValue ]
		ifTrue: [ ( self hspPositives detectMax: [: positive | positive blastValue asNumber ] ) blastValue asNumber ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspQSeq [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspQSeqs size > 1
		ifFalse: [ self hspQSeqs anyOne blastValue ]
		ifTrue: [ ( self hspQSeqs detectMax: [: hspq | hspq blastValue size ] ) blastValue ]

]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspQueryFrom [
	" Answer the start of HSP in query"

	^ self hspQueryFrom size > 1
		ifFalse: [ self hspQueryFrom anyOne blastValue ]
		ifTrue: [ (self hspQueryFrom detectMax: [ : hspq | hspq blastValue size ]) blastValue ]

]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspQueryTo [
	" - "
	
	^ self hspQueryTo size > 1
		ifFalse: [ self hspQueryTo anyOne blastValue ]
		ifTrue: [ (self hspQueryTo detectMax: [ : hspq | hspq blastValue size ]) blastValue ]

]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspScore [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "

	^ self hspScores size > 1
		ifFalse: [ self hspScores anyOne blastValue ]
		ifTrue: [ (self hspScores detectMax: [: hspScore | hspScore blastValue asNumber ]) blastValue asNumber ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectHspScoreDensities [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	| score |
	^ (score := self hspScoreDensity) size > 1
		ifFalse: [ 
			score isEmpty 
				ifTrue: [ 'Not present' ]
				ifFalse: [ score anyOne blastValue ] ]
		ifTrue: [ (score detectMax: [: hspScoreDensity | hspScoreDensity blastValue size ]) blastValue ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectIdentity [
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer the one with the highest percent identity. "
	
	^ self hspIdentities size > 1
		ifFalse: [ self hspIdentities anyOne blastValue ]
		ifTrue: [ ( self hspIdentities detectMax: [: ident | ident blastValue asNumber ] ) blastValue asNumber ]
]

{ #category : #'extracting - hsps' }
BioBlastParentNode >> selectPercentageOverAlignment [

	^ self percentageOverAlignment size > 1
		ifFalse: [ self percentageOverAlignment anyOne blastValue ]
		ifTrue: [ (self percentageOverAlignment detectMax: [ : pct | pct asNumber ]) ]
]

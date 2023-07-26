"
Represents a reader over a collection of NCBI BLAST hits.

It contains a `Collection` of _High Scoring Pairs_ XML node names, which will be the ones ""catched"" by the receiver.
"
Class {
	#name : #BioNCBIBlastReader,
	#superclass : #BioNCBIReader,
	#instVars : [
		'selectedNodes',
		'parsingStrategy'
	],
	#category : #'BioBlast-Remote'
}

{ #category : #'accessing-nodes' }
BioNCBIBlastReader class >> allNodeNames [
	"Answer a <Collection> of <String> with all the receiver's node names"

	^ self allNodes keys
]

{ #category : #'accessing-nodes' }
BioNCBIBlastReader class >> allNodes [
	
	^ self hitNodes , self hitHspsNodes
]

{ #category : #'accessing-nodes' }
BioNCBIBlastReader class >> headerNodes [

	^ Dictionary new
		  add: 'BlastOutput_query-ID' -> 'SeqId of query';
		  add: 'BlastOutput_version' -> 'Program Version';
		  add: 'Parameters_filter' -> 'Filtering options (-F)';
		  add: 'Parameters_gap-open' -> 'Gap opening cost (-G)';
		  add: 'BlastOutput_query-def' -> 'Definition line of query';
		  add: 'BlastOutput_reference' -> 'BLAST Reference';
		  add: 'Parameters_gap-extend' -> 'Gap extension cost (-E)';
		  add: 'Parameters_sc-mismatch' -> 'Mismatch score for NT (-q)';
		  add: 'Parameters_sc-match' -> 'Match score for NT (-r)';
		  add: 'Parameters_expect' -> 'Expectation threshold (-e)';
		  add: 'BlastOutput_query-len' -> 'Length of query sequence';
		  add: 'BlastOutput_db' -> 'BLAST Database Name';
		  add: 'BlastOutput_program' -> 'BLAST program: blastp, tblastx etc.';
		  yourself
]

{ #category : #'accessing-nodes' }
BioNCBIBlastReader class >> hitHspsNodes [

	" Answer a Dictionary with key containing a String with the HSP node name and a description String as value "

	^ Dictionary new
		  add: 'Hsp_bit-score' -> '';
		  add: 'Hsp_hit-to'
			  ->
				  'Offset of database sequence at the end of the alignment (one-offset)';
		  add: 'Hsp_query-to'
			  -> 'Offset of query at the end of the alignment (one-offset)';
		  add: 'Hsp_gaps' -> 'Number of gaps in the alignment';
		  add: 'Hsp_align-len' -> 'Length of the alignment used';
		  add: 'Hsp_pattern-to'
			  -> 'End of phi-blast pattern on the query (one-offset)';
		  add: 'Hsp_midline'
			  -> 'Formatting middle line as normally seen in BLAST report';
		  add: 'Hsp_hit-from'
			  ->
				  'Offset of database sequence at the start of the alignment (one-offset)';
		  add: 'Hsp_num' -> 'Ordinal number of the HSP, one-offset';
		  add: 'Hsp_identity' -> 'Number of identities in the alignment';
		  add:
			  'Hsp_hit-frame' -> 'Frame of the database sequence if applicable';
		  add: 'Hsp_evalue' -> 'Expect value of the HSP';
		  add: 'Hsp_qseq' -> 'Alignment string for the query';
		  add: 'Hsp_query-frame' -> 'Frame of the query if applicable';
		  add: 'Hsp_query-from'
			  -> 'Offset of query at the start of the alignment (one-offset)';
		  add: 'Hsp_score' -> 'Score (in bits) of the HSP';
		  add: 'Hsp_hseq' -> 'Alignment string for the database';
		  add: 'Hsp_positive'
			  ->
				  'Number of positive (conservative) substitutions in the alignment';
		  add: 'Hsp_density' -> 'Score density';
		  add: 'Hsp_pattern-from'
			  -> 'Start of phi-blast pattern on the query (one-offset)';
		  yourself
]

{ #category : #'accessing-nodes' }
BioNCBIBlastReader class >> hitHspsNodesNames [
	" Answer a Dictionary with key containing a String with the HSP node name and a description String as value "
	
	^ self hitHspsNodes keys
]

{ #category : #'accessing-nodes' }
BioNCBIBlastReader class >> hitNodes [
	" Answer a <Dictionary> mapping XML node names with a useful description "

	^ Dictionary new
		  add: 'Hit_accession' -> 'Accession of the database sequence (e.g., "AAF57408")';
		  add: 'Hsp_hit-to' -> 'Offset of database sequence at the end of the alignment (one-offset)';
		  add: 'Hit_hsps' -> 'Serves as container of each HIT information';
		  add: 'Hsp_gaps' -> 'Number of gaps in the alignment';
		  add: 'Hsp_query-to' -> 'Offset of query at the end of the alignment (one-offset)';
		  add: 'Hsp_align-len' -> 'Length of the alignment used';
		  add: 'Hsp' -> 'Serves as container of each HIT information';
		  add: 'Hsp_midline' -> 'Formatting middle line as normally seen in BLAST report';
		  add: 'Hsp_hit-from' -> 'Offset of database sequence at the start of the alignment (one-offset)';
		  add: 'Hsp_pattern-to' -> 'End of phi-blast pattern on the query (one-offset)';
		  add: 'Hit_len' -> 'Length of the database sequence';
		  add: 'Hsp_identity' -> 'Number of identities in the alignment';
		  add: 'Hsp_num' -> 'Ordinal number of the HSP, one-offset';
		  add: 'Hit_num' -> 'Ordinal number of the hit, with one-offset (e.g., "1, 2...")';
		  add: 'Hsp_hit-frame' -> 'Frame of the database sequence if applicable';
		  add: 'Hsp_evalue' -> 'Expect value of the HSP';
		  add: 'Hit_id' -> 'Identifier of the database sequence (e.g., "gi|7297267|gb|AAF52530.1|")';
		  add: 'Hit_def' -> 'Definition line of the database sequence (e.g., "(AE003618) CG6717 gene...")';
		  add: 'Hsp_qseq' -> 'Alignment string for the query';
		  add: 'Hsp_hseq' -> 'Alignment string for the database';
		  add: 'Hsp_query-frame' -> 'Frame of the query if applicable';
		  add: 'Hsp_query-from' -> 'Offset of query at the start of the alignment (one-offset)';
		  add: 'Hsp_density' -> 'Score density';
		  add: 'Hsp_positive' -> 'Number of positive (conservative) substitutions in the alignment';
		  add: 'Hsp_score' -> 'Score (in bits) of the HSP';
		  add: 'Hsp_pattern-from' -> 'Start of phi-blast pattern on the query (one-offset)';
		  yourself
]

{ #category : #'accessing-nodes' }
BioNCBIBlastReader class >> hitNodesNames [

	^ self allNodes keys
]

{ #category : #private }
BioNCBIBlastReader class >> isPreferredFor: aString [
	" Answer <true> if aString is the most appropriate content for the receiver "
	
	^ aString includesDtd: 'NCBI_BlastOutput.dtd'

]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> alignments [
	" Answer a <BioAlignment> of receiver's alignment (for the database) in each receiver's HSP node "
	
	| align parsedOrFilteredResults |
	
	align := BioAlignment new.
	" Iterate over the receiver's filtered contents if appropriate "
	parsedOrFilteredResults := self contents result.
	parsedOrFilteredResults collect: [: eachHit | 
		| theHsp |
		theHsp := eachHit hitHsps nodes anyOne.
		align addSequence: ( 
			BioSequence 
				newNamed: eachHit hitAccessions 
				sequence: theHsp hspHSeq blastValue ) ].
	^ align
]

{ #category : #'accessing-blast-meta' }
BioNCBIBlastReader >> blastDbName [
	" Answer a String with the database name used to perform the BLAST "

	^ ( self 
		selectHeaderNodesIn: self headerContents )
			at: 'BlastOutput_db'

	
]

{ #category : #'accessing-blast-meta' }
BioNCBIBlastReader >> blastHeader [
	" Answer a String with the parser receiver's contents header "

	^ self selectHeaderNodesIn: self headerContents
	
]

{ #category : #'accessing-blast-meta' }
BioNCBIBlastReader >> blastProgramName [
	" Answer a String with the program name used to perform the BLAST "

	^ ( self 
		selectHeaderNodesIn: self headerContents )
			at: 'BlastOutput_program'

	
]

{ #category : #'accessing-blast-meta' }
BioNCBIBlastReader >> blastProgramVersion [
	" Answer a String with the program name used to perform the BLAST "

	^ ( self 
		selectHeaderNodesIn: self headerContents ) 
			at: 'BlastOutput_version'

	
]

{ #category : #'accessing-blast-meta' }
BioNCBIBlastReader >> blastQueryDef [
	" Answer a String with the query definition line of the BLAST "

	^ ( self 
		selectHeaderNodesIn: self headerContents ) 
			at: 'BlastOutput_query-def'

	
]

{ #category : #'accessing-blast-meta' }
BioNCBIBlastReader >> blastQueryId [
	" Answer a String with the query ID of the BLAST "

	^ ( self 
		selectHeaderNodesIn: self headerContents ) 
			at: 'BlastOutput_query-ID'

	
]

{ #category : #'accessing-blast-meta' }
BioNCBIBlastReader >> blastQueryLength [
	" Answer a String with the query length of the BLAST "

	^ ( self 
		selectHeaderNodesIn: self headerContents ) 
			at: 'BlastOutput_query-len'

	
]

{ #category : #private }
BioNCBIBlastReader >> dbName [
	" Answer a Symbol of the database used for the receiver's search "
	" #nuccore "
	
	^ self blastDbName
]

{ #category : #private }
BioNCBIBlastReader >> defaultFilterClass [
	" Answer a Class acting as a default filter to handle filtered results and updates.
	See comments in BioFilter class "
	
	^ BioBlastFilter
]

{ #category : #'accessing-entrez' }
BioNCBIBlastReader >> downloadGenBankRecords [
	" On-Line version. Answer <true> if downloading was successfull "
	
	^ self downloadGenBankRecords: self contents.
]

{ #category : #accessing }
BioNCBIBlastReader >> downloadGenBankRecords: aBioResultObjet [
	" On-Line version. Answer <true> if downloading was successfull "
	
	| trWindow  |
	
	trWindow := self bioLog: 'Downloading GenBank records...'.
	self nextReader
		genBankRecordsAsXMLFrom: aBioResultObjet contents
		database: self blastDbName;
		saveFilterContents.
	trWindow close.
	^ self nextReader contents

]

{ #category : #accessing }
BioNCBIBlastReader >> exportTo: aBioFormatter [ 

	aBioFormatter exportFromReader: self

]

{ #category : #accessing }
BioNCBIBlastReader >> genBankReaderClass [

	^ BioNCBIGenBankReader
]

{ #category : #'accessing-entrez' }
BioNCBIBlastReader >> genBankRecordsAsFlat [
	" Private - Answer a Collection of GenBank records in GenBank Flat File Format using the gene identifiers from the receiver's contents "
	
	self searchResults: (self genBankRecordsFrom: self blastDbName format: #setModeGb).
	^ self searchResults size = 1
		ifTrue: [ self searchResults anyOne result ]
		ifFalse: [ self searchResults collect: #result ]

]

{ #category : #'accessing-entrez' }
BioNCBIBlastReader >> genBankRecordsAsXML [
	" Query the Entrez system using the receiver's gene identifiers list.
		Answer a XML String with the results. 
		If the receiver's contains more than #entrezUrlUidLimit gene identifiers then the resulting Collection will be splitted into XML Strings representing the results "
	
	self searchResults: ( 
		self 
			genBankRecordsFrom: self blastDbName 
			format: #setModeXML ).
	^ self searchResults size = 1
		ifTrue: [ self searchResults anyOne result ]
		ifFalse: [ self searchResults collect: #result ]
]

{ #category : #'accessing-entrez' }
BioNCBIBlastReader >> genBankRecordsFrom: dbSymbol format: formatSymbol [

	self nextReader: self genBankReaderClass new.
	^ self nextReader
			genBankRecordsFrom: dbSymbol 
			format: formatSymbol 
			uids: self giList asArray

]

{ #category : #'accessing-blast-filters' }
BioNCBIBlastReader >> giList [
	" Answer a Collection with the gene identifiers numbers from the receiver's results.
	Example output: #('256041716' '256041695' '256041622' ... )"

	^ (self hitIdentifiers collect: #asGeneId) reject: #isEmpty

]

{ #category : #testing }
BioNCBIBlastReader >> hasQuerySequence [
	" Answer <true> if receiver is a valid sequence "

	^ self querySequence notNil and: [ self querySequence notEmpty ]
]

{ #category : #'accessing-blast-meta' }
BioNCBIBlastReader >> headerContents [
	" Answer a String containing the header contents of the receiver.
	This is to avoid reading the entire file (which could be huge) to
	process the meta nodes which are located at the header of the XML "
	
	^ [  self results first: 3500 ]
	on: SubscriptOutOfBounds 
	do: [ : ex | self results first: 200 ]
	
]

{ #category : #'accessing-blast-filters' }
BioNCBIBlastReader >> hitAccessions [
	" Answer a Collection with the accession objects from the receiver's results "

	self parsingStrategy ifNil: [ self setSAXTokenizer ].
	^ (BioParser perform: self parsingStrategy withArguments: {contents . #('Hit_accession')}) 
		collect: #accessionId


]

{ #category : #'accessing-blast-filters' }
BioNCBIBlastReader >> hitAccessionsAsString [
	" Answer a Collection with the accession Strings from the receiver's results "

	self parsingStrategy ifNil: [ self setSAXTokenizer ].
	^ (BioParser perform: self parsingStrategy withArguments: {contents . #('Hit_accession')}) 
		collect: [: id | id accessionId asString ]

]

{ #category : #'accessing-blast-filters' }
BioNCBIBlastReader >> hitAccessionsAsTokens [
	" Answer a Collection with the accession numbers tokenized from the receiver's results "

	self parsingStrategy ifNil: [ self setSAXTokenizer ].
	^ (BioParser perform: self parsingStrategy withArguments: {contents . #('Hit_accession')}) 
		collect: #asAccessionToken
]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> hitHsps [
	"Answer a <Collection> of <BioBlastNode> from the receiver's results (each HSP is contained in its respective HIT node)"

	^ (self selectHspNodesIn: self results) nodes
]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> hitHspsNodes [
	"Answer a <BioBlastNode> from the receiver's results (each HSP is contained in its respective HIT node)"

	^ self selectHspNodesIn: self results
]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> hitIdentifiers [
	" Answer a <Collection> of receiver's hit identifiers "

	self parsingStrategy ifNil: [ self setSAXTokenizer ].
	^ BioParser perform: self parsingStrategy withArguments: {contents . #('Hit_id')}
]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> hitNodes [

	^ self 
		selectNodes: BioNCBIBlastReader hitNodesNames 
		in: self results
]

{ #category : #'accessing-blast-items' }
BioNCBIBlastReader >> hitNodesDo: aBlock [

	^ self nodes do: aBlock
]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> hitResults [
	" Answer a Collection of BioBlastParentNode's with all the HIT nodes from the receiver's results "

	^ self hitHspsNodes hits.


]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> hits [
	" Answer a <Collection> with all the HIT nodes from the receiver's results "

	^ self filters isEmpty
		ifTrue: [ self hitHspsNodes hits. ]
		ifFalse: [ self lastFilter lastResult ]

]

{ #category : #'accessing-blast-items' }
BioNCBIBlastReader >> hspHSeqFrom: hit [

	^ hit selectHspHSeq
]

{ #category : #'accessing-blast-items' }
BioNCBIBlastReader >> hspHSeqs [
	" Answer a Collection of receiver's alignment strings (for the database) in each receiver's HSP node "
	
	| bioSearchResult |

	bioSearchResult := self contents.
	^ bioSearchResult contents collect: [: node | node selectHspHSeq ]
]

{ #category : #'accessing-blast-items' }
BioNCBIBlastReader >> hspQSeqs [
	" Answer a Collection of receiver's alignment strings (for the query, this is the originally sent by the Blast user) "
	
	| bioSearchResult |

	bioSearchResult := self contents.
	^ bioSearchResult contents collect: [: node | node selectHspQSeq ]
]

{ #category : #'accessing-blast-items' }
BioNCBIBlastReader >> hspQueryFromFrom: hit [

	^ hit selectHspQueryFrom anyOne blastValue
]

{ #category : #'accessing-blast-items' }
BioNCBIBlastReader >> hspQueryToFrom: hit [

	^ hit selectHspQueryTo anyOne blastValue
]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> identities [
	" Answer a <Collection> of Strings each one representing the identity (matching residues) in the receiver "
	
	^ self filters isEmpty
		ifTrue: [ 
			( self
				selectNodes: 	#('Hsp_identity')
				in: self results ) at: 'Hsp_identity' ]
		ifFalse: [
			self lastFilter hspIdentities ]
]

{ #category : #accessing }
BioNCBIBlastReader >> lastResult [
	" Answer the last <BioResultObject> in chronological order "

	^ results detectMax: [ : r | r date ]
]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> nodes [

	self parsingStrategy ifNil: [ self setSAXParser ].
	^ BioParser 
		perform: self parsingStrategy
		withArguments: {contents . self selectedNodes}
]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> padAlignment: aCollection [
	" Answer a <Collection> of receiver's alignment (for the database) in each receiver's HSP node.
	The case for sequences which are not completely aligned are handled this way:
	1) For #hspQueryFrom not starting at 1: Left pad with a Missing Character Symbol
	2) For #hspQueryTo less than #refSeqSize: Right pad with Missing Character Symbol 
	3) For #hspQueryTo greater than #refSeqSize: Not handled for now (ToDo) "
	
	aCollection do: [ : gbDictionary | 
		gbDictionary 
			at: 'Padded_sequence' 
			put: (self padAlignmentIn: (gbDictionary at: 'BlastNode')) ].
	^ aCollection
]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> padAlignmentIn: hit [
	" Private - See comment in #paddedAlignments "

	| qFromIndex qToIndex correctedSeq |

	qFromIndex := self hspQueryFromFrom: hit.
	qToIndex := self hspQueryToFrom: hit.
	correctedSeq := self hspHSeqFrom: hit.

	qFromIndex ~= 1 
		ifTrue: [ correctedSeq := (BioObject generateJoin: $? repeat: qFromIndex - 1) , correctedSeq ].
	self hasQuerySequence 
		ifFalse: [ self error: 'Missing reference (query) sequence' ].
	qToIndex <  self querySequence size 
		ifTrue: [ correctedSeq := correctedSeq , (BioObject generateJoin: $? repeat: self querySequence size - qToIndex)  ].

	^ correctedSeq
]

{ #category : #'accessing-blast' }
BioNCBIBlastReader >> paddedAlignments [
	" Answer a <Collection> of receiver's alignment (for the database) in each receiver's HSP node.
	The case for sequences which are not completely aligned are handled this way:
	1) For #hspQueryFrom not starting at 1: Left pad with a Missing Character Symbol
	2) For #hspQueryTo less than #refSeqSize: Right pad with Missing Character Symbol 
	3) For #hspQueryTo greater than #refSeqSize: Not handled for now (ToDo) "
	
	| align filteredResults |
	
	align := BioAlignment new.
	filteredResults := self contents result.
	filteredResults result collect: [ : eachHit | 
		align addSequence: ( 
			BioSequence 
				newNamed: eachHit hitAccessions 
				sequence: (self padAlignmentIn: eachHit)) ].
	^ align
]

{ #category : #accessing }
BioNCBIBlastReader >> parsingStrategy [
	^ parsingStrategy
]

{ #category : #accessing }
BioNCBIBlastReader >> parsingStrategy: anObject [
	parsingStrategy := anObject
]

{ #category : #'accessing-blast-filters' }
BioNCBIBlastReader >> resultClass [

	^ BioInitialResult
]

{ #category : #private }
BioNCBIBlastReader >> selectAllNodes [

	self selectedNodes: self class allNodeNames
]

{ #category : #private }
BioNCBIBlastReader >> selectHeaderNodesIn: aDocumentString [
	" Private - Answer a Collection with meta-information about the current document aDocumentStringOrLocation "
	
	^ BioParser tokenizeNcbiXmlBlastHeader: aDocumentString
]

{ #category : #private }
BioNCBIBlastReader >> selectHspNodesIn: anObject [
	"Answer a <BioBlastRootNode> with HSP nodes parsed from anObject"

	self parsingStrategy ifNil: [ self setStAXParser ].
	^ BioParser perform: self parsingStrategy withArguments: {anObject . BioNCBIBlastReader hitNodesNames}
"^ BioParser saxParseNcbiXmlBlastNodes: anObject"
]

{ #category : #accessing }
BioNCBIBlastReader >> selectedNodes [
	^ selectedNodes
]

{ #category : #private }
BioNCBIBlastReader >> selectedNodes: anObject [
	^ selectedNodes := anObject
]

{ #category : #accessing }
BioNCBIBlastReader >> setSAXParser [

	self parsingStrategy: #saxParseNcbiXmlBlast:nodes:
	"#saxParseNcbiXmlBlastNodes:"

]

{ #category : #accessing }
BioNCBIBlastReader >> setSAXTokenizer [

	self parsingStrategy: #saxTokenizeNcbiXmlBlast:nodes:
]

{ #category : #accessing }
BioNCBIBlastReader >> setStAXParser [

	self parsingStrategy: #parseNcbiXmlBlast:nodes:
]

{ #category : #accessing }
BioNCBIBlastReader >> setStAXTokenizer [

	self parsingStrategy: #tokenizeNcbiXmlBlast:nodes: 
]

Class {
	#name : #BioBlastHspNode,
	#superclass : #BioBlastValueNode,
	#category : 'BioParsers-Support'
}

{ #category : #accessing }
BioBlastHspNode class >> description [
	" See superimplementor's comment "
	
	^ 'Serves as container of each HSP information'
]

{ #category : #accessing }
BioBlastHspNode class >> nodeDescriptions [ 

	^ #('Offset of database sequence at the end of the alignment (one-offset)' 'Offset of query at the end of the alignment (one-offset)' 'Number of gaps in the alignment' 'Length of the alignment used' 'End of phi-blast pattern on the query (one-offset)' 'Formatting middle line as normally seen in BLAST report' 'Offset of database sequence at the start of the alignment (one-offset)' 'Ordinal number of the HSP, one-offset' 'Number of identities in the alignment' 'Frame of the database sequence if applicable' 'Expect value of the HSP' 'Alignment string for the query' 'Frame of the query if applicable' 'Offset of query at the start of the alignment (one-offset)' 'Score (in bits) of the HSP' 'Alignment string for the database' 'Number of positive (conservative) substitutions in the alignment' 'Score density' 'Start of phi-blast pattern on the query (one-offset)' '')
]

{ #category : #accessing }
BioBlastHspNode class >> nodeName [
	" See superimplementor's comment "
	
	^ 'Hsp'
]

{ #category : #accessing }
BioBlastHspNode class >> nodeNames [

	^ #('Hsp_hit-to' 'Hsp_query-to' 'Hsp_gaps' 'Hsp_align-len' 'Hsp_pattern-to' 'Hsp_midline' 'Hsp_hit-from' 'Hsp_num' 'Hsp_identity' 'Hsp_hit-frame' 'Hsp_evalue' 'Hsp_qseq' 'Hsp_query-frame' 'Hsp_query-from' 'Hsp_score' 'Hsp_hseq' 'Hsp_positive' 'Hsp_density' 'Hsp_pattern-from' 'Hsp_bit-score')
]

{ #category : #accessing }
BioBlastHspNode >> addToParent: aNode [

	aNode addHspNode: self
]

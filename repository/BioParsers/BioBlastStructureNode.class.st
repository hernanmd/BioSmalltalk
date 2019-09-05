"
The structure exists only to specify those nodes which are present in the XML and are part of the hits results tree. This way we can build the tree keeping the original structure of the XML results.
"
Class {
	#name : #BioBlastStructureNode,
	#superclass : #BioBlastContainerNode,
	#category : 'BioParsers-Support'
}

{ #category : #accessing }
BioBlastStructureNode class >> nodeDescriptions [ 

	^ #('' '' '')
]

{ #category : #accessing }
BioBlastStructureNode class >> nodeNames [
	" Answer a <Collection> of all nodes used for structuring the blast tree "

	^ #('Hsp' 'Hit_hsps' 'Hit' 'BlastOutput_param' 'Parameters' 'Iteration' 'Iteration_hits' 'Iteration' 'BlastOutput_iterations' 'BlastOutput' 'Iteration_stat' 'Statistics' 'BlastOutput_program' 'BlastOutput_version' 'BlastOutput_reference' 'BlastOutput_db' 'BlastOutput_query-ID' 'BlastOutput_query-def' 'BlastOutput_query-len' )
]

{ #category : #accessing }
BioBlastStructureNode class >> nodes [
	" Answer a <Collection> of all nodes used for structuring the blast tree wihout the header nodes "

	^ #('Hsp' 'Hit_hsps' 'Hit' 'Iteration' 'Iteration_hits' 'Iteration' 'BlastOutput_iterations' 'BlastOutput')
]

{ #category : #testing }
BioBlastStructureNode >> isStructureNode [ 

	^ true
]

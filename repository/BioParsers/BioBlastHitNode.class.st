Class {
	#name : #BioBlastHitNode,
	#superclass : #BioBlastValueNode,
	#category : 'BioParsers-Support'
}

{ #category : #accessing }
BioBlastHitNode class >> description [
	" See superimplementor's comment "
	
	^ 'Serves as container of each HIT information'
]

{ #category : #accessing }
BioBlastHitNode class >> nodeDescriptions [ 

	^ #('Accession of the database sequence (e.g., "AAF57408")' 'Length of the database sequence' 'Ordinal number of the hit, with one-offset (e.g., "1, 2...")' 'Identifier of the database sequence (e.g., "gi|7297267|gb|AAF52530.1|")' 'Definition line of the database sequence (e.g., "(AE003618) CG6717 gene...")')
]

{ #category : #accessing }
BioBlastHitNode class >> nodeName [
	" See superimplementor's comment "
	
	^ 'Hit'
]

{ #category : #accessing }
BioBlastHitNode class >> nodeNames [

	^ #('Hit_accession' 'Hit_len' 'Hit_num' 'Hit_id' 'Hit_def')
]

{ #category : #accessing }
BioBlastHitNode >> addToParent: aNode [

	aNode addHitNode: self
]

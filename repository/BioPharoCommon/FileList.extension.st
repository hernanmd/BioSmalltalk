Extension { #name : #FileList }

{ #category : #'*BioPharoCommon' }
FileList >> bioMaterialize [ 
	" Private - Materialize and open an explorer over the receiver's selected file "
	
	(BioSerializationEngine materialize: self fullName) explore
]

{ #category : #'*BioPharoCommon' }
FileList >> serviceBioMaterialize [

	^ (SimpleServiceEntry 
		provider: self 
		label: 'BioSmalltalk: Materialize' 
		selector: #bioMaterialize 
		description: 'Materialize and Explore this file' )
]

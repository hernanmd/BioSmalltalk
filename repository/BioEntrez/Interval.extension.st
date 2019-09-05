Extension { #name : #Interval }

{ #category : #'*BioEntrez' }
Interval >> asEntrezDateString [
	" Answer a <String> representing a Molecular Weight for an Entrez query "
	
	^ self first asEntrezDateString , ':' , self last asEntrezDateString
]

{ #category : #'*BioEntrez' }
Interval >> asEntrezMWString [
	" Answer a <String> representing a Molecular Weight for an Entrez query "
	
	^ self first asString , ':' , self last asString
]

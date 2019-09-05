Extension { #name : #Date }

{ #category : #'*BioEntrez' }
Date >> asEntrezDateString [
	" Answer a <String> for querying modification date in Entrez "
	
	^ self yyyymmdd asString
]

Extension { #name : #BioFastaRecord }

{ #category : #'*BioParsers' }
BioFastaRecord >> sequenceDescription [
	" Answer a <String> with the receiver's sequence description "
	
	^ BioParser tokenizeFastaDescription: self sequenceName
]

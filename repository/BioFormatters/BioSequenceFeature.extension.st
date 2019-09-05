Extension { #name : #BioSequenceFeature }

{ #category : #'*BioFormatters' }
BioSequenceFeature >> asGFF3 [
	" Answer a <String> with the receiver's printed as a Generic Feature Format version 3 line "
	
	^ ((Smalltalk at: #BioGFF3Formatter) fromSequenceFeature: self) asString
]

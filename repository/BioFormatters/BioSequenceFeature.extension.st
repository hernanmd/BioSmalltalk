Extension { #name : #BioSequenceFeature }

{ #category : #'*BioFormatters' }
BioSequenceFeature >> asBedString [
	"Answer a <String> formatting the receiver according to a BED line format"
	
	^ (BioFormatter formatterForExact: 'bed') fromSequenceFeature: self
]

{ #category : #'*BioFormatters' }
BioSequenceFeature >> asGFF3 [
	" Answer a <String> with the receiver's printed as a Generic Feature Format version 3 line "
	
	^ ((Smalltalk at: #BioGFF3Formatter) fromSequenceFeature: self) asString
]

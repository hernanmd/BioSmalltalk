Extension { #name : #Fraction }

{ #category : #'*BioLAMPLD' }
Fraction >> asIntegerStringWithCommas [
	" Answer a <String> representation of Integer receiver "

	^ self asInteger asStringWithCommas
]

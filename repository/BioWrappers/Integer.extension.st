Extension { #name : #Integer }

{ #category : #'*BioWrappers' }
Integer >> asPLINKParameter [
	" Answer a <String> representation suitable to use as PLINK parameter "
	
	^ self asString
]

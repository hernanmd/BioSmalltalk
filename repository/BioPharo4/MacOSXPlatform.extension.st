Extension { #name : #MacOSXPlatform }

{ #category : #'*BioPharo4' }
MacOSXPlatform >> execNameFor: aString [
	" Private - See superimplementor's comment "
	
	^ aString , '.app'
]

Extension { #name : #MacOSXPlatform }

{ #category : #'*BioPharo3' }
MacOSXPlatform >> execNameFor: aString [
	" Private - See superimplementor's comment "
	
	^ aString , '.app'
]

Extension { #name : #MacOSXPlatform }

{ #category : #'*biopharo' }
MacOSXPlatform >> execNameFor: aString [
	" Private - See superimplementor's comment "
	
	^ aString , '.app'
]

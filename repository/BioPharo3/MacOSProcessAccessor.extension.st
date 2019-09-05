Extension { #name : #MacOSProcessAccessor }

{ #category : #'*BioPharo3' }
MacOSProcessAccessor >> execNameFor: aString [
	" Private - See superimplementor's comment "
	
	^ aString , '.app'
]

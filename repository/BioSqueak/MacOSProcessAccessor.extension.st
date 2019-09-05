Extension { #name : #MacOSProcessAccessor }

{ #category : #'*biosqueak' }
MacOSProcessAccessor >> execNameFor: aString [
	" Private - See superimplementor's comment "
	
	^ aString , '.app'
]

Extension { #name : #Win32Platform }

{ #category : #'*biopharo' }
Win32Platform >> execNameFor: aString [
	" Private - See superimplementor's comment "
	
	^ aString , '.exe'
]

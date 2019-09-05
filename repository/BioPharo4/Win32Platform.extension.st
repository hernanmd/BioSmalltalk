Extension { #name : #Win32Platform }

{ #category : #'*BioPharo4' }
Win32Platform >> execNameFor: aString [
	" Private - See superimplementor's comment "
	
	^ aString , '.exe'
]

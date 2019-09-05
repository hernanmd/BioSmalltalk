Extension { #name : #WindowsOSProcessAccessor }

{ #category : #'*BioPharo3' }
WindowsOSProcessAccessor >> execNameFor: aString [
	" Private - See superimplementor's comment "
	
	^ aString , '.exe'
]

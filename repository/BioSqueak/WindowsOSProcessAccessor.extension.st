Extension { #name : #WindowsOSProcessAccessor }

{ #category : #'*biosqueak' }
WindowsOSProcessAccessor >> execNameFor: aString [
	" Private - See superimplementor's comment "
	
	^ aString , '.exe'
]

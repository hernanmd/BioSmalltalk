Extension { #name : #OSProcessAccessor }

{ #category : #'*biosqueak' }
OSProcessAccessor >> execNameFor: aString [
	" Assume aString is a String without extension. Answer a <String> with the appropiate extension for the receiver "
	
	self subclassResponsibility
]

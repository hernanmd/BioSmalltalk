Extension { #name : #FileReference }

{ #category : #'*BioTools' }
FileReference >> includesDtd: aString [
	" Answer <true> if aString is a DTD  identifierfor the receiver's contents "
	
	^ self contents includesDtd: aString
]

{ #category : #'*BioTools' }
FileReference >> isXML [
	" See superimplementor's comment "
	
	^ self isDirectory not and: [ self contents isXML ]
]

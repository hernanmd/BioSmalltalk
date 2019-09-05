Extension { #name : #FileSystemDirectoryEntry }

{ #category : #'*BioTools' }
FileSystemDirectoryEntry >> isXML [
	" See superimplementor's comment "
	
	^ self asFileReference isXML
]

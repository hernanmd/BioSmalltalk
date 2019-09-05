Extension { #name : #Object }

{ #category : #'*BioFormatters' }
Object >> getExtensionFor: fileFormatName [
	" Answer the corresponding <String> file extension of fileFormatName "

	^ BioFileFormat fileExtensionFor: fileFormatName
]

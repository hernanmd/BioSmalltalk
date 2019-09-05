Extension { #name : #DosFileDirectory }

{ #category : #'*biopharo14' }
DosFileDirectory >> correctPath: filename [

	^ filename copyReplaceAll: '/' with: '\'
]

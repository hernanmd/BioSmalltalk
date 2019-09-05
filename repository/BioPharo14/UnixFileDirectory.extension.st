Extension { #name : #UnixFileDirectory }

{ #category : #'*biopharo14' }
UnixFileDirectory >> correctPath: filename [

	^ filename copyReplaceAll: '\' with: '/'
]

Extension { #name : #MacFileDirectory }

{ #category : #'*biopharo14' }
MacFileDirectory >> correctPath: filename [

	^ filename copyReplaceAll: '\' with: '/'
]

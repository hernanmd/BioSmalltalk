Extension { #name : #ArchiveMember }

{ #category : #'*BioPharo3' }
ArchiveMember class >> fileExistsBehavior [

	^ BioSettings fileExistsBehavior

]

{ #category : #'*BioPharo3' }
ArchiveMember class >> fileExistsBehavior: anObject [

	BioSettings fileExistsBehavior: anObject
]

{ #category : #'*BioPharo3' }
ArchiveMember class >> setAbortOnFileExists [

	^ self fileExistsBehavior: #abort
]

{ #category : #'*BioPharo3' }
ArchiveMember class >> setDontOverwriteOnFileExists [

	^ self fileExistsBehavior: #okay
]

{ #category : #'*BioPharo3' }
ArchiveMember class >> setOverwriteOnFileExists [

	^ self fileExistsBehavior: #retryWithOverwrite
]

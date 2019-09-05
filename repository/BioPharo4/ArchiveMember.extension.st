Extension { #name : #ArchiveMember }

{ #category : #'*BioPharo4' }
ArchiveMember class >> fileExistsBehavior [

	^ BioSettings fileExistsBehavior

]

{ #category : #'*BioPharo4' }
ArchiveMember class >> fileExistsBehavior: anObject [

	BioSettings fileExistsBehavior: anObject
]

{ #category : #'*BioPharo4' }
ArchiveMember class >> setAbortOnFileExists [

	^ self fileExistsBehavior: #abort
]

{ #category : #'*BioPharo4' }
ArchiveMember class >> setDontOverwriteOnFileExists [

	^ self fileExistsBehavior: #okay
]

{ #category : #'*BioPharo4' }
ArchiveMember class >> setOverwriteOnFileExists [

	^ self fileExistsBehavior: #retryWithOverwrite
]

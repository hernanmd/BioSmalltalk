Extension { #name : #ArchiveMember }

{ #category : #'*BioPharoCommon' }
ArchiveMember class >> fileExistsBehavior [

	^ BioSettings fileExistsBehavior

]

{ #category : #'*BioPharoCommon' }
ArchiveMember class >> fileExistsBehavior: anObject [

	BioSettings fileExistsBehavior: anObject
]

{ #category : #'*BioPharoCommon' }
ArchiveMember class >> setAbortOnFileExists [

	^ self fileExistsBehavior: #abort
]

{ #category : #'*BioPharoCommon' }
ArchiveMember class >> setDontOverwriteOnFileExists [

	^ self fileExistsBehavior: #okay
]

{ #category : #'*BioPharoCommon' }
ArchiveMember class >> setOverwriteOnFileExists [

	^ self fileExistsBehavior: #retryWithOverwrite
]

Extension { #name : #SequenceableCollection }

{ #category : #'*biopharo14' }
SequenceableCollection >> asFileCollection [
	" Answer a <Collection> of file streams for the receiver elements, each one representing a path "

	^ BioFileCollection withAll: 
		(self collect: [ : e | BioObject fileStreamClass readOnlyFileNamed: e fullName ])
]

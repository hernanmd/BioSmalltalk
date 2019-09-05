Extension { #name : #SequenceableCollection }

{ #category : #'*BioPharo3' }
SequenceableCollection >> asFileCollection [
	" Answer a <Collection> of file streams for the receiver elements, each one representing a path "

	^ BioFileCollection withAll: (self collect: [ : e | e fullName asFileReference readStream ])
]

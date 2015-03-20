*BioPharo3
asFileCollection
	" Answer a <Collection> of file streams for the receiver elements, each one representing a path "

	^ BioFileCollection withAll: (self collect: [ : e | e fullName asFileReference readStream ])
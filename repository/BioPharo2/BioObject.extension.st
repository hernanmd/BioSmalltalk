Extension { #name : #BioObject }

{ #category : #'*biopharo2' }
BioObject class >> fileExists: fileName [
	" Answer <true> if fileName exists in receiver's workingDirectory "
	
	^ fileName asFileReference exists
]

{ #category : #'*biopharo2' }
BioObject class >> filesIn: pathString [
	" Answer a <Collection> of file references contained in pathString "
	| fs |
	^ (FileReference
		fileSystem: (fs := FileSystem disk)
		path: (fs pathFromString: pathString)) allFiles.
	
]

{ #category : #'*biopharo2' }
BioObject class >> newFullFileNamed: fileName [
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ fileName asFileReference writeStream
]

{ #category : #'*biopharo2' }
BioObject class >> openFullFileNamed: fileName [
	" Answer a FileStream for fileName in the image directory. Assume the file exists "
	
	^ fileName 
		ifNotNil: [ fileName asFileReference readStream ]
		ifNil: [ self signalInvalidObject: 'Please specify a file' translated ]
]

{ #category : #'*biopharo2' }
BioObject class >> slash [

	^ FileSystem disk delimiter asString
]

{ #category : #'*biopharo2' }
BioObject class >> testFilesFullDirectoryName [
	" Answer a String where the files for testing will be placed "

	^ self workingDirectory / self testFilesDirectoryName

]

{ #category : #'*biopharo2' }
BioObject class >> workingDirectory [
	" Answer a String with the default directory "
	
	^ FileSystem disk workingDirectory
]

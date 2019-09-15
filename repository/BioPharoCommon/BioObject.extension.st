Extension { #name : #BioObject }

{ #category : #'*BioPharoCommon' }
BioObject >> connectionRetry [ 
	" Private - Ask for retrying attempt "
	
	^ UIManager default 
			chooseFrom: #('try again' 'give up') 
			title: 'Would you like to try again?' translated
]

{ #category : #'*BioPharoCommon' }
BioObject >> fileDirectoryClass [
	" See comment in class method "

	^ self class fileDirectoryClass
]

{ #category : #'*BioPharoCommon' }
BioObject class >> fileDirectoryClass [
	" Answer a helper class to manage file related operations "

	^ FileSystem
]

{ #category : #'*BioPharoCommon' }
BioObject class >> fileExists: fileName [
	" Answer <true> if fileName exists in receiver's workingDirectory "
	
	^ fileName asFileReference exists
]

{ #category : #'*BioPharoCommon' }
BioObject class >> filesIn: pathString [
	" Answer a <Collection> of file references contained in pathString "
	
	| fs |
	^ (FileReference fileSystem: (fs := FileSystem disk) path: (fs pathFromString: pathString)) allFiles.
	
]

{ #category : #'*BioPharoCommon' }
BioObject class >> newFullFileNamed: fileName [
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ fileName asFileReference writeStream
]

{ #category : #'*BioPharoCommon' }
BioObject class >> openFileNamed: fileName [
	" Answer a <FileStream> for fileName in the image directory. Assume the file exists "
	
	^ fileName 
		ifNotNil: [ fileName asFileReference readStream ]
		ifNil: [ self signalInvalidObject: 'Please specify a file' ]
]

{ #category : #'*BioPharoCommon' }
BioObject class >> openFullFileNamed: fileName [
	" Answer a FileStream for fileName in the image directory. Assume the file exists "
	
	^ fileName 
		ifNotNil: [ fileName asFileReference readStream ]
		ifNil: [ self signalInvalidObject: 'Please specify a file' ]
]

{ #category : #'*BioPharoCommon' }
BioObject class >> removeFileNamed: fileName [
	" Remove fileName in the receiver's current folder "
	
	^ (String streamContents: [ : stream |
		stream 
			nextPutAll: self workingDirectory;
			nextPutAll: self slash;
			nextPutAll: fileName ]) asFileReference delete.
]

{ #category : #'*BioPharoCommon' }
BioObject >> requestDirectoryPath [
	" Answer a <FileReference> with selected directory "

	^ self class requestDirectoryPath

]

{ #category : #'*BioPharoCommon' }
BioObject >> requestOpenCSVFile [
	" See comment in class side "
	
	^ self class requestOpenCSVFile
]

{ #category : #'*BioPharoCommon' }
BioObject >> requestOpenCSVFile: aBlock [
	" See comment in class side "
	
	^ self class requestOpenCSVFile: aBlock
]

{ #category : #'*BioPharoCommon' }
BioObject class >> requestOpenCSVFile: actionBlock [
	" Open request dialog to select a CSV file and perform actionBlock if selected path is valid "
	
	^ self requestOpenCSVFile ifNotNil: actionBlock
]

{ #category : #'*BioPharoCommon' }
BioObject >> slash [
	" See comment in class side "
	
	^ self class slash
]

{ #category : #'*BioPharoCommon' }
BioObject class >> slash [
	"Return a <String> with the path delimiter used by this filesystem."
	
	^ FileSystem disk delimiter asString
]

{ #category : #'*BioPharoCommon' }
BioObject class >> workingDirectory [
	" Answer a <String> with the default directory "
	
	^ FileSystem disk workingDirectory fullName
]

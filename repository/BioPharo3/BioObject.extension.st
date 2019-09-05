Extension { #name : #BioObject }

{ #category : #'*BioPharo3' }
BioObject class >> alert: aString [
	"Open an alert dialog."

	^ UITheme builder alert: aString
]

{ #category : #'*BioPharo3' }
BioObject >> connectionRetry [ 
	" Private - Ask for retrying attempt "
	
	^ UIManager default 
			chooseFrom: #('try again' 'give up') 
			title: 'Would you like to try again?' translated
]

{ #category : #'*BioPharo3' }
BioObject class >> fileDirectoryClass [
	" Answer a helper class to manage file related operations "

	^ FileSystem
]

{ #category : #'*BioPharo3' }
BioObject >> fileDirectoryClass [
	" See comment in class method "

	^ self class fileDirectoryClass
]

{ #category : #'*BioPharo3' }
BioObject class >> fileExists: fileName [
	" Answer <true> if fileName exists in receiver's workingDirectory "
	
	^ fileName asFileReference exists
]

{ #category : #'*BioPharo3' }
BioObject class >> filesIn: pathString [
	" Answer a <Collection> of file references contained in pathString "
	
	| fs |
	^ (FileReference fileSystem: (fs := FileSystem disk) path: (fs pathFromString: pathString)) allFiles.
	
]

{ #category : #'*BioPharo3' }
BioObject class >> newFullFileNamed: fileName [
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ fileName asFileReference writeStream
]

{ #category : #'*BioPharo3' }
BioObject class >> openFileNamed: fileName [
	" Answer a <FileStream> for fileName in the image directory. Assume the file exists "
	
	^ fileName 
		ifNotNil: [ fileName asFileReference readStream ]
		ifNil: [ self signalInvalidObject: 'Please specify a file' translated ]
]

{ #category : #'*BioPharo3' }
BioObject class >> openFullFileNamed: fileName [
	" Answer a FileStream for fileName in the image directory. Assume the file exists "
	
	^ fileName 
		ifNotNil: [ fileName asFileReference readStream ]
		ifNil: [ self signalInvalidObject: 'Please specify a file' translated ]
]

{ #category : #'*BioPharo3' }
BioObject class >> removeFileNamed: fileName [
	" Remove fileName in the receiver's current folder "
	
	^ (self workingDirectory , self slash , fileName) asFileReference delete.
]

{ #category : #'*BioPharo3' }
BioObject class >> requestDirectoryPath [
	" Answer a <FileReference> with selected directory "

	| tmpFileDialog |
	tmpFileDialog := FileDialogWindow basicNew
		initialize;
		title: 'Select a directory';
		answerDirectory;
		openModal.
	tmpFileDialog isNil ifTrue: [ self error: 'FileDialogWindow is broken' ].
	^ tmpFileDialog answer "pathString"

]

{ #category : #'*BioPharo3' }
BioObject >> requestDirectoryPath [
	" Answer a <FileReference> with selected directory "

	^ self class requestDirectoryPath

]

{ #category : #'*BioPharo3' }
BioObject class >> requestOpenCSVFile [
	" Open request dialog to select a CSV file "
	
	^ UIManager default 
		chooseFullFileNameMatching:  (Array with: self filenameMatchPattern , BioCSVFormatter formatExtension)
		label: 'Choose CSV file'
]

{ #category : #'*BioPharo3' }
BioObject class >> requestOpenFASTAFile [
	" Open request dialog to select a FASTA file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: self filenameMatchPattern , BioFASTAFormatter formatExtension)
		label: 'Choose FASTA file'
]

{ #category : #'*BioPharo3' }
BioObject class >> requestOpenXMLFile [
	" Open request dialog to select a XML file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: self filenameMatchPattern , BioXMLFormatter formatExtension)
		label: 'Choose XML file'
]

{ #category : #'*BioPharo3' }
BioObject class >> slash [
	"Return a <String> with the path delimiter used by this filesystem."
	
	^ FileSystem disk delimiter asString
]

{ #category : #'*BioPharo3' }
BioObject >> slash [
	" See comment in class side "
	
	^ self class slash
]

{ #category : #'*BioPharo3' }
BioObject class >> workingDirectory [
	" Answer a <String> with the default directory "
	
	^ FileSystem disk workingDirectory fullName
]

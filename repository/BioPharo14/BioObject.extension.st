Extension { #name : #BioObject }

{ #category : #'*biopharo14' }
BioObject >> createDirectory: aDirectoryName [
	"Create a directory named by the given path. 
	Fail if the path is bad or if a file or directory by that name already exists."

	^ self fileDirectoryClass default createDirectory: aDirectoryName
]

{ #category : #'*biopharo14' }
BioObject >> directoryExists: directoryString [
	" Answer <true> if directoryString exists "
	
	^ self fileDirectoryClass 
			default
			directoryExists: directoryString
	
]

{ #category : #'*biopharo14' }
BioObject class >> fileDirectoryClass [

	^ FileDirectory
]

{ #category : #'*biopharo14' }
BioObject >> fileDirectoryClass [

	^ self class fileDirectoryClass
]

{ #category : #'*biopharo14' }
BioObject >> fileDirectoryContentsFor: aDirectoryString [
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ self class fileDirectoryContentsFor: aDirectoryString
	
]

{ #category : #'*biopharo14' }
BioObject class >> fileExists: fileName [
	" Answer <true> if fileName exists in receiver's workingDirectory "
	
	^ self fileDirectoryClass 
			default
			fileExists: fileName
]

{ #category : #'*biopharo14' }
BioObject >> fullFileNameFor: fileName [
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ self fileDirectoryClass default
			fullNameFor: 
				self workingDirectory , 
				self fileDirectoryClass slash , 
				fileName.
	
]

{ #category : #'*biopharo14' }
BioObject >> newDirectory: directoryName [
	" Create directoryName in the receiver's workingDirectory "
	
	^ self fileDirectoryClass 
			default
			createDirectory: directoryName
	
]

{ #category : #'*biopharo14' }
BioObject class >> newFileNamed: fileName [
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ (self fileStreamClass 
			newFileNamed: 
				self workingDirectory , 
				self fileDirectoryClass slash , 
				fileName) 
					wantsLineEndConversion: true;
					yourself.
	
]

{ #category : #'*biopharo14' }
BioObject class >> newFullFileNamed: fileName [
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ (self fileStreamClass 
			newFileNamed: fileName) 
					wantsLineEndConversion: true;
					yourself.
	
]

{ #category : #'*biopharo14' }
BioObject class >> openFileNamed: fileName [
	" Answer a FileStream for fileName in the image directory. Assume the file exists "
	
	^ self fileStreamClass 
			readOnlyFileNamed: 
				self workingDirectory , 
				self fileDirectoryClass slash , 
				fileName.
	
]

{ #category : #'*biopharo14' }
BioObject class >> openFullFileNamed: fileName [
	" Answer a FileStream for fileName in the image directory. Assume the file exists "
	
	^ fileName 
		ifNotNil: [ self fileStreamClass readOnlyFileNamed: fileName ]
		ifNil: [ self signalInvalidObject: 'Please specify a file' translated ]
]

{ #category : #'*biopharo14' }
BioObject class >> openOrCreateFileNamed: fileName [
	" Answer a FileStream for fileName in the image directory. "
	
	| fs |
	
	fs := (self fileExists: fileName)
			ifFalse: [ self newFileNamed: fileName ]
			ifTrue: [ self openFileNamed: fileName ].
	^ fs readWrite
	
]

{ #category : #'*biopharo14' }
BioObject class >> outputToFile: nameString contents: anObject [
	" Outputs contentsString to a file named nameString "
	| fs |
	
	fs := self newFileNamed: nameString.
	fs wantsLineEndConversion: true.
	[ anObject outputTo: fs ] ensure: [ fs close ].	
]

{ #category : #'*biopharo14' }
BioObject class >> outputToFullFile: nameString contents: anObject [
	" Outputs contentsString to a file named nameString "
	| fs |
	
	fs := self newFullFileNamed: nameString.
	fs wantsLineEndConversion: true.
	[ anObject outputTo: fs ] ensure: [ fs close ].	
]

{ #category : #'*biopharo14' }
BioObject class >> slash [
	" Answer a <String> with the system path delimiter "

	^ self fileDirectoryClass slash

]

{ #category : #'*biopharo14' }
BioObject class >> testFilesFullDirectoryName [
	" Answer a String where the files for testing will be placed "

	^ self workingDirectory , 
                self fileDirectoryClass slash ,
                self testFilesDirectoryName , 
                self fileDirectoryClass slash.

]

{ #category : #'*biopharo14' }
BioObject class >> workingDirectory [
	" Answer a String with the default directory "
	
	^ self fileDirectoryClass default fullName
]

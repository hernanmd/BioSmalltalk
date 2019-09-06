"
BioObject is the top abstract class of all BioSmalltalk objects and contains very generic behavior for all the subclasses.

These behaviors are:

-Methods for triggering exceptions
-Methods for interacting with the local file system
-Convenience methods for dates
"
Class {
	#name : #BioObject,
	#superclass : #Object,
	#category : #'BioTools-Core'
}

{ #category : #'convenience-behavior' }
BioObject class >> allFinalClasses [
	" Answer a <Collection> with receiver's leaf classes (classes without subclasses) "

	^ self allSubclasses select: [ : ea | ea subclasses isEmpty ]
]

{ #category : #'convenience-date' }
BioObject class >> currentSeconds [
 	" Answer a <String> with the number of seconds since 1 January 1901 "
	
	^ self dateClass current asSeconds asString
]

{ #category : #data }
BioObject class >> dataFilesDirectoryName [
	" Answer a <String> of the directory name where the data files are located "

	^ 'BioSmalltalkDataFiles'
]

{ #category : #data }
BioObject class >> dataFilesFullDirectoryName [
	" Private - Initialize software items to the receiver's catalog "

	^ self workingDirectory asFileReference / self dataFilesDirectoryName
]

{ #category : #'convenience-filesystem' }
BioObject class >> dumpToDOSFileNamed: filename contents: anObject [
	" Write anObject to a DOS file named filename representing a full path "
	
	| fs |
	[ fs := self newFullFileNamed: filename.
		fs lineEndConvention: #crlf.
		anObject dumpToStream: fs ] 
	ensure: [ fs close ].
]

{ #category : #'convenience-filesystem' }
BioObject class >> dumpToFileNamed: filename contents: anObject [
	" Write anObject to a file named filename in the current directory "
	
	| fs |
 	[ 	fs := self newFileNamed: filename.
		anObject dumpToStream: fs 
	] ensure: [ fs close ].
]

{ #category : #'convenience-filesystem' }
BioObject class >> dumpToFileNamedFullPath: filename contents: anObject [
	" Write anObject to a file named filename representing a full path "
	
	| fs |
	[ fs := self newFullFileNamed: filename.
	anObject dumpToStream: fs ] ensure: [ fs close ].
]

{ #category : #'convenience-filesystem' }
BioObject class >> fileStreamClass [
	" Private - Answer a helper <Stream> class to manage file related operations "

	^ FileStream
]

{ #category : #private }
BioObject class >> filenameMatchPattern [
	" Private - Answer a <String> with the pattern to match files when displaying dialogs "

	^ '*.'
]

{ #category : #'convenience-utilities' }
BioObject class >> generate: repValue repeat: repCount [
	" ( self new generate: 2 repeat: 4 ) = #(2 2 2 2) "
	
	^ (Generator on: [ : g | repCount timesRepeat: [ g yield: repValue ] ]) upToEnd
]

{ #category : #'convenience-utilities' }
BioObject class >> generateJoin: repValue repeat: repNumber [
	" Generate, join and answer anObject repetition times 
	(BioObject generateJoin: 2 repeat: 4) = '2222'
	"
	repNumber >= 0
		ifFalse: [ self error: 'Repetitions must be >= 0 ' , repNumber asString ].
	^ (self generate: repValue repeat: repNumber) 
			inject: String new 
			into: [ :a :b | String streamContents: [ : stream |
							stream 
								nextPutAll: a;
								nextPutAll: b asString ] ].

]

{ #category : #testing }
BioObject class >> isPhyloclassTalk [
	" Answer <true> if PhyloclassTalk is installed in this system "

	^ Smalltalk hasClassNamed: #PCTApplication 
]

{ #category : #testing }
BioObject class >> isRunningInMac [
	" Answer <true> if the host system is running in Mac OS "

	^ BioOSInterfaceEngine adapter isRunningInMac
]

{ #category : #testing }
BioObject class >> isRunningInPharo [
	" Answer <true> if the host system is running Pharo Smalltalk "

	^ Smalltalk image version beginsWith: 'Pharo'

]

{ #category : #testing }
BioObject class >> isRunningInSqueak [
	" Answer <true> if the host system is running Squeak Smalltalk "

	^ Smalltalk image version beginsWith: 'Squeak'
]

{ #category : #testing }
BioObject class >> isRunningInUnix [
	" Answer <true> if the host system is running in any Unix-like OS "

	^ BioOSInterfaceEngine adapter isRunningInUnix
]

{ #category : #testing }
BioObject class >> isRunningInWindows [
	" Answer <true> if the host system is running in Microsoft Windows "

	^ BioOSInterfaceEngine adapter isRunningInWindows
]

{ #category : #'instance creation' }
BioObject class >> new [
	" #initialize is not called implicitely when sending #new to an object in other Smalltalk dialects. "
	
	^ self basicNew initialize
]

{ #category : #'convenience-filesystem' }
BioObject class >> newFileNamed: fileName [
	" Answer a <FileStream> for a new fileName in the receiver's configured folder.
	fileName MUST NOT be an absolute path. If you have absolute path use #newFullFileNamed: "
	
	^ (self fileStreamClass newFileNamed: self workingDirectory , self slash , fileName) 
		yourself.
]

{ #category : #scripts }
BioObject class >> scriptsDirectoryName [
	" Answer a <String> where the scripts are located "

	^ 'BioSmalltalkScripts'
]

{ #category : #scripts }
BioObject class >> scriptsFullDirectoryName [
	" Answer a full path <String> where the scripts are located "

	^ self workingDirectory asFileReference / self scriptsDirectoryName
]

{ #category : #testing }
BioObject class >> testFilesDirectoryName [
	" Answer a <String> of the directory name where the files for testing are located "

	^ 'BioSmalltalkTestFiles'
]

{ #category : #testing }
BioObject class >> testFilesFullDirectoryName [
	" Answer a <String> of the full path directory name where the files for testing are located "

	^ self workingDirectory asFileReference / self testFilesDirectoryName
]

{ #category : #'convenience-behavior' }
BioObject >> allFinalClasses [
	" Answer a <Collection> of classes which are not abstract "
	
	^ self class allFinalClasses
]

{ #category : #'convenience-behavior' }
BioObject >> classFor: aLiteralOrClass [
	" Refer to class comment "
	
	^ self class classFor: aLiteralOrClass
]

{ #category : #'convenience-date' }
BioObject >> currentDate [
	" Answer a <String> with a human readable format of current date "
	
	^ DateAndTime current
]

{ #category : #'convenience-date' }
BioObject >> currentSeconds [
 	"Answer the seconds since 1 January 1901"

	^ self class currentSeconds
]

{ #category : #'convenience-date' }
BioObject >> dateClass [
	" Refer to class comment "

	^ self class dateClass
]

{ #category : #accessing }
BioObject >> decode: aString [
	" Answer a String. Decodes the fields embedded in aString url ?var1=val1&var2=val2 "
	
	^ self class decode: aString
]

{ #category : #'convenience-filesystem' }
BioObject >> dumpToFileNamed: aString [
	" Outputs the receiver's contents to a file "

	self dumpToFileNamed: aString contents: self contents
]

{ #category : #'convenience-filesystem' }
BioObject >> dumpToFileNamed: fileName contents: contentsString [
	" Outputs contentsString to a file named fileName "

	self class 
		dumpToFileNamed: fileName 
		contents: contentsString
]

{ #category : #'convenience-filesystem' }
BioObject >> dumpToFileNamedFullPath: fileName contents: contentsString [
	" Outputs contentsString to a file named fileName "

	self class 
		dumpToFileNamedFullPath: fileName 
		contents: contentsString
]

{ #category : #'convenience-filesystem' }
BioObject >> dumpToUniqueFileNamed: fileName [
	" Outputs the receiver's contents to a file named fileName "

	self 
		dumpToFileNamed: self currentSeconds , '_' , fileName 
		contents: self contents
]

{ #category : #'convenience-filesystem' }
BioObject >> dumpToUniqueFileNamed: fileName contents: contentsString [
	" Outputs contentsString to a file named fileName "

	self class 
		dumpToFileNamed: self currentSeconds , '_' , fileName
		contents: contentsString
]

{ #category : #'convenience-filesystem' }
BioObject >> fileExists: fileName [
	" Answer <true> if fileName exists in receiver's working directory "
	
	^ self class fileExists: fileName
]

{ #category : #'convenience-filesystem' }
BioObject >> fileStreamClass [
	" See comment in class method "

	^ self class fileStreamClass
]

{ #category : #'convenience-filesystem' }
BioObject >> filesIn: aDirectoryString [
	" Answer a <FileStream> for a new fileName in the receiver's configured folder "
	
	^ self class filesIn: aDirectoryString
]

{ #category : #'convenience-filesystem' }
BioObject >> fullFileNameFor: fileName [
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ self fileDirectoryClass default
			fullNameFor: 
				self workingDirectory , 
				self fileDirectoryClass slash , 
				fileName.
]

{ #category : #'convenience-utilities' }
BioObject >> generate: repValue repeat: repCount [
	" See comment in class side "
	
	^ self class generate: repValue repeat: repCount
]

{ #category : #'convenience-utilities' }
BioObject >> generateJoin: repValue repeat: repNumber [
	" See comment in class side "
	
	^ self class generateJoin: repValue repeat: repNumber
]

{ #category : #testing }
BioObject >> isBioSequence [
	" Answer whether the receiver represents a Biological sequence. "
	
	^ false
]

{ #category : #testing }
BioObject >> isFastaMultiRecord [
	" Answer whether the receiver represents a Multi-FASTA record "
	
	^ false
]

{ #category : #testing }
BioObject >> isFastaRecord [
	" Answer whether the receiver represents a FASTA record "

	^ false
]

{ #category : #testing }
BioObject >> isNamingFormat [

	^ false
]

{ #category : #testing }
BioObject >> isPhyloclassTalk [
	" Answer <true> if PhyloclassTalk is installed in this system "

	^ self class isPhyloclassTalk
]

{ #category : #testing }
BioObject >> isRunningInMac [
	" See class comment "
	
	^ self class isRunningInMac 
	
]

{ #category : #testing }
BioObject >> isRunningInUnix [
	" See class comment "
	
	^ self class isRunningInUnix 
	
]

{ #category : #testing }
BioObject >> isRunningInWindows [
	" See class comment "
	
	^ self class isRunningInWindows 
	
]

{ #category : #'convenience-filesystem' }
BioObject >> newDirectory: directoryName [
	" Create directoryName in the receiver's workingDirectory "
	
	^ self fileDirectoryClass default createDirectory: directoryName
]

{ #category : #'convenience-filesystem' }
BioObject >> newFileNamed: fileName [
	" Answer a <FileStream> for a new fileName in the receiver's configured folder "
	
	^ self class newFileNamed: fileName
]

{ #category : #'convenience-filesystem' }
BioObject >> newFullFileNamed: fileName [
	" Answer a <FileStream> for a new fileName in the receiver's configured folder "
	
	^ self class newFullFileNamed: fileName
]

{ #category : #'convenience-filesystem' }
BioObject >> openFileNamed: fileName [
	" Answer a <FileStream> for fileName. Assume the file exists "

	^ self class openFileNamed: fileName
]

{ #category : #'convenience-filesystem' }
BioObject >> openFullFileNamed: fileName [
	" Answer a <FileStream> for fileName in the image directory. Assume the file exists "
	
	^ self class openFullFileNamed: fileName
]

{ #category : #'convenience-filesystem' }
BioObject >> openOrCreateFileNamed: fileName [
	" Answer a <FileStream> for fileName in the image directory. "
	
	^ self class openOrCreateFileNamed: fileName
	
]

{ #category : #testing }
BioObject >> testFilesDirectoryName [
	" Answer a <String> where the files for testing will be placed "

	^ self class testFilesDirectoryName
]

{ #category : #testing }
BioObject >> testFilesFullDirectoryName [
	" Private - See class comment "

	^ self class testFilesFullDirectoryName
]

{ #category : #accessing }
BioObject >> validate: anObject as: aClass [

	^ aClass accept: anObject
]

{ #category : #'convenience-filesystem' }
BioObject >> workingDirectory [
	" Answer a <String> representing the current working directory "
	
	^ self class workingDirectory
]

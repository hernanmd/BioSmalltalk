"
BioFileFormatter reads from an input file, performs formatting and write the results to an output file.

Instance Variables:
	cwd 			<String>					Current working directory.
	inputFile		<String | FileReference> 	File name of the input file.
	outputFile		<ProtoObject>
	outputFilename	<String>
	stream			<WriteStream>
	inputStream		<ReadStream>
	writeToFile		<Boolean>			If <true> then write the output to a file
"
Class {
	#name : #BioFileFormatter,
	#superclass : #BioFormatter,
	#instVars : [
		'inputFile',
		'outputFilename',
		'stream',
		'inputStream',
		'writeToFile',
		'cwd',
		'outputFileStream'
	],
	#category : #'BioFormatters-Formatters'
}

{ #category : #accessing }
BioFileFormatter class >> identifier [
	" Answer a <String> of an unique identifier for the receiver "

	^ self identifiers first
]

{ #category : #accessing }
BioFileFormatter class >> identifiers [
	" Answer a <Collection> of identifiers of the receiver. The first identifier should match with an identifier in the #formatCollection to be available for file exporting "
	
	^ Array empty
]

{ #category : #accessing }
BioFileFormatter class >> linesCount: aFilename [
	" Answer a <Number> how many lines contains aFilename"

	^ aFilename asFileReference readStreamDo: [ :file | 
			| count |
			count := 0.
			file binary.
			file contents do: [ :c | c = 10 ifTrue: [ count := count + 1 ] ].
			count ]
]

{ #category : #'instance creation' }
BioFileFormatter class >> newFromInputFile: aFilenameOrFileReference [
	" Set the receiver's input file to be aFilename "

	^ self new inputFile: aFilenameOrFileReference
]

{ #category : #'instance creation' }
BioFileFormatter class >> newFromInputFile: inputFile outputFile: outFilename [
	" Answer a new instance of the receiver with a BioFile and outFilename <String> "
	^ self new 
		inputFile: inputFile;
		outputFilename: outFilename;
		yourself
]

{ #category : #accessing }
BioFileFormatter >> cwd [
	" Answer a <String> representing the Current working directory "

	^ cwd
		ifNil: [ cwd := self defaultCwd ]
]

{ #category : #accessing }
BioFileFormatter >> cwd: aString [
	" Set aString to be the current working directory "

	cwd := aString
]

{ #category : #defaults }
BioFileFormatter >> defaultCwd [
	" Answer a <String> representing the default current working directory "

	^ '.'
]

{ #category : #accessing }
BioFileFormatter >> delimiter [
	" Answer the <Character> used to delimit fields "
	
	self subclassResponsibility
]

{ #category : #'convenience-filesystem' }
BioFileFormatter >> dumpToFileNamed: aFilename contents: contentsString [
	" See superimplementor's comment "

	self writeToFile
		ifTrue: [ super dumpToFileNamed: aFilename contents: contentsString ].
]

{ #category : #accessing }
BioFileFormatter >> export [
	" Write contents to receiver's output file "
	
	self isValid 
		ifFalse: [ self informMessage: 'Current configuration is not valid for ' , self description , ' format' ]
		ifTrue: [ self exportFrom: self samples ]
]

{ #category : #accessing }
BioFileFormatter >> flush [
	" Write to disk "

	self outputFileStream flush; close.
]

{ #category : #accessing }
BioFileFormatter >> formatExtension [
	" Private - Answer a String corresponding for the receiver's file output format "

	^ self class formatExtension

]

{ #category : #'initialize-release' }
BioFileFormatter >> initializeStream: collection [
	" Private - Preallocate collection initial size "

	stream := ReadWriteStream on: String new.	
]

{ #category : #accessing }
BioFileFormatter >> inputFile [
	" Answer a <String> with the file name of the input file. If cwd is set, then prepend its value to inputFile, otherwise just answer input file value  "

	^ String streamContents: [ : aStream |
			aStream 
				nextPutAll: self cwd;
				nextPutAll: self platformSeparator;
				nextPutAll: inputFile ]


]

{ #category : #accessing }
BioFileFormatter >> inputFile: aString [
	" Set the receiver's input file path to be aString "

	inputFile := aString
]

{ #category : #accessing }
BioFileFormatter >> inputStream [
	^ inputStream
]

{ #category : #accessing }
BioFileFormatter >> inputStream: anObject [
	inputStream := anObject
]

{ #category : #testing }
BioFileFormatter >> isValidForExport: aCollection [ 
	" Answer <true> if aCollection is valid for exporting for the receiver "

	^ aCollection notNil and: [ aCollection notEmpty ]
]

{ #category : #accessing }
BioFileFormatter >> linesCount: aFilename [
	" Answer a <Number> how many lines contains aFilename"
	
	^ self class linesCount: aFilename
]

{ #category : #exporting }
BioFileFormatter >> outputFileStream [
	" Answer a <FileStream> for a new file in the receiver's configured folder "

	^ outputFileStream
		ifNil: [ outputFileStream := self newFullFileNamed: (self outputFilename reversed copyUpTo: $\) reversed ].
]

{ #category : #exporting }
BioFileFormatter >> outputFileStream: aFileStream [
	" Set the receiver's output to aFileStream "

	^ outputFileStream := aFileStream
]

{ #category : #exporting }
BioFileFormatter >> outputFilename [
	" Private - Answer a <String> file name for the output "

	^ outputFilename
		ifNil: [ outputFilename := self fileNamePrefix , 
						Time totalSeconds asString ,
						'.' , self formatExtension ]

]

{ #category : #exporting }
BioFileFormatter >> outputFilename: aString [
	" Set the receiver's output file name to be aString "
	
	outputFilename := aString.

]

{ #category : #exporting }
BioFileFormatter >> resetOutput [

	self outputFileStream: nil.
	self outputFilename: nil.
]

{ #category : #'initialize-release' }
BioFileFormatter >> sizeFrom: collection [

	^ collection size
]

{ #category : #accessing }
BioFileFormatter >> stream [
	" Answer an output <Stream> for the receiver. Use output file name if set, create a new write stream otherwise "

	^ stream 
		ifNil: [ stream := WriteStream on: String new ].

]

{ #category : #accessing }
BioFileFormatter >> stream: anObject [
	stream := anObject
]

{ #category : #accessing }
BioFileFormatter >> validate: aCollection [ 
	"  Iterate over aCollection. Set valid flag if all its items are valid for the receiver "
	
	(isValid := isValid and: [ self isValidForExport: aCollection ])
		ifTrue: [
			inputStream := ReadStream on: aCollection.
			samplesCollection := aCollection ].

]

{ #category : #accessing }
BioFileFormatter >> writeToFile [

	^ writeToFile
		ifNil: [ writeToFile := true ]
]

{ #category : #accessing }
BioFileFormatter >> writeToFile: anObject [
	writeToFile := anObject
]

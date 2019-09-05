"
A BioFile is used to represent a file, it's not intended to be used for parsing a file. For example this is used when having a CSV file, one could instatiate a BioCSVFile to set specific parsing paramenters, like the numbers of columns to read or ignore header lines.

A BioFormatter is what to use when a developer has an INPUT file and possible an OUTPUT file/stream.

"
Class {
	#name : #BioFile,
	#superclass : #BioNamedObject,
	#instVars : [
		'stream'
	],
	#category : 'BioFormatters-Core'
}

{ #category : #accessing }
BioFile class >> fileFormatterClass [

	^ BioFileFormat
]

{ #category : #testing }
BioFile class >> isValidFile: aFilename [
	" Answer <true> if aFilename is valid for the receiver "

	^ aFilename notNil and: [ aFilename notEmpty ]
]

{ #category : #'instance creation' }
BioFile class >> on: anObject [
	" Answer a new instance of the receiver for the given anObject "

	^ self new initializeWith: anObject
]

{ #category : #accessing }
BioFile >> close [
	"Close the receiver's file."

	self stream close
]

{ #category : #accessing }
BioFile >> contents [
	"Answer all of the contents of the receiver."
	
	^ self stream contents
]

{ #category : #accessing }
BioFile >> fileFormatterClass [

	^ self class fileFormatterClass
]

{ #category : #'initialize-release' }
BioFile >> initializeWith: aFilePathOrFileStream [
	" Private - Check and open aFilePathOrFileStream "

	| fStream |
	
	(fStream := aFilePathOrFileStream) isStream
		ifFalse: [ fStream := self openFullFileNamed: aFilePathOrFileStream ].
	self stream: fStream.
	self name: fStream name
]

{ #category : #accessing }
BioFile >> possibleExtensions [
	" See class comment "

	^ self class possibleExtensions
]

{ #category : #printing }
BioFile >> printOn: aStream [
	" Private - See superimplementor's comment "

	aStream
		nextPutAll: self name
		between: $[ and: $]
]

{ #category : #accessing }
BioFile >> stream [

	^ stream
]

{ #category : #accessing }
BioFile >> stream: anObject [
	stream := anObject
]

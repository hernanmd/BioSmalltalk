"
A BioPhylipFile is a representation of a PHYLIP sequence format in a file system.

"
Class {
	#name : #BioPhylipFile,
	#superclass : #BioFile,
	#instVars : [
		'interleaved'
	],
	#category : #'BioFormatters-Formatters-PHYLIP'
}

{ #category : #accessing }
BioPhylipFile class >> possibleExtensions [
	" See superimplementor's comment"

	^ self fileFormatterClass fileExtensionsFor: 'Phylip'
]

{ #category : #accessing }
BioPhylipFile >> beInterleaved [
	" Set the receiver to be in interleaved format "
	
	interleaved := true
]

{ #category : #accessing }
BioPhylipFile >> beSequential [
	" Set the receiver to be in interleaved format "
	
	interleaved := false
]

{ #category : #testing }
BioPhylipFile >> isInterleaved [
	" Answer <true> if the receiver is in interleaved format "
	
	^ interleaved
]

{ #category : #testing }
BioPhylipFile >> isSequential [
	" Answer <true> if the receiver is in sequential format "
	
	^ self isInterleaved not
]

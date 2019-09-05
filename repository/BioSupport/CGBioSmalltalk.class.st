Class {
	#name : #CGBioSmalltalk,
	#superclass : #CGSmalltalk,
	#instVars : [
		'parser'
	],
	#category : 'BioSupport-Generators'
}

{ #category : #accessing }
CGBioSmalltalk >> initializeParser: aPathString [
	" Private - Set the receiver's parser for new generated code "
	
	self parser: (NeoCSVReader on: (BioObject openFullFileNamed: aPathString) readStream).
	self parser 
		separator: $;;
		skipHeader
	
]

{ #category : #accessing }
CGBioSmalltalk >> newClassPrefix [
	" Answer a <String> with the prefix of new generated classes "
	
	^ 'Bio'
]

{ #category : #accessing }
CGBioSmalltalk >> parser [

	^ parser
]

{ #category : #accessing }
CGBioSmalltalk >> parser: anObject [

	parser := anObject
]

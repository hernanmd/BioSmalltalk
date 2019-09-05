"
This is the INP file format as described by PHASE software : 
"
Class {
	#name : #BioPhaseINPFile,
	#superclass : #BioFile,
	#instVars : [
		'headerLinesCount'
	],
	#category : 'BioFormatters-Formatters-PHASE'
}

{ #category : #accessing }
BioPhaseINPFile class >> delimiter [
	" Answer the <Character> used to delimit fields "
	
	^ Character space
]

{ #category : #examples }
BioPhaseINPFile class >> example01 [

	| inpFile |
	inpFile := self new 
		file: self testFilesFullDirectoryName / 'test.inp' ;
		headerLinesCount: 3;
		yourself.
]

{ #category : #accessing }
BioPhaseINPFile class >> possibleExtensions [
	" See superimplementor's comment"

	^ self fileFormatterClass fileExtensionsFor: 'INP'
]

{ #category : #examples }
BioPhaseINPFile class >> testFilesFullDirectoryName [
	" See superimplementor's comment "

	^ super testFilesFullDirectoryName / 'phase'
]

{ #category : #accessing }
BioPhaseINPFile >> headerLinesCount [
	" Answer a <Number> representing the count of header lines in the receiver "

	^ headerLinesCount
]

{ #category : #accessing }
BioPhaseINPFile >> headerLinesCount: anObject [
	headerLinesCount := anObject
]

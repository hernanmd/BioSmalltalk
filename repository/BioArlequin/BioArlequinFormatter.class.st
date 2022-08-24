"
Writer for Arlequin Software project files.


"
Class {
	#name : #BioArlequinFormatter,
	#superclass : #BioMatrixFormatter,
	#category : #'BioArlequin-Core'
}

{ #category : #accessing }
BioArlequinFormatter class >> description [
	" See superimplementor's comment "
	
	^ 'Arlequin Formatter/Writer'
]

{ #category : #accessing }
BioArlequinFormatter class >> formatExtension [
	"Answer a <String> corresponding for the receiver's file output format"

	^ 'arp'

]

{ #category : #accessing }
BioArlequinFormatter class >> identifiers [
	" Answer a <Collection> of identifiers of the receiver "
	
	^ #('Arlequin')
]

{ #category : #private }
BioArlequinFormatter >> beforeExport: aPCTView [
	" See superimplementor's comment "

	aPCTView hasQuerySequence ifFalse: [ 
		^ self beforeExportView: aPCTView ].
	^ true

]

{ #category : #private }
BioArlequinFormatter >> beforeExportView: anObject [
	
	^ self isPhyloclassTalk
		ifTrue: [ self beforeExportViewPhyloclassTalk: anObject ]
		ifFalse: [ self beforeExportViewBioSmalltalk: anObject ]
]

{ #category : #private }
BioArlequinFormatter >> beforeExportViewBioSmalltalk: aPCTView [

	| labelText answer|
	labelText := 'Arlequin format requires a reference sequence to be specified to proper padding of the resulting alignment'.
	^ (answer := BioInteractorEngine request: labelText) isEmptyOrNil 
		ifFalse: [ 
			aPCTView querySequence: answer.
			true  ]
		ifTrue: [ self inform: 'Reference Sequence cannot be empty. Please try again'.
			false ] 
]

{ #category : #accessing }
BioArlequinFormatter >> exportFrom: aBioClassifier [

	BioArlequinFile
		named: self outputFilename
		forHaplotypicDNAGroups: aBioClassifier
]

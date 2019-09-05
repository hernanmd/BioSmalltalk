Class {
	#name : #BioXMLResultFormatter,
	#superclass : #BioObject,
	#category : 'BioParsers-XML'
}

{ #category : #accessing }
BioXMLResultFormatter >> resultClass [
	" Answer a default class for storing the receiver's parsing results "
	
	^ self subclassResponsibility 
]

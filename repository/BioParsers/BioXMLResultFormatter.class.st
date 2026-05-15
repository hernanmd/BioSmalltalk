"
Abstract XML result formatter. Extends BioObject with accessor methods for formatted output of XML parsing results.
"
Class {
	#name : 'BioXMLResultFormatter',
	#superclass : 'BioObject',
	#category : 'BioParsers-XML',
	#package : 'BioParsers',
	#tag : 'XML'
}

{ #category : 'accessing' }
BioXMLResultFormatter >> resultClass [
	" Answer a default class for storing the receiver's parsing results "
	
	^ self subclassResponsibility 
]

Class {
	#name : 'BioXMLOrderedCollection',
	#superclass : 'BioXMLResultFormatter',
	#category : 'BioParsers-XML',
	#package : 'BioParsers',
	#tag : 'XML'
}

{ #category : 'accessing' }
BioXMLOrderedCollection >> resultClass [
	" Answer a default class for storing the receiver's parsing results "
	
	^ OrderedCollection
]

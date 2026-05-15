"
Represents a key-value association for GenBank XML parsing. Extends Association to provide GenBank-specific accessor methods.
"
Class {
	#name : 'BioGenBankAssociation',
	#superclass : 'Association',
	#category : 'BioParsers-XML',
	#package : 'BioParsers',
	#tag : 'XML'
}

{ #category : 'accessing' }
BioGenBankAssociation >> displayAsPCTResult [

	^ self key , ' -> ' , self value
]

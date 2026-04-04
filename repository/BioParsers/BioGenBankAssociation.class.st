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

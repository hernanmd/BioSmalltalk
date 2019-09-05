Class {
	#name : #BioGenBankAssociation,
	#superclass : #Association,
	#category : 'BioParsers-XML'
}

{ #category : #accessing }
BioGenBankAssociation >> displayAsPCTResult [

	^ self key , ' -> ' , self value
]

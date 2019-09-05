Class {
	#name : #BioNCBIGenBankResult,
	#superclass : #BioWebResult,
	#category : 'BioNCBI-Helpers'
}

{ #category : #converting }
BioNCBIGenBankResult >> asGenBankResults [

	^ (self result isNil or: [ self result isEmpty ])
		ifTrue: [ BioEmptyResultObject new ]
		ifFalse: [  self ]
]

{ #category : #accessing }
BioNCBIGenBankResult >> sum: aBlock [

	^ (self result select: #isEntrezSearchResult) sum: aBlock
]

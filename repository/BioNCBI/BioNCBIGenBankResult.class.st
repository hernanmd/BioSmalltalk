"
Represents a result from GenBank queries via NCBI. Extends BioWebResult with converting and accessing capabilities for GenBank-specific data.
"
Class {
	#name : 'BioNCBIGenBankResult',
	#superclass : 'BioWebResult',
	#category : 'BioNCBI-Helpers',
	#package : 'BioNCBI',
	#tag : 'Helpers'
}

{ #category : 'converting' }
BioNCBIGenBankResult >> asGenBankResults [

	^ (self result isNil or: [ self result isEmpty ])
		ifTrue: [ BioEmptyResultObject new ]
		ifFalse: [  self ]
]

{ #category : 'accessing' }
BioNCBIGenBankResult >> sum: aBlock [

	^ (self result select: #isEntrezSearchResult) sum: aBlock
]

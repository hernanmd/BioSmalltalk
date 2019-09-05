Class {
	#name : #BioEntrezUIDCollectionTest,
	#superclass : #BioAbstractTest,
	#category : 'BioEntrezTests-Core'
}

{ #category : #testing }
BioEntrezUIDCollectionTest >> testBaseUrl [
	| uids |
	" Test common usage "
	uids := BioEntrezUIDCollection withAll: #(34577062 24475906).
	self assert: uids baseUrl equals: '34577062,24475906'.
	uids := BioEntrezUIDCollection withAll: #().
	self assert: uids baseUrl equals: String empty
]

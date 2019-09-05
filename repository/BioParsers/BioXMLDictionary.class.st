Class {
	#name : #BioXMLDictionary,
	#superclass : #BioXMLResultFormatter,
	#category : 'BioParsers-XML'
}

{ #category : #accessing }
BioXMLDictionary >> resultClass [
	" Answer a default class for storing the receiver's parsing results "
	
	^ OrderPreservingDictionary
]

{ #category : #accessing }
BioXMLDictionary >> saveTag: tagNameString value: tagValueString in: aCollection [
	" Private - Save tag information in aCollection "
	
	aCollection
		at: tagNameString
		put: tagValueString
]

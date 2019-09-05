Class {
	#name : #BioXMLDictionaryMap,
	#superclass : #BioXMLResultFormatter,
	#category : 'BioParsers-XML'
}

{ #category : #accessing }
BioXMLDictionaryMap >> resultClass [
	" Answer a default class for storing the receiver's parsing results "
	
	^ OrderPreservingDictionary
]

{ #category : #accessing }
BioXMLDictionaryMap >> saveTag: tagNameString value: tagValueString in: aCollection [
	" Private - Save tag information in aCollection "
	
	aCollection
		at: tagNameString
		ifPresent: [ : collection | collection add: tagValueString ]
		ifAbsent: [ aCollection at: tagNameString put: (OrderedCollection with: tagValueString) ]
		
]

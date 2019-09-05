"
Abstract class implementing property behavior

Instance Variables
	properties:		<Dictionary>

properties
	- xxxxx

"
Class {
	#name : #BioPropertyObject,
	#superclass : #BioObject,
	#instVars : [
		'properties'
	],
	#category : #'BioTools-Core'
}

{ #category : #'accessing properties' }
BioPropertyObject >> hasProperty: keyName [
	" Answer <true> if property keyName is present. "
	
	^ properties notNil and: [ properties includesKey: keyName ]
]

{ #category : #accessing }
BioPropertyObject >> properties [
	" Answer a <Collection> of receiver's properties "
	
	^ properties
]

{ #category : #accessing }
BioPropertyObject >> properties: aCollection [

	^ properties := aCollection
]

{ #category : #iterating }
BioPropertyObject >> propertiesDo: aBlock [
	" Evaluate aBlock with each of the receiver's propert as the argument "

	self properties associationsDo: aBlock
]

{ #category : #'accessing properties' }
BioPropertyObject >> propertyAt: keyName [
	" Answer the property value associated with aKey. "
	
	^ self propertyAt: keyName ifAbsent: [ self error: 'Property not found' ]
]

{ #category : #'accessing properties' }
BioPropertyObject >> propertyAt: aKey ifAbsent: aBlock [
	" Answer the property value associated with aKey or, if aKey isn't found, answer the result of evaluating aBlock. "
	
	^ properties isNil
		ifTrue: [ aBlock value ]
		ifFalse: [ properties at: aKey ifAbsent: aBlock ]
]

{ #category : #'accessing properties' }
BioPropertyObject >> propertyAt: keyName ifAbsentPut: aBlock [
	" Answer the property associated with aKey or, if aKey isn't found store the result of evaluating aBlock as new value. "
	
	^ self 
		propertyAt: keyName 
		ifAbsent: [ self propertyAt: keyName put: aBlock value ]
]

{ #category : #'accessing properties' }
BioPropertyObject >> propertyAt: keyName put: anObject [
	" Set the property at aKey to be anObject. If aKey is not found, create a new entry for aKey and set is value to anObject. Answer anObject. "

	^ (properties ifNil: [ properties := Dictionary new: 1 ])
		at: keyName put: anObject
]

{ #category : #'accessing properties' }
BioPropertyObject >> removeProperty: keyName [
	" Remove the property with aKey. Answer the property or raise an error if aKey isn't found. "
	
	^ self 
		removeProperty: keyName 
		ifAbsent: [ self error: 'Property not found' ]
]

{ #category : #'accessing properties' }
BioPropertyObject >> removeProperty: keyName ifAbsent: aBlock [
	" Remove the property with aKey. Answer the value or, if aKey isn't found, answer the result of evaluating aBlock. "
	
	| answer |
	properties isNil ifTrue: [ ^ aBlock value ].
	answer := properties removeKey: keyName ifAbsent: aBlock.
	properties isEmpty ifTrue: [ properties := nil ].
	^ answer
]

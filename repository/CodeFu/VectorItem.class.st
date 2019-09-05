Class {
	#name : #VectorItem,
	#superclass : #VectorDecorator,
	#instVars : [
		'item'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
VectorItem class >> with: anElement and: aVector [

	^(self on: aVector)
		item: anElement;
		yourself
]

{ #category : #'instance creation' }
VectorItem class >> with: anElement andAll: aCollection [

	^(self on: (ArrayVector withAll: aCollection))
		item: anElement;
		yourself
]

{ #category : #'distance functions' }
VectorItem >> dist: anItem [

	^self vector dist: anItem vector
]

{ #category : #accessing }
VectorItem >> item [
	^item
]

{ #category : #accessing }
VectorItem >> item: anObject [
	item := anObject
]

{ #category : #printing }
VectorItem >> printOn: aStream [

	item printOn: aStream
]

{ #category : #'distance functions' }
VectorItem >> similarity: anItem [

	^self vector similarity: anItem vector
]

{ #category : #accessing }
VectorItem >> vector [
	^vector
]

{ #category : #accessing }
VectorItem >> vector: anObject [
	vector := anObject
]

Class {
	#name : #UnboundedMatrix,
	#superclass : #MatrixDecorator,
	#instVars : [
		'backgroundValue'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
UnboundedMatrix class >> on: matrix with: defaultValue [

	^(self on: matrix)
		backgroundValue: defaultValue;
		yourself
]

{ #category : #'initialize-release' }
UnboundedMatrix >> at: row and: column [

	^[ matrix at: row and: column ] 
		on: SubscriptOutOfBoundsError 
		do: [ :ex | backgroundValue ]
]

{ #category : #'initialize-release' }
UnboundedMatrix >> at: row and: column put: aNumber [

	^[ matrix at: row and: column put: aNumber ] 
		on: SubscriptOutOfBoundsError 
		do: [ :ex | backgroundValue ]
]

{ #category : #accessing }
UnboundedMatrix >> backgroundValue [
	^backgroundValue
]

{ #category : #accessing }
UnboundedMatrix >> backgroundValue: anObject [
	backgroundValue := anObject
]

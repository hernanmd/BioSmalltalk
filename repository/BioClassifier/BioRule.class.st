"
Represents a classification rule with an evaluation context and condition. Instance Variables: evaluation <BlockClosure> Evaluation block. context <Dictionary> Rule context. condition <Symbol> Condition selector.
"
Class {
	#name : 'BioRule',
	#superclass : 'BioNamedObject',
	#instVars : [
		'evaluation',
		'context',
		'condition'
	],
	#category : 'BioClassifier-RuleEngine',
	#package : 'BioClassifier',
	#tag : 'RuleEngine'
}

{ #category : 'instance creation' }
BioRule class >> name: aString action: actionBlock [

	^ self new
		name: aString;
		condition: actionBlock;
		yourself
]

{ #category : 'instance creation' }
BioRule class >> name: aString action: actionBlock context: aContext [

	^ self new
		name: aString;
		condition: actionBlock;
		context: aContext;
		yourself
]

{ #category : 'accessing' }
BioRule >> condition [
	^ condition
]

{ #category : 'accessing' }
BioRule >> condition: conditionBlockOrSymbol [

	condition := conditionBlockOrSymbol
]

{ #category : 'accessing' }
BioRule >> context [
	^ context
]

{ #category : 'accessing' }
BioRule >> context: anObject [
	context := anObject
]

{ #category : 'accessing' }
BioRule >> evaluate: subject [

	^ self condition isSymbol 
		ifTrue: [ self context perform: self condition ]
		ifFalse: [ self condition cull: subject ]
]

{ #category : 'accessing' }
BioRule >> evaluate: subject context: aContext [

	^ self condition isSymbol 
		ifTrue: [ aContext perform: self condition ]
		ifFalse: [ self condition cull: subject cull: aContext ]
]

{ #category : 'accessing' }
BioRule >> evaluation [
	^ evaluation
]

{ #category : 'accessing' }
BioRule >> evaluation: anObject [
	evaluation := anObject
]

{ #category : 'printing' }
BioRule >> printOn: aStream [

	super printOn: aStream.
	aStream
		space;
		nextPutAll: self names anyOne between: $[ and: $]

]

{ #category : 'accessing' }
BioRule >> rules [

	^ Array empty
]

"
Test class for BioPosition and coordinate classes. Validates sequence position behavior.
"
Class {
	#name : 'BioPositionTest',
	#superclass : 'BioAbstractTest',
	#instVars : [
		'position'
	],
	#category : 'BioTools-Tests-Core',
	#package : 'BioTools-Tests',
	#tag : 'Core'
}

{ #category : 'testing' }
BioPositionTest >> testNewPosition [

	position := BioLocus new
		            value: 100;
		            yourself.

	self assert: (position isKindOf: BioLocus).
	self assert: position value equals: 100
]

{ #category : 'testing' }
BioPositionTest >> testNewPositionWithRange [

	position := BioLocus new
		            start: 100;
		            length: 10;
		            yourself.
	self assert: position start equals: 100.
	self assert: position length equals: 10
]

{ #category : 'testing' }
BioPositionTest >> testSetStartEnd [

	position := BioLocus new
		            start: 10;
		            end: 100;
		            yourself.

	self assert: (position start isKindOf: Number).
	self assert: (position end isKindOf: Number).
	self assert: position start equals: 10.
	self assert: position end equals: 100
]

Class {
	#name : #BooleanVectorTest,
	#superclass : #TestCase,
	#instVars : [
		'v'
	],
	#category : 'CodeFu'
}

{ #category : #running }
BooleanVectorTest >> testAccessingLarge [

	v := BooleanVector new: 100.
	v at: 83 put: true.

	self assert: v size = 100.
	self assert: (v at: 82) not.
	self assert: (v at: 83).
	self assert: (v at: 84) not.

	v at: 83 put: false.

	self assert: (v allSatisfy: #not)
]

{ #category : #running }
BooleanVectorTest >> testAccessingSmall [

	v := BooleanVector new: 5.
	v at: 3 put: true.

	self assert: v size = 5.
	self assert: (v at: 2) not.
	self assert: (v at: 3).
	self assert: (v at: 4) not.

	v at: 3 put: false.

	self assert: (v allSatisfy: #not)
]

{ #category : #running }
BooleanVectorTest >> testAnd [

	| w vw |
	v := BooleanVector withAll: #(false false true true false false true true).
	w := BooleanVector withAll: #(false true false true true false true false).

	vw := v & w.

	self assert: vw size = 8.
	self assert: (vw asArray = #(false false false true false false true false)).
]

{ #category : #running }
BooleanVectorTest >> testNew [

	v := BooleanVector new.

	self assert: v size = 0.
]

{ #category : #running }
BooleanVectorTest >> testNewLarge [

	v := BooleanVector new: 100.

	self assert: v size = 100.
	self assert: (v allSatisfy: #not)
]

{ #category : #running }
BooleanVectorTest >> testNewSmall [

	v := BooleanVector new: 5.

	self assert: v size = 5.
	self assert: (v allSatisfy: #not)
]

{ #category : #running }
BooleanVectorTest >> testNewWithAll [

	v := BooleanVector new: 100 withAll: true.

	self assert: v size = 100.
	self assert: (v allSatisfy: #yourself)
]

{ #category : #running }
BooleanVectorTest >> testNot [

	v := BooleanVector withAll: #(false false true true false false true true).

	self assert: v not size = 8.
	self assert: (v not asArray = #(true true false false true true false false)).
]

{ #category : #running }
BooleanVectorTest >> testOr [

	| w vw |
	v := BooleanVector withAll: #(false false true true false false true true).
	w := BooleanVector withAll: #(false true false true true false true false).

	vw := v | w.

	self assert: vw size = 8.
	self assert: (vw asArray = #(false true true true true false true true)).
]

Class {
	#name : #AccumulatorTest,
	#superclass : #TestCase,
	#category : 'CodeFu'
}

{ #category : #test }
AccumulatorTest >> testAverage [

	| a |
	a := Accumulator sum.
	a accumulate: 10.
	self assert: a average = 10.
	a accumulate: 1.
	self assert: a average = (11/2).
	a accumulate: 100.
	self assert: a average = (111/3).
]

{ #category : #test }
AccumulatorTest >> testCustomBlock [

	| a |
	a := Accumulator value: 0 using: [ :current :new | current max: new size ].
	a accumulate: 'ab'.
	self assert: a value = 2.
	a accumulate: 'a'.
	self assert: a value = 2.
	a accumulate: 'abc'.
	self assert: a value = 3.
]

{ #category : #test }
AccumulatorTest >> testEnumerate [

	| a |
	a := Accumulator minimum.
	a enumerate: #( 10 1 100).
	self assert: a value = 1.
]

{ #category : #test }
AccumulatorTest >> testEnumerateWithIndex [

	| a |
	a := Accumulator minimum.
	a enumerateWithIndex: #( 10 1 100).
	self assert: a index = 2.
	self assert: a value = 1.
]

{ #category : #test }
AccumulatorTest >> testIfTruePut [

	| a |
	a := Accumulator maximum.
	a accumulate: 10 withIndex: 'first'.
	self assert: a index = 'first'.
	self assert: a value = 10.
	a accumulate: 1 withIndex: 'second'.
	self assert: a index = 'first'.
	self assert: a value = 10.
	a accumulate: 100 withIndex: 'third'.
	self assert: a index = 'third'.
	self assert: a value = 100.
]

{ #category : #test }
AccumulatorTest >> testMaximum [

	| a |
	a := Accumulator maximum.
	a accumulate: 10.
	self assert: a value = 10.
	a accumulate: 1.
	self assert: a value = 10.
	a accumulate: 100.
	self assert: a value = 100.
]

{ #category : #test }
AccumulatorTest >> testMinimum [

	| a |
	a := Accumulator minimum.
	a accumulate: 10.
	self assert: a value = 10.
	a accumulate: 1.
	self assert: a value = 1.
	a accumulate: 100.
	self assert: a value = 1.
]

{ #category : #test }
AccumulatorTest >> testSquaredSum [

	| a |
	a := Accumulator squaredSum.
	a enumerate: #(1 2 3 4 5 6 7 8 9 10).
	self assert: a value = 385.
]

{ #category : #test }
AccumulatorTest >> testSum [

	| a |
	a := Accumulator sum.
	a enumerate: #(1 2 3 4 5 6 7 8 9 10).
	self assert: a value = 55.
]

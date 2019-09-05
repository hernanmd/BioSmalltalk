Class {
	#name : #Vector,
	#superclass : #ArrayedCollection,
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
Vector class >> new [

	^self new: Number zero
]

{ #category : #'instance creation' }
Vector class >> new: aSize [

	^(self basicNew)
		initializeSize: aSize;
		yourself
]

{ #category : #'instance creation' }
Vector class >> new: aSize withAll: value [

	^(self new: aSize)
		atAllPut: value;
		yourself
]

{ #category : #'instance creation' }
Vector class >> readFromDenseText: aStream [

	| size vector |
	size := Integer readFrom: aStream skipSeparators.
	vector := self new: size.
	1 to: size do: [ :index |
		vector at: index put: (Number readFrom: aStream skipSeparators).
	].
	^vector
]

{ #category : #'constants access' }
Vector class >> unity [

	^VectorCoercion with: 1
]

{ #category : #'instance creation' }
Vector class >> withAll: aCollection [

	^(self new: aCollection size)
		atAllPut: aCollection;
		yourself
]

{ #category : #'constants access' }
Vector class >> zero [

	^VectorCoercion with: 0
]

{ #category : #arithmetic }
Vector >> * aNumber [

	^aNumber productFromVector: self
]

{ #category : #arithmetic }
Vector >> *= aNumber [
	
	^self with: (self coerce: aNumber) affect: [ :a :b | a * b ]
]

{ #category : #arithmetic }
Vector >> + aNumber [

	^aNumber sumFromVector: self
]

{ #category : #arithmetic }
Vector >> += aNumber [
	
	^self with: (self coerce: aNumber) affect: [ :a :b | a + b ]
]

{ #category : #arithmetic }
Vector >> - aNumber [

	^aNumber differenceFromVector: self
]

{ #category : #arithmetic }
Vector >> -= aNumber [
	
	^self with: (self coerce: aNumber) affect: [ :a :b | a - b ]
]

{ #category : #arithmetic }
Vector >> / aNumber [

	^aNumber quotientFromVector: self
]

{ #category : #arithmetic }
Vector >> /= aNumber [
	
	^self with: (self coerce: aNumber) affect: [ :a :b | a / b ]
]

{ #category : #comparing }
Vector >> < aMagnitude [

	self error: 'Vectors are not ordered'
]

{ #category : #comparing }
Vector >> = vector [

	^self == vector or: [ 
		(vector isKindOf: Vector) and: [
			(vector hasSize: self size) and: [
				self with: vector do: [ :a :b | a = b ifFalse: [ ^false ] ].
				true ] ] ].
]

{ #category : #converting }
Vector >> asVector [

	^self
]

{ #category : #accessing }
Vector >> at: index [

	^self subclassResponsibility
]

{ #category : #arithmetic }
Vector >> at: index  add: aNumber [

	^self at: index put: ((self at: index) + aNumber)
]

{ #category : #accessing }
Vector >> at: index ifNilPut: aBlock [
	"Answer the value at anIndex.  If the value is nil, set it to be
	the result of evaluating valueBlock, and answer that value."

	^(self at: index) ifNil: [ self at: index put: aBlock value ]
]

{ #category : #accessing }
Vector >> at: index put: aNumber [

	^self subclassResponsibility
]

{ #category : #accessing }
Vector >> atAllPut: collection [

	(collection isKindOf: Collection)
		ifTrue: [ self with: collection affect: [ :a :b | b ] ]
		ifFalse: [ super atAllPut: collection ].
]

{ #category : #comparing }
Vector >> closeTo: aNumber [
	self with: (self coerce: aNumber) do: [:a :b |
		(a closeTo: b) ifFalse: [^ false] ].
	^ true
]

{ #category : #coercing }
Vector >> coerce: aNumber [

	^VectorCoercion with: aNumber
]

{ #category : #copying }
Vector >> copyEmpty [

	^self copyEmpty: self size
]

{ #category : #copying }
Vector >> copyEmpty: size [

	^self species new: size
]

{ #category : #'vector functions' }
Vector >> cosine: aVector [

	^self unitVector dotProduct: aVector unitVector
]

{ #category : #copying }
Vector >> deepCopy [

	^self species withAll: self
]

{ #category : #private }
Vector >> defaultElement [

	^Float zero
]

{ #category : #'double dispatching' }
Vector >> differenceFromDouble: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> differenceFromFixedPoint: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> differenceFromFloat: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> differenceFromFraction: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> differenceFromInteger: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> differenceFromNumber: aNumber [

	^self collect: [ :b | aNumber - b ]
]

{ #category : #'double dispatching' }
Vector >> differenceFromPoint: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> differenceFromSmallDouble: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> differenceFromVector: aVector [

	^aVector with: self collect: [ :a :b | a - b ]
]

{ #category : #'vector functions' }
Vector >> dist: aVector [

	| sum |
	sum := 0.
	self with: aVector do: [ :a :b | sum := sum + ((a - b) ** 2) ].
	^sum
]

{ #category : #enumerating }
Vector >> do: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument."

	1 to: self size do: [ :index | aBlock value: (self at: index) ]
]

{ #category : #enumerating }
Vector >> doSparseWithIndex: aBlock [

	self doWithIndex: [ :each :index |
		each isZero ifFalse: [ aBlock value: each value: index ]
	].
	^self
]

{ #category : #'double dispatching' }
Vector >> doesNotUnderstand: aMessage [

	^super doesNotUnderstand: aMessage
]

{ #category : #'vector functions' }
Vector >> dotProduct: aVector [
	"comment stating purpose of message"

	| sum |
	(aVector hasSize: self size) ifFalse: [ ^self noMatchError ].
	sum := 0.
	self with: aVector do: [ :a :b | sum := sum + (a * b) ].
	^sum.
]

{ #category : #coercing }
Vector >> generality [

	^210
]

{ #category : #testing }
Vector >> hasSize: size [

	^self size = size
]

{ #category : #comparing }
Vector >> hash [

	^(self size hash bitXor: (self at: 1) hash) bitXor: (self at: self size) hash
]

{ #category : #'initialize-release' }
Vector >> initializeSize: aSize [

	^self subclassResponsibility
]

{ #category : #testing }
Vector >> isZero [
	"comment stating purpose of message"

	^self allSatisfy: #isZero
]

{ #category : #testing }
Vector >> isZeroAt: index [

	^(self at: index) isZero
]

{ #category : #'vector functions' }
Vector >> length [
	"comment stating purpose of message"

	^(self dotProduct: self) sqrt
]

{ #category : #arithmetic }
Vector >> negated [
	"comment stating purpose of message"

	^self collect: #negated
]

{ #category : #private }
Vector >> noModificationError [

	Error raise
]

{ #category : #'vector functions' }
Vector >> normalize [
	"comment stating purpose of message"

	| len |
	len := self length.
	len isZero
		ifTrue: [ self atAllPut: len ]
		ifFalse: [ self /= self length ].
	^self
]

{ #category : #'double dispatching' }
Vector >> productFromDouble: aVector [

	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
Vector >> productFromFixedPoint: aVector [

	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
Vector >> productFromFloat: aVector [

	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
Vector >> productFromFraction: aVector [

	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
Vector >> productFromInteger: aVector [

	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
Vector >> productFromNumber: aNumber [

	^self collect: [ :b | aNumber * b ]
]

{ #category : #'double dispatching' }
Vector >> productFromPoint: aVector [

	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
Vector >> productFromSmallDouble: aVector [

	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
Vector >> productFromVector: aVector [

	^aVector with: self collect: [ :a :b | a * b ]
]

{ #category : #enumerating }
Vector >> putWithIndex: aBlock [

	1 to: self size do: [ :index |
		self at: index put: (aBlock value: index)
	]
]

{ #category : #'double dispatching' }
Vector >> quotientFromDouble: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> quotientFromFixedPoint: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> quotientFromFloat: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> quotientFromFraction: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> quotientFromInteger: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> quotientFromNumber: aNumber [

	^self collect: [ :b | aNumber / b ]
]

{ #category : #'double dispatching' }
Vector >> quotientFromPoint: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> quotientFromSmallDouble: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> quotientFromVector: aVector [

	^aVector with: self collect: [ :a :b | a / b ]
]

{ #category : #arithmetic }
Vector >> reciprocal [
	"comment stating purpose of message"

	^self collect: #reciprocal
]

{ #category : #testing }
Vector >> respondsToArithmetic [
	"We are arithmetic, yes."

	^true
]

{ #category : #accessing }
Vector >> size [

	^self subclassResponsibility
]

{ #category : #accessing }
Vector >> sparseSize [

	| tally |
	tally := 0.
	self doSparseWithIndex: [ :each :index | tally := tally + 1 ].
	^tally
]

{ #category : #'mathematical functions' }
Vector >> sqrt [

	^self collect: #sqrt
]

{ #category : #printing }
Vector >> storeDenseTextOn: aStream [

	aStream print: self size; cr.
	self do: [ :each | aStream print: each ] separatedBy: [ aStream space. ].
	aStream cr.
]

{ #category : #'mathematical functions' }
Vector >> sum [

	^self inject: 0 into: [ :sum :each | sum + each ]
]

{ #category : #'double dispatching' }
Vector >> sumFromDouble: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> sumFromFixedPoint: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> sumFromFloat: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> sumFromFraction: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> sumFromInteger: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> sumFromNumber: aNumber [

	^self collect: [ :b | aNumber + b ]
]

{ #category : #'double dispatching' }
Vector >> sumFromPoint: aNumber [

	^self collect: [ :b | aNumber + b ]
]

{ #category : #'double dispatching' }
Vector >> sumFromSmallDouble: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
Vector >> sumFromVector: aVector [

	^aVector with: self collect: [ :a :b | a + b ]
]

{ #category : #'vector functions' }
Vector >> unitVector [
	"comment stating purpose of message"

	self isZero ifTrue: [ ^self ].
	^self / self length
]

{ #category : #enumerating }
Vector >> with: vector affect: aBlock [

	(vector hasSize: self size) ifFalse: [ ^self noMatchError ].
	1 to: self size do: [ :index |
		self at: index put: (aBlock value: (self at: index) value: (vector at: index))
	].
	^self
]

{ #category : #enumerating }
Vector >> with: vector collect: aBlock [

	| newVector |
	(vector hasSize: self size) ifFalse: [ ^self noMatchError ].
	newVector := self species new: self size.
	1 to: self size do: [ :index |
		newVector at: index put: (aBlock value: (self at: index) value: (vector at: index))
	].
	^newVector
]

{ #category : #enumerating }
Vector >> with: vector do: aBlock [

	(vector hasSize: self size) ifFalse: [ ^self noMatchError ].
	1 to: self size do: [ :index |
		aBlock value: (self at: index) value: (vector at: index)
	].
	^self
]

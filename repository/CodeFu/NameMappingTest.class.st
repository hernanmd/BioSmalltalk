Class {
	#name : #NameMappingTest,
	#superclass : #TestCase,
	#category : 'CodeFu'
}

{ #category : #test }
NameMappingTest >> testAddDuplicate [

	| m |
	m := NameMapping withAll: #(a b c d).
	
	self should: [ m add: #a ] raise: Error
]

{ #category : #test }
NameMappingTest >> testNames [

	| m |
	m := NameMapping withAll: #(a b c d).

	self assert: (m equalsTo: #(1 2 3 4)).	
	self assert: (m names equalsTo: #(a b c d)).
]

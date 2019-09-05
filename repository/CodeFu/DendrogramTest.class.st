Class {
	#name : #DendrogramTest,
	#superclass : #TestCase,
	#instVars : [
		'dendrogram'
	],
	#category : 'CodeFu'
}

{ #category : #fixture }
DendrogramTest >> setUp [

	| ab cd ef abcd efg |
	ab := (	Dendrogram with: #a) merge: (Dendrogram with: #b) at: 1.
	cd := (Dendrogram with: #c) merge: (Dendrogram with: #d) at: 2.
	ef := (Dendrogram with: #e) merge: (Dendrogram with: #f) at: 3.
	abcd := ab merge: cd at: 4.
	efg := ef merge: (Dendrogram with: #g) at: 5.
	dendrogram := abcd merge: efg at: 7.

	"#(((a 1 b) 4 (c 2 d)) 7 ((e 3 f) 5 g))"
]

{ #category : #test }
DendrogramTest >> testAllLeaves [

	self assert: dendrogram elements size = 7.
	self assert: (dendrogram elements equalsTo: #(a b c d e f g)).
]

{ #category : #test }
DendrogramTest >> testIndex [

	self assert: dendrogram index = 1.

	self assert: dendrogram left index = 1.
	self assert: dendrogram right index = 5.

	self assert: dendrogram left left index = 1.
	self assert: dendrogram left right index = 3.
	self assert: dendrogram right left index = 5.
	self assert: dendrogram right right index = 7.
]

{ #category : #test }
DendrogramTest >> testSize [

	self assert: dendrogram size = 7.

	self assert: dendrogram left size = 4.
	self assert: dendrogram right size = 3.

	self assert: dendrogram left left size = 2.
	self assert: dendrogram left right size = 2.
	self assert: dendrogram right left size = 2.
	self assert: dendrogram right right size = 1.
]

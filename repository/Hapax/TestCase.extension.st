Extension { #name : #TestCase }

{ #category : #'*hapax' }
TestCase >> assert: anObject equals: anotherObject [ 

	self assert: (anObject equalsTo: anotherObject)
]

{ #category : #'*hapax' }
TestCase >> assertBlock: aBlock raises: err [
	^ self should: aBlock raise: err
]

Extension { #name : #Collection }

{ #category : #'*codefu' }
Collection >> \ aSet [
	"Answer the set difference A \ B between the receiver A and aSet B. The set
	difference is defined by A \ B = { x | x in A and x not in B }."

	^self select: [ :each | (aSet includes: each) not ]
]

{ #category : #'*codefu' }
Collection >> collectAssocations [

	^(self collect: #key) -> (self collect: #value)
]

{ #category : #'*codefu' }
Collection >> cross: aCollection do: aBlock [
	"Evaluates aBlock for each pair of the receiver's elements."

	self do: [ :each |
		aCollection do: [ :another | 
			aBlock value: each value: another ] ].
]

{ #category : #'*codefu' }
Collection >> flatten [
	"Recursively collect each non-collection element of the receiver and its descendant
	collections.  Please note, this implementation assumes that strings are to be treated
	as objects rather than as collection."

	^self gather: [ :each ]
]

{ #category : #'*codefu' }
Collection >> shuffle [
	"Swaps the receiver's elements at random."

	self shuffle: self size * self size log ceiling
]

{ #category : #'*codefu' }
Collection >> shuffle: times [
	"Swaps random elements of the receiver."

	| size random |
	size := self size.
	random := Random new.
	times timesRepeat: [ 
		self swap: (random next * size) floor + 1 with: (random next * size) floor + 1 
	].
]

Class {
	#name : #BooleanVector,
	#superclass : #Vector,
	#instVars : [
		'bits',
		'size'
	],
	#category : 'CodeFu'
}

{ #category : #'logical operations' }
BooleanVector >> & booleanVector [

	[ self size = booleanVector size ] assert.
	^(self class new: self size) 
		setBits: (self getBits bitAnd: booleanVector getBits);
		yourself
]

{ #category : #accessing }
BooleanVector >> at: index [ 
	^bits allMask: (1 bitShift: index - 1)
]

{ #category : #accessing }
BooleanVector >> at: index put: boolean [

	^boolean 
		ifTrue: [ bits := bits maskSet: 1 << (index - 1) ]
		ifFalse: [ bits := bits maskClear: 1 << (index - 1) ]
]

{ #category : #private }
BooleanVector >> bits [

	^bits
]

{ #category : #private }
BooleanVector >> getBits [

	^bits
]

{ #category : #'initialize-release' }
BooleanVector >> initializeSize: aSize [

	bits := 0.
	size := aSize
]

{ #category : #'logical operations' }
BooleanVector >> not [

	^(self class new: self size) 
		setBits: (self getBits bitInvert);
		yourself
]

{ #category : #private }
BooleanVector >> setBits: integer [

	^bits := integer
]

{ #category : #accessing }
BooleanVector >> size [

	^size
]

{ #category : #'logical operations' }
BooleanVector >> | booleanVector [

	[ self size = booleanVector size ] assert.
	^(self class new: self size) 
		setBits: (self getBits bitOr: booleanVector getBits);
		yourself
]

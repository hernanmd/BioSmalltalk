Extension { #name : #Number }

{ #category : #'*codefu' }
Number >> ** aNumber [ 
	"Answer the receiver raised to the power of the argument, aNumber."
	"Just some infix sugar for Number>>raisedTo:"

	^self raisedTo: aNumber
]

{ #category : #'*codefu' }
Number >> asDouble [
	^ self asFloat
]

{ #category : #'*codefu' }
Number >> differenceFromMatrix: aMatrix [

	^aMatrix collect: [ :a | a - self ]
]

{ #category : #'*codefu' }
Number >> differenceFromVector: aVector [

	^aVector collect: [ :a | a - self ]
]

{ #category : #'*codefu' }
Number >> dist: aNumber [

	^self < aNumber
		ifTrue: [ aNumber - self ]
		ifFalse: [ self - aNumber ]
]

{ #category : #'*codefu' }
Number >> productFromMatrix: aMatrix [

	^aMatrix collect: [ :a | a * self ]
]

{ #category : #'*codefu' }
Number >> productFromVector: aVector [

	^aVector collect: [ :a | a * self ]
]

{ #category : #'*codefu' }
Number >> quotientFromMatrix: aMatrix [

	^aMatrix collect: [ :a | a / self ]
]

{ #category : #'*codefu' }
Number >> quotientFromVector: aVector [

	^aVector collect: [ :a | a / self ]
]

{ #category : #'*codefu' }
Number >> sumFromMatrix: aMatrix [

	^aMatrix collect: [ :a | a + self ]
]

{ #category : #'*codefu' }
Number >> sumFromVector: aVector [

	^aVector collect: [ :a | a + self ]
]

{ #category : #'*codefu' }
Number class >> unity [ 
	^ 1
]

{ #category : #'*codefu' }
Number class >> zero [ 
	^ 0
]

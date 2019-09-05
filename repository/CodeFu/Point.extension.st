Extension { #name : #Point }

{ #category : #'*codefu' }
Point >> differenceFromMatrix: aMatrix [

	^aMatrix collect: [ :a | a - self ]
]

{ #category : #'*codefu' }
Point >> differenceFromVector: aVector [

	^aVector collect: [ :a | a - self ]
]

{ #category : #'*codefu' }
Point >> productFromMatrix: aMatrix [

	^aMatrix collect: [ :a | a * self ]
]

{ #category : #'*codefu' }
Point >> productFromVector: aVector [

	^aVector collect: [ :a | a * self ]
]

{ #category : #'*codefu' }
Point >> quotientFromMatrix: aMatrix [

	^aMatrix collect: [ :a | a / self ]
]

{ #category : #'*codefu' }
Point >> quotientFromVector: aVector [

	^aVector collect: [ :a | a / self ]
]

{ #category : #'*codefu' }
Point >> sumFromMatrix: aMatrix [

	^aMatrix collect: [ :a | a + self ]
]

{ #category : #'*codefu' }
Point >> sumFromVector: aVector [

	^aVector collect: [ :a | a + self ]
]

{ #category : #'*codefu' }
Point >> transpose [
	"Answer a new Point whose x is the receiver's y and whose y is the 
	receiver's x."

	^y @ x
]

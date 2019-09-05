Class {
	#name : #ValueItem,
	#superclass : #Association,
	#category : 'CodeFu'
}

{ #category : #'distance functions' }
ValueItem >> dist: anItem [

	^self value dist: anItem value
]

{ #category : #accessing }
ValueItem >> item [

	^self key
]

{ #category : #accessing }
ValueItem >> item: anObject [

	^self key: anObject
]

{ #category : #'distance functions' }
ValueItem >> similarity: anItem [

	^self value similarity: anItem value
]

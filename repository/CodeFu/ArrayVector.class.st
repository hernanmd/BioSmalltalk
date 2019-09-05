Class {
	#name : #ArrayVector,
	#superclass : #Vector,
	#type : #variable,
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
ArrayVector class >> new: size [

	^self basicNew: size
]

{ #category : #accessing }
ArrayVector >> at: index [

	^self basicAt: index
]

{ #category : #accessing }
ArrayVector >> at: index put: aNumber [

	^self basicAt: index put: aNumber
]

{ #category : #accessing }
ArrayVector >> size [

	^self basicSize
]

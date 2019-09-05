Class {
	#name : #BioNullBreed,
	#superclass : #BioNamedBreed,
	#category : 'BioPopulation-Core'
}

{ #category : #accessing }
BioNullBreed >> locations [

	^ Array new
]

{ #category : #accessing }
BioNullBreed >> locationsWithoutPrefixes [

	^ Array new
]

{ #category : #testing }
BioNullBreed >> notNil [ 
	"Refer to the comment in Object|notNil."

	^ false
]

{ #category : #printing }
BioNullBreed >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	aStream nextPutAll: 'Null' between: $[  and: $]

]

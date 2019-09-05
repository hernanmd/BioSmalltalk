Extension { #name : #Collection }

{ #category : #'*hapax' }
Collection >> copyEmpty: aSize [
	"Answer a copy of the receiver that contains no elements.

	This method should be redefined in subclasses that add
	instance variables, so that the state of those variables
	is preserved"

	^self class new: aSize
]

{ #category : #'*hapax' }
Collection >> equalsTo: aCollection [ 
	"Answer true if the reciever contains the same elements as aCollection, and vice versa."

	^(aCollection isCollection) 
		and: [ aCollection size = self size 
			and: [ aCollection allSatisfy: [ :each | 
				(aCollection occurrencesOf: each) = (self occurrencesOf: each) ]]]
]

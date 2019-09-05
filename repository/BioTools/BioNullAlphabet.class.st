"
A BioNullAlphabet is used when a sequence has no alphabet.

"
Class {
	#name : #BioNullAlphabet,
	#superclass : #BioAlphabet,
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioNullAlphabet class >> codes [
	" See superimplementor's comment "
	
	^ String empty
]

{ #category : #'instance creation' }
BioNullAlphabet class >> for: aString [
	" Answer a new instance of the receiver using the sequence aString "
	
	^ (self guessAlphabetFrom: aString) new
]

{ #category : #testing }
BioNullAlphabet class >> hasAmbiguousBases: aString [ 
	" See superimplementor's comment "

	^ true
]

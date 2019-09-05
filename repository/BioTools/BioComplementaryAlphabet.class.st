"
Alphabet where each element has a complementary case.
Abstract class.
"
Class {
	#name : #BioComplementaryAlphabet,
	#superclass : #BioAlphabet,
	#classInstVars : [
		'complementaryTable'
	],
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioComplementaryAlphabet class >> complementaryCases [

	^ Array empty

]

{ #category : #accessing }
BioComplementaryAlphabet class >> complementaryTable [

	^ complementaryTable
		ifNil: [ 
			self initialize.
			self complementaryTable ]
]

{ #category : #accessing }
BioComplementaryAlphabet class >> complementaryTable: aCollection [

	complementaryTable := aCollection
]

{ #category : #'class initialization' }
BioComplementaryAlphabet class >> complementaryTableClass [
	" Answer a <Class> to store the complementary cases for the receiver "

	^ Dictionary
	
]

{ #category : #'class initialization' }
BioComplementaryAlphabet class >> initialize [
	" self initailize "

	self complementaryTable: 
		(self complementaryTableClass newFromPairs: self complementaryCases).

]

{ #category : #testing }
BioComplementaryAlphabet >> canTranslate [
	" Answer <true> if the receiver can be translated into proteins (amino acid sequences) "
	
	^ true
]

{ #category : #'accessing private' }
BioComplementaryAlphabet >> complementaryTable [
	" Answer a <Collection> with the receiver's complementary table "

	^ self class complementaryTable
]

"
A BioIUPACProtein represents the IUPAC protein single letter alphabet of the 20 standard amino acids.

Instance Variables
	stopSymbol:		<Character>


"
Class {
	#name : #BioIUPACProtein,
	#superclass : #BioIUPACAlphabet,
	#instVars : [
		'stopSymbol'
	],
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioIUPACProtein class >> ambiguityCodes [
	" Do not answer lowercase versions "

	^ '-X'
]

{ #category : #accessing }
BioIUPACProtein class >> codes [

	^ 'ACDEFGHIKLMNPQRSTVWY'
]

{ #category : #testing }
BioIUPACProtein >> canTranslate [
	" Answer <true> if a sequence can be translated using the receiver "

	^ false
]

{ #category : #accessing }
BioIUPACProtein >> complementaryTable [
	" Answer the receiver's complementary table "

	^ self signalInvalidObject: 'Proteins do not have complements' translated
]

{ #category : #testing }
BioIUPACProtein >> isProtein [
	" See superimplementor's comment "

	^ true
]

{ #category : #printing }
BioIUPACProtein >> printOn: aStream [
	" See superimplementor's comment "
	
	super printOn: aStream.
	aStream nextPutAll: ' -> Protein'
]

{ #category : #accessing }
BioIUPACProtein >> stopSymbol [
	^ stopSymbol
		ifNil: [ stopSymbol := $* ]
]

{ #category : #accessing }
BioIUPACProtein >> stopSymbol: anObject [
	stopSymbol := anObject
]

{ #category : #accessing }
BioIUPACProtein >> unknownLetter [
	" Answer a <Character> with the default letter used when a letter
	in a position in the sequence is unknown "

	^ $X
]

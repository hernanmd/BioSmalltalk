"
GTContractionNaming is a String formatter for contracting description Strings into a limited String with, for example, limiting to 3 characters. 

'South Africa One' -> 'SAO'

this is useful for programs which have limits in the samples names.

"
Class {
	#name : #BioContractionNaming,
	#superclass : #BioNaming,
	#instVars : [
		'contractionLimit',
		'capitalize',
		'skipStopWords'
	],
	#category : #'BioFormatters-Naming'
}

{ #category : #accessing }
BioContractionNaming >> capitalize [

	^ capitalize

]

{ #category : #accessing }
BioContractionNaming >> contractionLimit [

	^ contractionLimit

]

{ #category : #accessing }
BioContractionNaming >> contractionLimit: anObject [
	contractionLimit := anObject
]

{ #category : #accessing }
BioContractionNaming >> format: aString [
	" Answer a String from contracting first letters from aString "

	| result |
	
	self contractionLimit > aString substrings size
		ifTrue: [ ^ self signalInvalidObject: 'Not enough letters to contract with the receiver, try reducing the contractionLimit' translated ].
	result := (aString substrings first: self contractionLimit)
			inject: String new
			into: [ : accum : subStr | accum , subStr first asString ].
	self capitalize
		ifTrue: [ result := result asUppercase ].
	^ result.
]

{ #category : #'initialize-release' }
BioContractionNaming >> initialize [
	" Private - Set receiver's default settings "
	
	super initialize.
	capitalize := true.
	skipStopWords := false.
	contractionLimit := 3.

]

{ #category : #accessing }
BioContractionNaming >> setCapitalization [
	" Set the receiver to capitalize the formatting result "
	
	capitalize := true
]

{ #category : #accessing }
BioContractionNaming >> skipStopWords [
	^ skipStopWords
]

{ #category : #accessing }
BioContractionNaming >> skipStopWords: anObject [
	skipStopWords := anObject
]

{ #category : #accessing }
BioContractionNaming >> unsetCapitalization [
	" Set the receiver to not capitalize the formatting result "
	
	capitalize := false
]

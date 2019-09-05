Class {
	#name : #Stemmer,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#classVars : [
		'English',
		'Englishh'
	],
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #stemming }
Stemmer class >> initialize [
	Englishh := PorterStemmer new
]

{ #category : #stemming }
Stemmer class >> stem: aString [

	^Englishh stem: aString
]

{ #category : #'private-algorithm' }
Stemmer >> cache [
	"Answer the cache of stemmed words."

	^cache isNil
		ifTrue: [ cache := Dictionary new ] 
		ifFalse: [ cache ]
]

{ #category : #'private-algorithm' }
Stemmer >> performStemming: aString [
	"Perform the stemming of a string."

	^self subclassResponsibility.
]

{ #category : #accessing }
Stemmer >> purgeCache [
	"Clear the recievers cache of stemmed words."

	cache := nil
]

{ #category : #accessing }
Stemmer >> stem: aString [
	"Answer the the morphological root of a word, ie removes its suffix." 

	^self cache at: aString ifAbsentPut: [ self performStemming: aString ]
]

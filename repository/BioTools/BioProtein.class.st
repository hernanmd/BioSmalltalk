"
A BioProtein is a sequence that constrains the alphabet to Amino Acids
"
Class {
	#name : 'BioProtein',
	#superclass : 'BioRepeatSequence',
	#category : 'BioTools-Core',
	#package : 'BioTools',
	#tag : 'Core'
}

{ #category : 'accessing private' }
BioProtein >> defaultAlphabetClass [

	^ BioIUPACProtein
]

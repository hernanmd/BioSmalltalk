"
A BioProtein is a sequence that constrains the alphabet to Amino Acids
"
Class {
	#name : 'BioProtein',
	#superclass : 'BioRepeatSequence',
	#category : 'BioTools-Biological',
	#package : 'BioTools',
	#tag : 'Biological'
}

{ #category : 'accessing private' }
BioProtein >> defaultAlphabetClass [

	^ BioIUPACProtein
]

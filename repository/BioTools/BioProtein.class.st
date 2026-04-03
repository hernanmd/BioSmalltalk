Class {
	#name : 'BioProtein',
	#superclass : 'BioSequence',
	#category : 'BioTools-Sequences',
	#package : 'BioTools',
	#tag : 'Sequences'
}

{ #category : 'accessing' }
BioProtein >> defaultAlphabetClass [

	^ BioIUPACProtein
]

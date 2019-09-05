"
Represents a single DNA nucleotide

letter:	<Character>
	

"
Class {
	#name : #BioDNANucleotide,
	#superclass : #BioObject,
	#instVars : [
		'letter'
	],
	#category : #'BioTools-Biological'
}

{ #category : #'instance creation' }
BioDNANucleotide class >> with: aCharacter [

	^ self basicNew 
		letter: aCharacter first;
		yourself
]

{ #category : #accessing }
BioDNANucleotide >> letter [
	^ letter
]

{ #category : #accessing }
BioDNANucleotide >> letter: anObject [
	letter := anObject
]

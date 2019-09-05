"
Represents a Microsatellite DNA.  A microsatellite is a region of nuclear DNA in which certain DNA motifs (ranging in length from 2 to 5 base pairs) are repeated.

A microsatellite is defined by a name, fragment size range (bp), dye color, and repeat length. See class side for examples.
	
References 

https://en.wikipedia.org/wiki/Microsatellite
https://en.wikipedia.org/wiki/Sequence_motif
https://tools.thermofisher.com/content/sfs/manuals/cms_042039.pdf


"
Class {
	#name : #BioSTRSequence,
	#superclass : #BioRepeatSequence,
	#category : #'BioTools-Repeats'
}

{ #category : #examples }
BioSTRSequence class >> example01 [

	^ self new	
		motif: 'AT';
		repeats: 5;
		yourself.
]

{ #category : #examples }
BioSTRSequence class >> example02 [

	^ self new 
		name: 'BM1818';
		motif: 'TG';
		start: 266;
		end: 270;
		yourself;
		inspect
]

{ #category : #examples }
BioSTRSequence class >> example03 [

	^ self new 
		name: 'BM1818';
		motif: 'TG';
		positions: 266 -> 270;
		yourself;
		inspect
]

{ #category : #defaults }
BioSTRSequence >> defaultMaxMotifSize [
	" Microsatellite definition at the US National Library of Medicine Medical Subject Headings (MeSH) "
	
	^ 5
]

{ #category : #defaults }
BioSTRSequence >> defaultMinMotifSize [
	" Microsatellite definition at the US National Library of Medicine Medical Subject Headings (MeSH) "
	
	^ 2
]

{ #category : #testing }
BioSTRSequence >> isDiNucleotide [
	" Answer <true> if receiver is   a di-nucleotide sequence "

	^ self notEmpty and: [ self repeats = 2 ]
]

{ #category : #testing }
BioSTRSequence >> isMonoNucleotide [
	" Answer <true> if receiver is all the same letter "

	^ self notEmpty and: [ self repeats = 1 ]
]

{ #category : #testing }
BioSTRSequence >> isPentaNucleotide [
	" Answer <true> if receiver is a penta-nucleotide sequence "

	^ self notEmpty and: [ self repeats = 5 ]
]

{ #category : #testing }
BioSTRSequence >> isSTRSequence [
	" Answer <true> if the receiver represents a STR sequence "
	
	^ true
]

{ #category : #testing }
BioSTRSequence >> isTetraNucleotide [
	" Answer <true> if receiver is  a tetra-nucleotide sequence "

	^ self notEmpty and: [ self repeats = 4 ]
]

{ #category : #testing }
BioSTRSequence >> isTriNucleotide [
	" Answer <true> if receiver is  a tri-nucleotide sequence "

	^ self notEmpty and: [ self repeats = 3 ]
]

{ #category : #printing }
BioSTRSequence >> printMotifOn: aStream [

	self motif notNil
		ifTrue: [ 
			aStream
				nextPutAll: self motif between: $( and: $);
				nextPutAll: self repeats asString ]
]

{ #category : #printing }
BioSTRSequence >> printOn: aStream [
	" Private - See superimplementor's comment "

	super printOn: aStream.
	self printMotifOn: aStream.

]

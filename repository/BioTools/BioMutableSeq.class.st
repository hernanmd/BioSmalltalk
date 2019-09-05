"
A mutable sequence which can be modified after creation, it lets you edit the sequence.

"
Class {
	#name : #BioMutableSeq,
	#superclass : #BioSequence,
	#category : #'BioTools-Sequences'
}

{ #category : #accessing }
BioMutableSeq >> append: aString [
	" This method modifies the receiver. Append aString to the receiver's sequence "
	
	seq := String streamContents: [ : str | 
		str
			nextPutAll: seq;
			nextPutAll: aString asString ]
]

{ #category : #converting }
BioMutableSeq >> asSequence [
	" Answer a copy of the receiver converted to a read-only object "
	
	^ BioSequence
		newWith: self asString copy
		alphabet: self alphabet class
]

{ #category : #accessing }
BioMutableSeq >> at: anInteger put: aLetter [
	" Store aLetter in the position of the receiver indicated by the anInteger.
	Answer the receiver "
	
	seq at: anInteger put: aLetter
]

{ #category : #accessing }
BioMutableSeq >> copyReplaceAll: oldSubstring with: newSubstring [ 
	" Refer to comment in Collection>>copyReplaceAll: oldSubstring with: newSubstring "

	^ seq copyReplaceAll: oldSubstring with: newSubstring 
]

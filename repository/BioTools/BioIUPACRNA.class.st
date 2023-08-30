"
Abstract class grouping codes for RNA alphabets.
See subclasses for specific details.

"
Class {
	#name : #BioIUPACRNA,
	#superclass : #BioIUPACAlphabet,
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioIUPACRNA class >> codes [

	^ String empty
]

{ #category : #accessing }
BioIUPACRNA >> codonTable [
	" Answer the appropriate BioCodonTable for the receiver "
	
	^ BioRNACodonTables
]

{ #category : #testing }
BioIUPACRNA >> isRNA [
	" See superimplementor's comment "

	^ true
]

{ #category : #printing }
BioIUPACRNA >> printOn: aStream [
	" See superimplementor's comment "
	
	super printOn: aStream.
	aStream nextPutAll: ' -> RNA'
]

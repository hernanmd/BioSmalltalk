Class {
	#name : #BioIUPACDNA,
	#superclass : #BioIUPACAlphabet,
	#category : 'BioTools-Alphabets'
}

{ #category : #accessing }
BioIUPACDNA >> codonTable [
	" Answer the appropriate BioCodonTable for the receiver "
	
	^ BioDNACodonTables
]

{ #category : #testing }
BioIUPACDNA >> isDNA [
	" Private - See superimplementor's comment "

	^ true
]

{ #category : #printing }
BioIUPACDNA >> printOn: aStream [
	" See superimplementor's comment "
	
	super printOn: aStream.
	aStream nextPutAll: ' DNA'
]

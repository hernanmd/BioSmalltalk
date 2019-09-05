"
Nucleotide alphabet only including A,C,G,T without additional codes such as (N)ot a gap. Useful for learning purposes.

"
Class {
	#name : #BioDNAAlphabet,
	#superclass : #BioComplementaryAlphabet,
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioDNAAlphabet class >> ambiguityCodes [
	" See superimplementor's comment "
	
	^ String empty
]

{ #category : #accessing }
BioDNAAlphabet class >> codes [
	" See superimplementor's comment "
	
	^ 'ACGT'
]

{ #category : #accessing }
BioDNAAlphabet class >> complementaryCases [
	" Private - Uppercase and lowercase versions are included to preserve the case, which avoids case conversion and could be useful to distinguish sequence regions "
	<lint: 'Literal array contains only characters' rationale: 'Nucleotide method' author: 'HernanMoralesDurand'>

	^ #($A $T $T $A $C $G $G $C $a $t $t $a $c $g $g $c)
]

{ #category : #testing }
BioDNAAlphabet >> canTranslate [
	" Answer <true> if the receiver can be translated into proteins (amino acid sequences) "
	
	^ true
]

{ #category : #testing }
BioDNAAlphabet >> isDNA [
	" Private - See superimplementor's comment "

	^ true
]

{ #category : #printing }
BioDNAAlphabet >> printOn: aStream [
	" See superimplementor's comment "
	
	aStream 
		nextPutAll: self codes asString between: $[ and: $]
]

"
BioIUPACUnambiguousDNA is an Alphabet allowing only the A,T,G,C letters. It includes also any nucleotide (N) not a gap.

"
Class {
	#name : #BioIUPACUnambiguousDNA,
	#superclass : #BioIUPACDNA,
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioIUPACUnambiguousDNA class >> ambiguityCodes [
	" Do not answer lowercase versions "

	^ 'N'
]

{ #category : #accessing }
BioIUPACUnambiguousDNA class >> codes [

	^ 'GATCN'
]

{ #category : #accessing }
BioIUPACUnambiguousDNA class >> complementaryCases [
	" Private - Uppercase and lowercase versions are included to preserve the case, which avoids case conversion and could be useful to distinguish sequence regions "
	<lint: 'Literal array contains only characters' rationale: 'Nucleotide method' author: 'HernanMoralesDurand'>

	^ #($A $T $T $A $C $G $G $C $N $N $a $t $t $a $c $g $g $c $n $n $- $- $  $  )
]

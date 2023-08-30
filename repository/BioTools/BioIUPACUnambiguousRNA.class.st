"
It represents the IUPAC RNA alphabet for unambiguous bases.
See class side for implementation details.
"
Class {
	#name : #BioIUPACUnambiguousRNA,
	#superclass : #BioIUPACRNA,
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioIUPACUnambiguousRNA class >> ambiguityCodes [
	" Do not answer lowercase versions "

	^ 'N'
]

{ #category : #accessing }
BioIUPACUnambiguousRNA class >> codes [

	^ 'GAUC'
]

{ #category : #accessing }
BioIUPACUnambiguousRNA class >> complementaryCases [
	<lint: 'Literal array contains only characters' rationale: 'Nucleotide method' author: 'hfm'>

	^ #($a $u $u $a $c $g $g $c)
]

{ #category : #printing }
BioIUPACUnambiguousRNA >> printOn: aStream [
	" See superimplementor's comment "
	
	super printOn: aStream.
	aStream nextPutAll: ' -> Unambiguous'
]

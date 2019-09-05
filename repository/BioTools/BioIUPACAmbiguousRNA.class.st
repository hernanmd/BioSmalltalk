Class {
	#name : #BioIUPACAmbiguousRNA,
	#superclass : #BioIUPACRNA,
	#category : 'BioTools-Alphabets'
}

{ #category : #accessing }
BioIUPACAmbiguousRNA class >> ambiguityCodes [
	" Do not answer lowercase versions "

	^ 'RYWSMKHBVDN'
]

{ #category : #accessing }
BioIUPACAmbiguousRNA class >> codes [

	^ 'GAUCRYWSMKHBVDN'
]

{ #category : #accessing }
BioIUPACAmbiguousRNA class >> complementaryCases [
	<lint: 'Literal array contains only characters' rationale: 'Nucleotide method' author: 'hfm'>

	^ #($a $u $u $a $c $g $g $c $m $k $r $y $w $w $s $s $y $r $k $m $v $b $h $d $d $h $b $v $x $x $n $n)
]

{ #category : #testing }
BioIUPACAmbiguousRNA class >> isAmbiguousAlphabet [
	" See superimplementor's comment "

	^ true
]

{ #category : #printing }
BioIUPACAmbiguousRNA >> printOn: aStream [
	" See superimplementor's comment "
	
	super printOn: aStream.
	aStream nextPutAll: ' -> Ambiguous'
]

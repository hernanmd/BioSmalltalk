Class {
	#name : #BioIUPACAmbiguousDNA,
	#superclass : #BioIUPACUnambiguousDNA,
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioIUPACAmbiguousDNA class >> ambiguityCodes [
	" Answer a <String> with both two and three ambiguity letters. Do not answer lowercase versions "

	^ 'WSMKRYBDHVN'
]

{ #category : #accessing }
BioIUPACAmbiguousDNA class >> ambiguousLettersMap [
	" Answer a <Dictionary> with mappings between ambiguity codes. Note ambiguity codes could appear as:	
	[AT]
	[A/T]
	W
	"

	^ Dictionary new
		add: 'AT' -> 'W';
		add: 'TA' -> 'W';
		add: 'CG' -> 'S';
		add: 'GC' -> 'S';
		add: 'AC' -> 'M';
		add: 'CA' -> 'M';
		add: 'GT' -> 'K';
		add: 'TG' -> 'K';
		add: 'AG' -> 'R';
		add: 'GA' -> 'R';
		add: 'CT' -> 'Y';
		add: 'TC' -> 'Y';
		add: 'CGT' -> 'B';
		add: 'CTG' -> 'B';
		add: 'GCT' -> 'B';
		add: 'GTC' -> 'B';
		add: 'TGC' -> 'B';
		add: 'TCG' -> 'B';
		add: 'AGT' -> 'D';
		add: 'ATG' -> 'D';
		add: 'GAT' -> 'D';
		add: 'GTA' -> 'D';
		add: 'TGA' -> 'D';
		add: 'TCA' -> 'D';
		add: 'CAT' -> 'H';
		add: 'CTA' -> 'H';
		add: 'ACT' -> 'H';
		add: 'ATC' -> 'H';
		add: 'TAC' -> 'H';
		add: 'TCA' -> 'H';
		add: 'CGA' -> 'V';
		add: 'CAG' -> 'V';
		add: 'GCA' -> 'V';
		add: 'GAC' -> 'V';
		add: 'AGC' -> 'V';
		add: 'ACG' -> 'V';
		add: 'ACGT' -> 'N';
		yourself
]

{ #category : #accessing }
BioIUPACAmbiguousDNA class >> codes [
	"Answer a <String> with all the receiver's letters, including both two and three ambiguity letters."
	
	^ 'ACGTWSMKRYBDHVN'
]

{ #category : #accessing }
BioIUPACAmbiguousDNA class >> complementaryCases [
	" Private - Uppercase and lowercase versions are included to preserve the case, which avoids case conversion and could be useful to distinguish sequence regions "
	<lint: 'Literal array contains only characters' rationale: 'Nucleotide method' author: 'HernanMoralesDurand'>

	^ #($A $T $T $A $C $G $G $C $M $K $R $Y $W $W $S $S $Y $R $K $M $V $B $H $D $D $H $B $V $X $X $N $N $a $t $t $a $c $g $g $c $m $k $r $y $w $w $s $s $y $r $k $m $v $b $h $d $d $h $b $v $x $x $n $n $- $- $  $  )
]

{ #category : #testing }
BioIUPACAmbiguousDNA class >> isAmbiguousAlphabet [
	" See superimplementor's comment "

	^ true
]

{ #category : #accessing }
BioIUPACAmbiguousDNA class >> threeLetterAmbiguityCodes [

	^ 'HBVD'
]

{ #category : #accessing }
BioIUPACAmbiguousDNA class >> twoLetterAmbiguityCodes [

	^ 'YRSWKM'
]

{ #category : #printing }
BioIUPACAmbiguousDNA >> printOn: aStream [
	" See superimplementor's comment "
	
	super printOn: aStream.
	aStream nextPutAll: ' -> Ambiguous'
]

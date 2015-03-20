accessing
complementaryCases
	" Private - Uppercase and lowercase versions are included to preserve the case, which avoids case conversion and could be useful to distinguish sequence regions "
	<lint: 'Literal array contains only characters' rationale: 'Nucleotide method' author: 'hfm'>

	^ #($A $T $T $A $C $G $G $C $N $N $a $t $t $a $c $g $g $c $n $n $- $- $  $  )
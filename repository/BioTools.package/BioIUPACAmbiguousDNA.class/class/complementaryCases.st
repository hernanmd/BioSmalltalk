accessing
complementaryCases
	" Private - Uppercase and lowercase versions are included to preserve the case, which avoids case conversion and could be useful to distinguish sequence regions "
	<lint: 'Literal array contains only characters' rationale: 'Nucleotide method' author: 'hfm'>

	^ #($A $T $T $A $C $G $G $C $M $K $R $Y $W $W $S $S $Y $R $K $M $V $B $H $D $D $H $B $V $X $X $N $N $a $t $t $a $c $g $g $c $m $k $r $y $w $w $s $s $y $r $k $m $v $b $h $d $d $h $b $v $x $x $n $n $- $- $  $  )
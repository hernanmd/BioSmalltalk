accessing
molecularWeightDegen

	| lowerBoundsSequence upperBoundsSequence |
	
	lowerBoundsSequence := self sequence asMutableSequence.
	upperBoundsSequence := self sequence asMutableSequence.
	"replace all other degenerates with lightest base possible in lowerBoundsSequence"
	lowerBoundsSequence := lowerBoundsSequence copyReplaceAll: $r with: $a.
	lowerBoundsSequence := lowerBoundsSequence copyReplaceAll: $y with: $c.
	lowerBoundsSequence := lowerBoundsSequence copyReplaceAll: $s with: $c.
	lowerBoundsSequence := lowerBoundsSequence copyReplaceAll: $w with: $t.
	lowerBoundsSequence := lowerBoundsSequence copyReplaceAll: $k with: $t.
	lowerBoundsSequence := lowerBoundsSequence copyReplaceAll: $m with: $c.
	lowerBoundsSequence := lowerBoundsSequence copyReplaceAll: $b with: $c.
	lowerBoundsSequence := lowerBoundsSequence copyReplaceAll: $d with: $t.
	lowerBoundsSequence := lowerBoundsSequence copyReplaceAll: $h with: $c.
	lowerBoundsSequence := lowerBoundsSequence copyReplaceAll: $v with: $c.
	lowerBoundsSequence := lowerBoundsSequence copyReplaceAll: $n with: $c.

	"replace all other degenerates with heaviest base possible in upperBoundsSequence"
	upperBoundsSequence := upperBoundsSequence copyReplaceAll: $r with: $g.
	upperBoundsSequence := upperBoundsSequence copyReplaceAll: $y with: $t.
	upperBoundsSequence := upperBoundsSequence copyReplaceAll: $s with: $g.
	upperBoundsSequence := upperBoundsSequence copyReplaceAll: $w with: $a.
	upperBoundsSequence := upperBoundsSequence copyReplaceAll: $k with: $g.
	upperBoundsSequence := upperBoundsSequence copyReplaceAll: $m with: $a.
	upperBoundsSequence := upperBoundsSequence copyReplaceAll: $b with: $g.
	upperBoundsSequence := upperBoundsSequence copyReplaceAll: $d with: $g.
	upperBoundsSequence := upperBoundsSequence copyReplaceAll: $h with: $a.
	upperBoundsSequence := upperBoundsSequence copyReplaceAll: $v with: $g.
	upperBoundsSequence := upperBoundsSequence copyReplaceAll: $n with: $g.

	^ { lowerBoundsSequence molecularWeightNonDegen . upperBoundsSequence molecularWeightNonDegen }

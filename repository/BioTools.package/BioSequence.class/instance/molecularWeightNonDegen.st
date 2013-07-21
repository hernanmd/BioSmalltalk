accessing
molecularWeightNonDegen

	| g a t c |
	
	g := self occurrencesOf: $g.
	a := self occurrencesOf: $a.
	t := self occurrencesOf: $t.
	c := self occurrencesOf: $c.
	^ (g * 329.21) + (a * 313.21) + (t * 304.2) + (c * 289.18) + 17.01.
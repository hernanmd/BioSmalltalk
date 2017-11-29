accessing
gcContent
	" Answer a <Number> representing the GC-content of a DNA string: the percentage of symbols in the string that are 'C' or 'G' "
	| cCount gCount |	
	cCount := 0.
	gCount := 0.
	self asString do: [ : each | 
		each asUppercase = $C 
			ifTrue: [ cCount := cCount + 1]
			ifFalse: [ each asUppercase = $G 
				ifTrue: [ gCount := gCount + 1 ] ] ].
	^ ((gCount + cCount / self size) * 100) round: 6
	

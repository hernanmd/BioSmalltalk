*BioTools
isNumeric
	" Answer whether the receiver is a Number "
	
	^ self matchesRegex: ('[+-]?[0-9]*\.?[0-9]+(e-?[0-9]+)?')
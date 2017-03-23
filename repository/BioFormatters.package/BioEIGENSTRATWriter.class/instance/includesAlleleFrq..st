private
includesAlleleFrq: aRow 
	" Private - Answer <true> if aRow is valid and contains allele frequency data "
	
	| locus |
	
	locus := aRow first.
	^ locus notNil and: [ locus first isLetter not ]
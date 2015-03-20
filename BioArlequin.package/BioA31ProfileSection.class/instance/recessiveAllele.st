getting configurations
recessiveAllele
	" Answer a String with the RecessiveAllele configuration "
	
	^ self at: self class recessiveAlleleId ifAbsent: [ '""' ]

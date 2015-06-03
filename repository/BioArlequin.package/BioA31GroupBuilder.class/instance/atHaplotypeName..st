accessing
atHaplotypeName: aString 
	" Answer a <String> "

	^ (self haplotypes 
		detect: [ : hap | hap name = aString ]
		ifNone: [ self error: 'Haplotype named ' , aString , ' not found' ]) sequence asString.
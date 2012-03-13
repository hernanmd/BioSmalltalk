accessing
writeOn: aStream delimiter: aDelimiterCharacter
	" Arlequin can handle RFLP haplotypes of arbitrary length. Each restriction site is 
	considered as a distinct locus. The presence of a restriction site should be coded as a '1', 
	and its absence as a '0'. The '-' character should be used to denote the deletion of a 
	site, not its absence due to a point mutation. "
	
	^ super writeOn: aStream delimiter: aDelimiterCharacter
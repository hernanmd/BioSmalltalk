accessing
buildSamplesAt: group
	" Private - Build the Arlequin samples from aDictionary "
	
	group associationsDo: [ : assoc |
		self buildSampleFrom: assoc ]
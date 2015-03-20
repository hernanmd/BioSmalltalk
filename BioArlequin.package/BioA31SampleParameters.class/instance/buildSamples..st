private
buildSamples: aDictionary
	" Private - Build the Arlequin samples from aDictionary "
	
	aDictionary associationsDo: [ : assoc |
		self buildSampleFrom: assoc ]
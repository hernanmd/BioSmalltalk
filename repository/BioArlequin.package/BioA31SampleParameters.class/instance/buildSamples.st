accessing
buildSamples
	" Private - Build the Arlequin samples from aDictionary "
	
	self groupSamples associationsDo: [ : assoc |
		self buildSampleFrom: assoc ]
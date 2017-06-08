converting
genotypesString
	" Answer the genotype information for the receiver as a <String> "
	
	^ String streamContents: [ : stream |
			stream
				nextPutAll: nil  ]
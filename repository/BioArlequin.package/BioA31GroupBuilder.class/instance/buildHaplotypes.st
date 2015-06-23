private
buildHaplotypes

	self haplotypesBag: (self data flatCollect: [ : keyValue | self buildHaplotype: keyValue value ]) asBag.
	

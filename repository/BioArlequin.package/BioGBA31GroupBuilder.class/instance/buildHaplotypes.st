private
buildHaplotypes

	self haplotypesBag: (self classifications flatCollect: [ : keyValue | self buildHaplotype: keyValue value ]) asBag.
	

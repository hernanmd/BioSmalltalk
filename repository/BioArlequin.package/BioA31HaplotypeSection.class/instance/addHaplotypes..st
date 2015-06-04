accessing
addHaplotypes: groupCollection
	
	self addSampleData: (groupCollection collect: [ : group |
		self 
			buildHaplotypesList: group data 
			title: group name ] )
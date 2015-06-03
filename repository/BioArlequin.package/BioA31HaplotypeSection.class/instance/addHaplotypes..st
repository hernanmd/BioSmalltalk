accessing
addHaplotypes: groupCollection
	" Set a value for the Title configuration "
	
	" aCollection addTo: ( self at: self haplotypeListNameId ) "
	self addSampleData: (groupCollection collect: [ : group |
		self 
			buildHaplotypesList: group data 
			title: group name ] )
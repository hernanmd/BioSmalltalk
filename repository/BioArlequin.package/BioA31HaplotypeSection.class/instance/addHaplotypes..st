accessing
addHaplotypes: groupCollection
	" Set a value for the Title configuration "
	
	" aCollection addTo: ( self at: self haplotypeListNameId ) "
	groupCollection do: [ : group |
		self 
			buildHaplotypesList: group data 
			title: group name ].	

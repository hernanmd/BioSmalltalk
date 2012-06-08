accessing filters
removeAllFilters
	" Remove all filters in the receiver. Answer the receiver "

	self filters removeAll.
	self queryFilters removeAll.
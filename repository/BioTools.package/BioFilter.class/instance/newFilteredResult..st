private
newFilteredResult: collection
	" Answer a new filtered result object with contents from collection.
	If collection is splitted in several sub-collections, then join them "
	
	^ BioFilteredResult new result: collection
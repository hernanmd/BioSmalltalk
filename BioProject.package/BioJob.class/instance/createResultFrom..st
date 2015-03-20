accessing private
createResultFrom: aString
	" Create and answer a new search result for aString "
	
	^ BioResultObject new
		project: self;
		result: aString;
		yourself
accessing private
createResultFrom: aString
	" Answer a new search result for aString "
	
	^ BioResultObject new
		project: self;
		result: aString;
		yourself
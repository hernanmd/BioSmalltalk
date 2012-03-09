initialize-release
parserForDbAccessionLocus

	^ self parserForGenBank | 
		self parserForEmbl |
		self parserForDdbj
initialization
initializeGraphers: aString 

	self graphers addAll: (self configureGraphers: aString)
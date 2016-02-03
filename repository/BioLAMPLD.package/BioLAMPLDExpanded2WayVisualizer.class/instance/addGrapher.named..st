accessing
addGrapher: aString named: title

	self graphers add: (self initializeGrapher: title)
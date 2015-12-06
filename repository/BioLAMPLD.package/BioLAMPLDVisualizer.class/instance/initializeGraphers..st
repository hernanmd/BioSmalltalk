initialization
initializeGraphers: aString 
	" Configure and add all graphers from aString data "

	self graphers addAll: (self configureGraphers: aString)
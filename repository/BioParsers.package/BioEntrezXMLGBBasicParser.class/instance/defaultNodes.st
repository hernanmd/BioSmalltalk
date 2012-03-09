accessing
defaultNodes
	" Add node names in your specific subclasses. Answer a Collection of Strings
	corresponding with the XML's DTD with the node names in which we are interested "

	^ super defaultNodes , self parserNodes
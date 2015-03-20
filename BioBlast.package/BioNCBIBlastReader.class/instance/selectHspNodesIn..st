private
selectHspNodesIn: anObject
	" Answer a BioBlastRootNode with HSP nodes parsed from anObject "

	self parsingStrategy ifNil: [ self setStAXParser ].
	^ BioParser perform: self parsingStrategy withArguments: {anObject . BioNCBIBlastReader hitNodesNames}
"^ BioParser saxParseNcbiXmlBlastNodes: anObject"
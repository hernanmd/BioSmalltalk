accessing
parseNodes: selectedNodes in: file

	self blastReader: ((BioNCBIBlastReader newFromXML: file contents)
					selectedNodes: (selectedNodes collect: #name);
					yourself).
	self blastReader filterFrom: self builder.
	^ self blastReader
	
	" (BioParser 
		saxParseNcbiXmlBlast: file contents
		nodes: (selectedNodes collect: #name))"
	"^ BioParser
		parseNcbiXmlBlast: file contents 
		nodes: (selectedNodes collect: #name)"
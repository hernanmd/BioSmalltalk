accessing
parseNodes: selectedNodes in: file

	^ BioParser 
		tokenizeNcbiXmlBlast: file contents
		nodes: (selectedNodes collect: #name)
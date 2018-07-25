accessing
saxParseBlastNodes: hitsSelector

	result := self parserClass saxParseNcbiXmlBlastNodes: (self perform: hitsSelector)
	
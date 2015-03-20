accessing
saxTokenizeBlastNodes: hitsSelector

	result := self parserClass saxTokenizeNcbiXmlBlastNodes: (self perform: hitsSelector)
	
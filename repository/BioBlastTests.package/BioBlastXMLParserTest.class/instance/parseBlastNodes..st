accessing
parseBlastNodes: hitsSelector

	result := self parserClass parseNcbiXmlBlastNodes: ( self perform: hitsSelector )
	
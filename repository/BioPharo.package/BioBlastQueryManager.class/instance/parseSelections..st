accessing
parseSelections: selectedNodes 

	self blastCollection collect: [: file | 
		self addParseResult: (self parseNodes: selectedNodes in: file)]
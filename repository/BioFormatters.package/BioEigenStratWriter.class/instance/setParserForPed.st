private
setParserForPed

	self parser: (self parserClass on: (BioObject openFullFileNamed: self pedFile)).
	self parser delimiter: Character tab.

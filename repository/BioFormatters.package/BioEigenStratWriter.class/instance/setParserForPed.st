private
setParserForPed

	self parser: (self parserClass on: (BioObject openFullFileNamed: self pedFile)).
	self parser separator: Character tab.
	^ self parser.

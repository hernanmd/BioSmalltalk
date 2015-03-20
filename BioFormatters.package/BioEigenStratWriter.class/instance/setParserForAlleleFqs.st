private
setParserForAlleleFqs

	self parser: (self parserClass on: (BioObject openFullFileNamed: self alleleFqs)).
	self parser 
		delimiter: $;;
		ignoreHeadersCount: 2.

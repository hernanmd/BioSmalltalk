private
setParserForAlleleFqs

	self parser: (self parserClass on: (BioObject openFullFileNamed: self alleleFqs)).
	self parser 
		reset;
		separator: $;.
	2 timesRepeat: [ self parser skipHeader ].

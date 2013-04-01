accessing-parsers
parserForAccession
	" Answer a parser for parsing exactly aCollection "

	| accessionCharacters accession versionNumber |
	accessionCharacters := self parserForPredicateWith: self specialFastaChars , {$.}.
	accession := accessionCharacters plus flatten.
	versionNumber := ($. asParser , #digit asParser plus flatten) optional.
	^ (accession , versionNumber) flatten ==> [ :a | (a subStrings: '.') asArray ]
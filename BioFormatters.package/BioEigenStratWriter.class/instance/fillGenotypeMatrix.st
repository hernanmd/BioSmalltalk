accessing
fillGenotypeMatrix
	| parserForPed |

	parserForPed := self setParserForPed.
	self genoMatrix: (self newGenotypeMatrix: parserForPed).
	self fillGenotypeMatrixFrom: parserForPed.
	^ self genoMatrix
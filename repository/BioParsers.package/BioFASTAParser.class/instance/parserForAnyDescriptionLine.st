accessing-parsers
parserForAnyDescriptionLine

	| separator token p |

	separator := $| asParser ==> [ : n | nil ].
	token := separator negate plus flatten.
	^ ( token separatedBy: separator ) ==> [ :nodes | ( nodes copyWithout: nil ) collect: #trimBoth ].
		
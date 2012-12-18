accessing-parsers
tokenizeDescriptionLine

	| separator token result |

	separator := $| asParser ==> [ : n | nil ].
	token := separator negate plus flatten.
	parser := ( token separatedBy: separator ) ==> [ :nodes | ( nodes copyWithout: nil ) collect: #trimBoth ].
	^ self parse: self expression
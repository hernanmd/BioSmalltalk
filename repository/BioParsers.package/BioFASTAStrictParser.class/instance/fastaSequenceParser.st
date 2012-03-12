initialize-release
fastaSequenceParser

	| separator token line seqParser newLine |

	newLine := Character cr asParser / Character lf asParser / #newline asParser.
	separator := $| asParser / newLine ==> [ : n | nil ].
	token := separator negate plus flatten.
	line := ( token separatedBy: separator ) ==> [ :nodes | ( nodes copyWithout: nil ) collect: #trimBoth ].
	^ ($> asParser , line ) ==> [: nodes | self buildSequence: nodes ].
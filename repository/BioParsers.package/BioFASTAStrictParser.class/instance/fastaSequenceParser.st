initialize-release
fastaSequenceParser

	| separator token line seqParser |

	separator := $| asParser / #newline asParser ==> [ : n | nil ].
	token := separator negate plus flatten.
	line := ( token separatedBy: separator ) ==> [ :nodes | ( nodes copyWithout: nil ) collect: #trimBoth ].
	^ ($> asParser , line ) ==> [: nodes | self buildSequence: nodes ].
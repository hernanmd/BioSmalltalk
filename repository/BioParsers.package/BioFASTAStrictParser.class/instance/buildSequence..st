initialize-release
buildSequence: nodes

	| seq seqString header |

	seq := nodes second select: #isBiologicalSequence.
	header := nodes second reject: #isBiologicalSequence.
	seqString := ( seq gather: [: each | each select: #isBiologicalSequence ] ) joinUsing: String empty.
	^ Array with: header with: seqString 
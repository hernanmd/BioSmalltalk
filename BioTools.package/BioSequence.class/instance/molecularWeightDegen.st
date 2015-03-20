accessing
molecularWeightDegen

	| lowerBoundsSequence upperBoundsSequence |
	
	lowerBoundsSequence := self asMutableSequence.
	upperBoundsSequence := self asMutableSequence.
	"replace all other degenerates with lightest base possible in lowerBoundsSequence"
	lowerBoundsSequence seq: (lowerBoundsSequence copyReplaceAll: 'r' with: 'a').
	lowerBoundsSequence seq: (lowerBoundsSequence copyReplaceAll: 'y' with: 'c').
	lowerBoundsSequence seq: (lowerBoundsSequence copyReplaceAll: 's' with: 'c').
	lowerBoundsSequence seq: (lowerBoundsSequence copyReplaceAll: 'w' with: 't').
	lowerBoundsSequence seq: (lowerBoundsSequence copyReplaceAll: 'k' with: 't').
	lowerBoundsSequence seq: (lowerBoundsSequence copyReplaceAll: 'm' with: 'c').
	lowerBoundsSequence seq: (lowerBoundsSequence copyReplaceAll: 'b' with: 'c').
	lowerBoundsSequence seq: (lowerBoundsSequence copyReplaceAll: 'd' with: 't').
	lowerBoundsSequence seq: (lowerBoundsSequence copyReplaceAll: 'h' with: 'c').
	lowerBoundsSequence seq: (lowerBoundsSequence copyReplaceAll: 'v' with: 'c').
	lowerBoundsSequence seq: (lowerBoundsSequence copyReplaceAll: 'n' with: 'c').

	"replace all other degenerates with heaviest base possible in upperBoundsSequence"
	upperBoundsSequence seq: (upperBoundsSequence copyReplaceAll: 'r' with: 'g').
	upperBoundsSequence seq: (upperBoundsSequence copyReplaceAll: 'y' with: 't').
	upperBoundsSequence seq: (upperBoundsSequence copyReplaceAll: 's' with: 'g').
	upperBoundsSequence seq: (upperBoundsSequence copyReplaceAll: 'w' with: 'a').
	upperBoundsSequence seq: (upperBoundsSequence copyReplaceAll: 'k' with: 'g').
	upperBoundsSequence seq: (upperBoundsSequence copyReplaceAll: 'm' with: 'a').
	upperBoundsSequence seq: (upperBoundsSequence copyReplaceAll: 'b' with: 'g').
	upperBoundsSequence seq: (upperBoundsSequence copyReplaceAll: 'd' with: 'g').
	upperBoundsSequence seq: (upperBoundsSequence copyReplaceAll: 'h' with: 'a').
	upperBoundsSequence seq: (upperBoundsSequence copyReplaceAll: 'v' with: 'g').
	upperBoundsSequence seq: (upperBoundsSequence copyReplaceAll: 'n' with: 'g').

	^ { lowerBoundsSequence molecularWeightNonDegen . upperBoundsSequence molecularWeightNonDegen }

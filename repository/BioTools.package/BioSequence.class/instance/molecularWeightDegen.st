accessing
molecularWeightDegen

	| lowerBoundsSequence upperBoundsSequence |
	
	lowerBoundsSequence := self asMutableSequence.
	upperBoundsSequence := self asMutableSequence.
	"replace all other degenerates with lightest base possible in lowerBoundsSequence"
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'r' with: 'a').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'y' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 's' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'w' with: 't').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'k' with: 't').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'm' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'b' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'd' with: 't').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'h' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'v' with: 'c').
	lowerBoundsSequence sequence: (lowerBoundsSequence copyReplaceAll: 'n' with: 'c').

	"replace all other degenerates with heaviest base possible in upperBoundsSequence"
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'r' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'y' with: 't').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 's' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'w' with: 'a').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'k' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'm' with: 'a').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'b' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'd' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'h' with: 'a').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'v' with: 'g').
	upperBoundsSequence sequence: (upperBoundsSequence copyReplaceAll: 'n' with: 'g').

	^ { lowerBoundsSequence molecularWeightNonDegen . upperBoundsSequence molecularWeightNonDegen }

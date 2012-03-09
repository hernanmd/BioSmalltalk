private
guessAlphabetThreshold
	" Answer a consensus Float for determining the alphabet type.
	This value currently follows BioPerl convention, guess DNA if % of ATGC is > this value.
	Override this method to work with a different threshold "
	
	^ 0.85
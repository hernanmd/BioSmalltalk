normalization
normalizeId: aString 

	^ (aString findTokens: $_) second copyUpTo: $..

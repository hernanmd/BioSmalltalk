private-algorithm
step5a
	cursor := string size - 1.
	(string last == $e and: 
			[string size > r2 
				or: [string size > r1 and: [self stemEndsWithConsonantVowelConsonant not]]]) 
		ifTrue: 
			[self removeSuffix.
			^nil]
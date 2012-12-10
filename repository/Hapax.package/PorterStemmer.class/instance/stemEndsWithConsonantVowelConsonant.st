private-algorithm
stemEndsWithConsonantVowelConsonant
	^cursor >= 3 and: 
			[('Yywx' includes: (string at: cursor)) not and: 
									[(self isConsonantAt: cursor) 
										and: [(self isVowelAt: cursor - 1) and: [self isConsonantAt: cursor - 2]]]]
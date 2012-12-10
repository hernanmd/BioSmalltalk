private-algorithm
step1c

	(((self endsWith: 'y') or: [self endsWith: 'Y']) and: [self stemIncludesVowel]) 
		ifTrue: [string at: string size put: $i]
private-algorithm
step1b
	"comment stating purpose of message"

	(self endsWith: 'eed') 
		ifTrue: 
			[cursor >= r1 ifTrue: [self setSuffix: 'ee'].
			^nil].
	(((self endsWith: 'ed') or: [self endsWith: 'ing']) 
		and: [self stemIncludesVowel]) 
			ifTrue: 
				[self removeSuffix.
				#(#(#at #ate) #(#bl #ble) #(#iz #ize)) do: 
						[:rule | 
						(self endsWith: (rule first)) 
							ifTrue: 
								[self setSuffix: (rule last).
								^nil]].
				cursor := string size.
				(self stemEndsWithDoubleConsonant and: 
						[(string at: cursor) ~~ $s 
							and: [(string at: cursor) ~~ $z and: [(string at: cursor) ~~ $l]]]) 
					ifTrue: 
						[string := string copyFrom: 1 to: string size - 1.
						^nil].
				(cursor = r1 and: [self stemEndsWithConsonantVowelConsonant]) 
					ifTrue: [self setSuffix: 'e']]
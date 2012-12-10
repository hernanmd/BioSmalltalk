private-algorithm
step4
	#(#ement #ance #ence #able #ible #ment) do: 
			[:rule | 
			(self endsWith: rule) 
				ifTrue: 
					[cursor >= r2 ifTrue: [self removeSuffix].
					^nil]].
	((self endsWith: 'ion') and: [cursor >= r2]) 
		ifTrue: 
			[(string at: cursor) == $s | ((string at: cursor) == $t) 
				ifTrue: 
					[self removeSuffix.
					^nil]].
	#(#ant #ent #ism #ate #iti #ous #ive #ize #al #er #ic #ou) do: 
			[:rule | 
			(self endsWith: rule) 
				ifTrue: 
					[cursor >= r2 ifTrue: [self removeSuffix].
					^nil]]
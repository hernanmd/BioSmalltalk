private-algorithm
preprocessing

	string := string copyReplaceAll: #¦ü with: #ss.
	2 to: string size - 1 do: [ :index |
		(((string at: index) == $u or: [ (string at: index) == $y ]) 
			and: [ (self isVowelAt: index - 1) 
			and: [ self isVowelAt: index + 1 ] ]) 
		ifTrue: [
			string at: index put: (string at: index) asUppercase.
		]
	]
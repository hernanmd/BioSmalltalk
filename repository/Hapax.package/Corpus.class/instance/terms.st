accessing
terms

	| all |
	all := Terms new.
	documents do: [ :each |
		all addAll: each ].
	^all
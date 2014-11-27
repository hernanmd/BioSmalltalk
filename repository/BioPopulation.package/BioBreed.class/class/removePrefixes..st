text-mining
removePrefixes: locString
	" Given locString including a space Character, remove any possible known location prefix.
	Answer locString without the prefix, if found "

	| tokenizedLocation |

	tokenizedLocation := locString findTokens: String space.
	tokenizedLocation removeAllSuchThat: [: tokString |
		self locationPrefixes includes: tokString ].
	^ tokenizedLocation joinUsing: String space.
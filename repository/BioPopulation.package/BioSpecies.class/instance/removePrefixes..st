querying
removePrefixes: loc

	| tokenizedLocation |

	tokenizedLocation := loc findTokens: String space.
	tokenizedLocation removeAllSuchThat: [: tokString |
		self locationPrefixes includes: tokString ].
	^ tokenizedLocation
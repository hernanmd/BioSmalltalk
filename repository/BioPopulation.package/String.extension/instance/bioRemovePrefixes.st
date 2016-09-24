*BioPopulation
bioRemovePrefixes

	| tokenizedLocation |

	tokenizedLocation := self findTokens: String space.
	tokenizedLocation removeAllSuchThat: [: tokString |
		self bioLocationPrefixes includes: tokString ].
	^ tokenizedLocation joinUsing: self class space.

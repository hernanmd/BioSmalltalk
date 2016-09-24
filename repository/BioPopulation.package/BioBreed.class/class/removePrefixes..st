accessing
removePrefixes: locString
	" Given locString including a space Character, remove any possible known location prefix.
	Answer locString without the prefix, if found "

	^ locString bioRemovePrefixes

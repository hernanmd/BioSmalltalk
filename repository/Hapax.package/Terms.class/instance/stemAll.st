removing
stemAll

	| newTerms |
	newTerms := Terms new: contents capacity.
	self withCountDo: [ :term :count |
		newTerms add: term stem withOccurrences: count ].
	self become: newTerms
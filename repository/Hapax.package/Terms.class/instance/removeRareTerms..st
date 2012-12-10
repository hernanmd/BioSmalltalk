removing
removeRareTerms: occurrence

	| newTerms |
	newTerms := Terms new: contents capacity.
	self withCountDo: [ :term :count |
		count > occurrence ifTrue: [
			newTerms add: term stem withOccurrences: count ]].
	self become: newTerms
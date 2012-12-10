private
checkInvariant

	^rows isCollection and: [
		(rows allSatisfy: [ :row | row isKindOf: self vectorSpecies ]) and: [
			(rows allSatisfy: [ :row | row size = self columnSize ])]]
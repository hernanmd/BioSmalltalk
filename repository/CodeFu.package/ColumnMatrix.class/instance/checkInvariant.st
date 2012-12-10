private
checkInvariant

	^columns isCollection and: [
		(columns allSatisfy: [ :vector | vector isKindOf: self vectorSpecies ]) and: [
			(columns allSatisfy: [ :vector | vector size = self rowSize ])]]
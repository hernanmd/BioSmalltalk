private
checkInvariant

	^partialColumns isCollection and: [
		(partialColumns allSatisfy: [ :vector | vector isKindOf: self vectorSpecies ]) and: [
			((1 to: self columnSize) allSatisfy: [ :index | (partialColumns at: index) size = index ])]]


	"(SymetricMatrix new: 10) checkInvariant"
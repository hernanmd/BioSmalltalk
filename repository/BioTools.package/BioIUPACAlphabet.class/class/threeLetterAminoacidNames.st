accessing
threeLetterAminoacidNames
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	^ ThreeLetterAminoacidNames
		ifNil: [ self initialize.
				ThreeLetterAminoacidNames ]	
accessing
oneLetterAminoacidNames
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	^ OneLetterAminoacidNames
		ifNil: [ self initialize.
				OneLetterAminoacidNames ]
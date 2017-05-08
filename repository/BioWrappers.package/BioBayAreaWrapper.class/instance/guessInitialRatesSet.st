options - analysis settings
guessInitialRatesSet
	" Use heuristic to initialize MCMC area loss/gain rates "

	self propertyAt: 'guessInitialRates' ifAbsentPut: [ 'T' ]

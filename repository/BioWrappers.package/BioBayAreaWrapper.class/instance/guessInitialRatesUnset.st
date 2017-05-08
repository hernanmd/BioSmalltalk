options - analysis settings
guessInitialRatesUnset
	" Do not use heuristic to initialize MCMC area loss/gain rates "

	self propertyAt: 'guessInitialRates' ifAbsentPut: [ 'F' ]

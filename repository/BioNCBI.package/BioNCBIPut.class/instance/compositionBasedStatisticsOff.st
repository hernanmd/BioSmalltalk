accessing
compositionBasedStatisticsOff
	" Do search with tweak parameter set to false "
	
	self clientUrl queryAt: 'COMPOSITION_BASED_STATISTICS' put: 'no'
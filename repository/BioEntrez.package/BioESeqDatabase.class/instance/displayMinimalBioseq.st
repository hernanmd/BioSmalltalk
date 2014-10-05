accessing
displayMinimalBioseq
	" get the minimal bioseq-set containing the gi of interest "
	
	self client queryAt: 'complexity' put: '2'
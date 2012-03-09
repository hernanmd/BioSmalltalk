accessing
collect: aBlock

	self needsWork. "Porque no funciona el #contents sobre el BlastReader cuando tiene ya filtros?"
	^ self result collect: aBlock
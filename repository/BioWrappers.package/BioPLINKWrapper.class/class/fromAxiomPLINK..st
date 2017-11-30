instance creation
fromAxiomPLINK: pedFilename
	" Set a new instance of the receiver configured for reading from PLINK files exported from Affymetrix Axiom Analysis Suite "
	
	^ self new
		initializeFromAxiomPLINK: pedFilename;
		yourself.
		
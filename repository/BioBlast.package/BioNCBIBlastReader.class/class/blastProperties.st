accessing-properties
blastProperties

	^ BlastProperties
		ifNil: [ self initializeBlastProperties. 
			BlastProperties ]
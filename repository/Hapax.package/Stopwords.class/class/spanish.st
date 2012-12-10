constants
spanish

	^ Spanish
		ifNil: [ 
			self initializeSpanishStopwords.
			Spanish ]
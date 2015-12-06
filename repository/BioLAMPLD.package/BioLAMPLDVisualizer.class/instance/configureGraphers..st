initialization
configureGraphers: aString 

	^ (self findDataPoints: aString lines) collect: [ : admixDataPoints |
			dataPoints := admixDataPoints.
			parsedDataPoints := self findBreakpoints 
				with: self findAlleleRefCount 
				collect: [ : bp : ac | bp @ ac ].
			self initializeGrapher ]
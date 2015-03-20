accessing
molecularWeight

	^ self sequence hasAmbiguousBases
		ifTrue: [ self sequence molecularWeightDegen ]
		ifFalse: [ self sequence molecularWeightNonDegen ]		
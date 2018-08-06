accessing
complementaryTable

	^ complementaryTable
		ifNil: [ 
			self initialize.
			self complementaryTable ]
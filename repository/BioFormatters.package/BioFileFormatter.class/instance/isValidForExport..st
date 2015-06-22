testing
isValidForExport: aCollection 
	" Answer <true> if aCollection is valid for exporting for the receiver "

	^ aCollection notNil and: [ aCollection notEmpty ]
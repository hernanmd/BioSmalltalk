testing
isValidForExport: aCollection 
	" Answer <true> if aCollection could be exported to a File "

	^ aCollection notNil and: [ aCollection notEmpty ]
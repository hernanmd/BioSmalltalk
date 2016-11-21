testing
isValidFile: aFilename
	" Answer <true> if aFilename is valid for the receiver "

	^ (super isValidFile: aFilename) and: [ aFilename endsWith: '.csv' ]
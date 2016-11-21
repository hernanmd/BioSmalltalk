testing
isValidFile: aFilename
	" Answer <true> if aFilename is valid for the receiver "

	^ aFilename notNil and: [ aFilename notEmpty ]
accessing
tokenizeParameters
	" Answer a <Collection> with each item being a receiver's parameter "

	^ self client downloadUrl substrings: '&'
accessing
request: aString
	" Request and answer the string the user accepts. Answer an empty string if the user cancels."

	^ self adapterClass
		request: aString
		yourself
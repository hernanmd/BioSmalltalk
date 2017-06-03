accessing - info
info: aString
	" Set a <String> with additional information:  (String, no white-space, semi-colons, or equals-signs permitted;  commas are permitted only as delimiters for lists of values) INFO fields are encoded as a semicolon-separated series of short keys with optional values in the format: <key> = <data>[,data].  Arbitrary keys are permitted "

	self deny: (aString includesAnyOf: ' ;=').
	infoStream := WriteStream on: aString
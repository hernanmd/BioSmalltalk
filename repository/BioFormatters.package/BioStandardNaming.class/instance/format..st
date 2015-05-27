accessing
format: aString
	" See superimplementor's comment "

	^ aString asString trimBoth copyReplaceAll: ' ' with: '_'

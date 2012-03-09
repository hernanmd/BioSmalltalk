accessing
queryKey: aKeyString
	" Append aKeyString for setting the remote query key "

	aKeyString isEmpty
		ifFalse: [ self addParameters: '&query_key=' , aKeyString ]
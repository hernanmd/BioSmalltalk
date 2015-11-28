exceptions
signalDuplicateObject: errorString
	" Raise an exception with errorString as description. This message should be sent when a duplicate is found in any context "
	
	^ self class signalDuplicateObject: errorString
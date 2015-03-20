exceptions
signalNotFound: errorString
	" Raise an exception with errorString as description. This message should be sent when a requested resource is not available "

	^ BioNotFoundObject new signal: errorString
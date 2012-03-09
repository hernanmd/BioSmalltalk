exceptions
signalInvalidObject: errorString
	" Raise an exception with errorString as description. This message should be sent when
	general unexpected or unwanted behavoir is found. For example :
	- Empty results
	- Invalid parameters
	- Limits were reached
	" 
	
	^ self class signalInvalidObject: errorString
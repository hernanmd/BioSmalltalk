instance creation
openOn: aString
	" Answer a new instance with aString as receiver's data points "

	^ self new 
		initializeDataPoints: aString;
		open
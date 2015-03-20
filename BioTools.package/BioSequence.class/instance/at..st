accessing
at: anInteger
	" Access the receiver's element at anInteger position "
	
	^ seq at: anInteger
		ifAbsent: [ self signalInvalidObject: 'Out of range exception' ]
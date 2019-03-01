accessing
indexOfFieldNamed:fieldName
	" Given fieldName answer a <Number> representing the position in the receiver's TXT file "
	
	^ self header indexOf: fieldName
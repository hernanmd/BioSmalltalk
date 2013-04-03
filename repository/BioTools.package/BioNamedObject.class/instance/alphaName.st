accessing
alphaName
	" Answer the first receiver's name which is alphabetic. If not found answer the receiver's null name  "
	
	^ self names 
			detect: [ : aName | aName isString and: [ aName isAllDigits not ] ]
			ifNone: [ self nullName ]
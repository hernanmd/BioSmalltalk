accessing
numericName
	" Answer the first receiver's name which is numeric. If not found answer the receiver's null name  "
	
	^ self names 
			detect: [ : aName | aName isNumber or: [ aName isNumeric ] ]
			ifNone: [ self nullName ]
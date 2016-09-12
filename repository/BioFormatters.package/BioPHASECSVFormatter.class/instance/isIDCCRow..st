accessing
isIDCCRow: row
	" Answer <true> if row is used for identifying individuals and/or case/control status "
	
	^ row first beginsWith: '#' or: [ row second notNil and: [ row second beginsWith: '#' ] ]

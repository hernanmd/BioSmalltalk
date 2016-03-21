accessing properties
hasProperty: keyName
	" Answer <true> if property keyName is present. "
	
	^ properties notNil and: [ properties includesKey: keyName ]
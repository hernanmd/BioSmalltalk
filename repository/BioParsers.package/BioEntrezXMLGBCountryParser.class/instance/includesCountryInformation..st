testing
includesCountryInformation: aString
	" Answer <true> if the current node and aString are the proper combination
	matching country information, and set the receiver for catching the value in #characters:  "
	
	^ ( current = 'GBQualifier_name' and: [ aString asLowercase = 'country' ] )
			ifTrue: [ 
				self catchCountryOn.
				true ]
			ifFalse: [ false ]
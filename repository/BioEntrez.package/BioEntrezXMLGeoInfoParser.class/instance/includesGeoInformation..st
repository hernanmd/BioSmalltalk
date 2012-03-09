accessing
includesGeoInformation: aString
	" Answer <true> if aString includes territorial information abour the current node "

	( self includesCountryInformation: aString )
		ifTrue: [ ^ false ].
	catchCountry
		ifTrue: [
			self catchCountryOff.
			" Esto es porque el GBQualifier_value con el country era 'tapado' por el de breed: "
			current := 'GBQualifier_country'.			
			^ true ].
	^ current = 'GBQualifier_value' and: [ aString beginsWith: 'breed:' ]
	
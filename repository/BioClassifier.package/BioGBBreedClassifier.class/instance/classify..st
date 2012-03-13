accessing
classify: aSubject
	" Answer <true> if aSubject can be classified in the receiver's organization "

	self subject: aSubject.
	^ self hasCountry
		ifTrue: [ self classifyByCountryQualifier ]
		ifFalse: [ self classifyByDemonymQualifier ]
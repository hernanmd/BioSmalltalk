accessing
softwareVersion
	" Answer a <String> representing the receiver's version "

	^ softwareVersion
		ifNil: [ softwareVersion := 'Unknown Version' ]
accessing
classFor: aString
	" Answer a class which identifies aString "
	
	^ self withAllSubclasses 
		detect: [ : cls | cls identifier = aString ]
		ifNone: [ nil ]
		
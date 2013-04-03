instance creation
for: aString
	" Private - Answer a Class which is the preferred one for reading aString "

	^ self allSubclasses 
		detect: [ : cls | cls isPreferredFor: aString ]
		ifNone: [ self error: 'No preferred readers found' translated ]
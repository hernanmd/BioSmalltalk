accessing
oneLetterAminoacidNames

	^ OneLetterAminoacidNames
		ifNil: [ self initialize.
				OneLetterAminoacidNames ]
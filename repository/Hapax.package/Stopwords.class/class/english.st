constants
english

	^ English
		ifNil: [ self initializeEnglishStopwords.
			English ]
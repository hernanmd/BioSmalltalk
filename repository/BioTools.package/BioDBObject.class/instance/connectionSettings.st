accessing
connectionSettings

	^ connectionSettings
		ifNil: [ connectionSettings := BioConnectionSettings new ]
accessing
email

	^ email
		ifNil: [ email := 'invalid@invalid.com' ]
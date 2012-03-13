accessing
nameFormatter

	^ self formatters detect: [: f | f isNamingFormat ]
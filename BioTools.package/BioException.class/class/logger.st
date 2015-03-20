accessing
logger

	^ Logger
		ifNil: [ Logger := Set new ]
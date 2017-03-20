accessing
parameters

	^ parameters
		ifNil: [ parameters := self defaultParametersCollector ]
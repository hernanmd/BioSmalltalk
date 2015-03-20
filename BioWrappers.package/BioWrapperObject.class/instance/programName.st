accessing
programName

	^ programName
		ifNil: [ programName := self defaultProgramName ]
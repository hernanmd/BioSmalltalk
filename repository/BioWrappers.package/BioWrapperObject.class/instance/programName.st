accessing
programName

	^ programName
		ifNil: [ programName := self execNameFor: self defaultProgramName ]
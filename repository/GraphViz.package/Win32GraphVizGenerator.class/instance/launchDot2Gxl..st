external
launchDot2Gxl: inputFile

	| xmlFile |
	xmlFile := self outputFileNameFor: #xml.
	self
		runOSProcess: 'dot2gxl' 
		with: ('-o "', xmlFile, '" "', inputFile, '"').
		
	^ xmlFile
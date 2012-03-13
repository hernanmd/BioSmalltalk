creation
createXMLDocument

	| file parser xml |
	file := self make: #dot.
	
	file := self 
		do: [self launchDot2Gxl: file]
		blockUntilFileUpdated: (self outputFileNameFor: #xml)
		waitingNoMoreThan: self durationToWaitForGenerating.

	parser := Smalltalk at: #XMLDOMParser ifAbsent: [nil].
	xml := FileStream readOnlyFileNamed: file.
	^ [parser
		ifNil: [xml contents]
		ifNotNil: [parser parseDocumentFrom: xml]] ensure: [xml close. self cleanUpIntermediateFilesAsAppropriate]
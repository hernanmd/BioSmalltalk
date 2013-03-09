accessing
parsedContents
	" Answer a <BioFilteredObject> "

	| rs |
	^ (rs := self results contents) isXML
		ifTrue: [ BioParser saxParseNcbiXmlBlastNodes: rs contents ]
		ifFalse: [ rs ]
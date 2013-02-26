accessing
parsedContents
	" Answer a <BioFilteredObject> "

	| rs |
	rs := self results.
	^ rs contents "isBioCollection
		ifFalse: [ BioParser saxParseNcbiXmlBlastNodes: rs contents ]
		ifTrue: [ rs contents ]"
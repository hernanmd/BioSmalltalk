accessing
parsedContents
	" Answer the parsed object resulting from the receiver's contents using the receiver's parser "

	| rs |
	rs := self results.
	^ rs contents isBioCollection
		ifFalse: [ BioParser saxParseNcbiXmlBlastNodes: rs contents ]
		ifTrue: [ rs contents ]
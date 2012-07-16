accessing
parsedContents
	" Answer the parsed object resulting from the receiver's contents using the receiver's parser "

	^ self results isNil
		ifFalse: [ 
			| rs |
			rs := self results.
			rs contents isBioCollection
				ifFalse: [ BioParser parseNcbiXmlBlastNodes: rs contents ]
				ifTrue: [ rs contents ] ]
		ifTrue: [ Array empty ]
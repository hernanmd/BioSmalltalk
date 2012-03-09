accessing
parsedContents
	" Answer the parsed object resulting from the receiver's contents using the receiver's parser "

	^ self results contents isBioCollection
		ifFalse: [ BioParser tokenizeNcbiXmlEntrezSearchResult: self results contents ]
		ifTrue: [ self results contents ]
accessing
searchResults

	^ results
		ifNil: [ results := self parsedContents ]
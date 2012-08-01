accessing
searchResults

	( results isNil or: [ results isEmpty ] )
		ifTrue: [ results := self parsedContents ].
	^ results
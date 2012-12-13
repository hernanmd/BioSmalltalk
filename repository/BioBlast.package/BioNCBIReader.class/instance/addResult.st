accessing filters
addResult
	" Add a new result object to the receiver from the receiver's raw contents "

	| newResult |
	
	newResult := ( self resultClass new reader: self ) result: self parsedContents.
	( self searchResults includes: newResult )
		ifFalse: [ self searchResults add: newResult ].
	^ newResult
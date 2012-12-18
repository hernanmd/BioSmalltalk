accessing filters
addResult
	" Add a new result object to the receiver from the receiver's raw contents "

	| newResult |
	
	newResult := ( self resultClass new reader: self ) result: self parsedContents.
	results ifNil: [ results := OrderedCollection new].
	(results includes: newResult)
		ifFalse: [ results add: newResult ].
	^newResult
accessing
saveFilterContents
	" Private - Save receiver's contents if appropriate "

	| downloadStatus dir |
	downloadStatus := false.
	(contents notEmpty and: [ (dir := self requestDirectoryPath) notNil ])
		ifTrue: [ 
			self saveSplittedSearchResults: dir.
			self checkValidContents ifTrue: [ downloadStatus := true ] ]
		ifFalse: [ self error: 'Save cancelled' ].
	^ downloadStatus
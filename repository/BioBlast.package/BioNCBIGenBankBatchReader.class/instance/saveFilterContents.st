accessing
saveFilterContents
	" Private - Save receiver's contents if appropriate "

	| downloadStatus  |
	downloadStatus := false.
	contents notEmpty
		ifTrue: [ 
			self saveSearchResults: self entrezSearchResults.
			self checkValidContents ifTrue: [ downloadStatus := true ] ]
		ifFalse: [ self error: 'Save cancelled' ].
	^ downloadStatus
accessing
saveFilterContents
	" Private - Save receiver's contents if appropriate "

	| downloadStatus dir |
	
	downloadStatus := false.
	(contents isEmpty not and: [ (dir := self requestDirectoryPath) notNil ])
		ifTrue: [ 
			self entrezSearchResults doWithIndex: [: bioESearchResult : index |
				| fileName |
				fileName := self formatFilename: dir index: index.
				self outputToFullFile: fileName contents: bioESearchResult  ].
			downloadStatus := true ]
		ifFalse: [ self error: 'No contents or invalid directory path' ].
	^ downloadStatus
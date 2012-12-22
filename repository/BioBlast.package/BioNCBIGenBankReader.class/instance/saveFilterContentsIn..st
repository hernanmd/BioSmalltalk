accessing
saveFilterContentsIn: aPath
	" Private - Save receiver's contents if appropriate "

	| downloadStatus dir |
	
	downloadStatus := false.
	(contents isEmpty not and: [ aPath isNil not ])
		ifTrue: [ 
			self createDirectory: self workingDirectory , self fileDirectoryClass slash , aPath.
			self entrezSearchResults doWithIndex: [: bioESearchResult : index |
				| fileName |
				fileName := String streamContents: [: stream | 
					stream 
						nextPutAll: aPath;
						nextPutAll: self fileDirectoryClass slash;
						nextPutAll: index asString;
						nextPutAll:  '.xml' ].
				self 
					outputToFullFile: fileName
					contents: bioESearchResult  ].
			downloadStatus := true ].
	^ 	downloadStatus
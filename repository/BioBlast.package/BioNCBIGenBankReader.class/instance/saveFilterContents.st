accessing
saveFilterContents
	" Private - Save receiver's contents if appropriate "

	| downloadStatus |
	
	downloadStatus := false.
	( contents isEmpty and: [ self saveContents ] )
		ifFalse: [
			| dir | 
			( dir := self requestDirectoryPath ) isNil not
				ifTrue: [ 
					self entrezSearchResults doWithIndex: [: bioESearchResult : index |
						| fileName |
						fileName := String streamContents: [: stream | 
							stream 
								nextPutAll: dir fullName;
								nextPutAll: self fileDirectoryClass slash;
								nextPutAll: index asString;
								nextPutAll:  '.xml' ].
						self 
							outputToFullFile: fileName
							contents: bioESearchResult  ].
					downloadStatus := true ] ].
	^ 	downloadStatus
accessing
saveFilterContents
	" Private - Save receiver's contents if appropriate "

	( contents isEmpty and: [ self saveContents ] )
		ifFalse: [ 
			( self confirm: 'GenBank results are ' , self resultSizeInMb asString , ' Mbytes, do you want to save them for future usage?' )
				ifTrue: [ 
					self entrezSearchResults doWithIndex: [: bioESearchResult : index |
						self 
							outputToFile: index asString , '.xml'
							contents: bioESearchResult  ] ] ].
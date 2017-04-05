private
findPositionsFileIn: aDirectory
	" Answer a <String> with the file name of the positions file (.pos). If none found, raise an Error "

	^ (aDirectory asFileReference allChildrenMatching: '*.pos')
		ifEmpty: [ self	error: 'No positions file (.pos) were found in the directory : ' , aDirectory ]
		ifNotEmpty: [ :found | found ]
as yet unclassified
outputPathForCommandLine

	| path |
	path := self outputPath
		copyReplaceAll: ':'
		with: '/'.
	path := path
		copyReplaceAll: ' '
		with: '\ '.
	(path endsWith: '/') ifFalse: [path := path, '/'].
	
	^ '/Volumes/', path

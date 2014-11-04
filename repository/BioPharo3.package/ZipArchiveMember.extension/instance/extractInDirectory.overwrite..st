*BioPharo3
extractInDirectory: aDirectory overwrite: overwriteAll
	"Extract this entry into the given directory. Answer #okay, #failed, #abort, or #retryWithOverwrite."
	| path fileDir file  localName |
	path := fileName findTokens: '/'.
	localName := path last.
	fileDir := path allButLast inject: aDirectory into: [ :base :part | base / part ].
	fileDir ensureCreateDirectory.
	file := fileDir / localName.
	file exists ifTrue: [ ^ self class fileExistsBehavior ].
	file writeStreamDo: [ : str | self extractTo: str ].
	^ #okay
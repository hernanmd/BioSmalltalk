filesystem
outputToFullFile: nameString contents: contentsString
	" Outputs contentsString to a file named nameString "

	self class dumpToFileNamedFullPath: nameString contents: contentsString
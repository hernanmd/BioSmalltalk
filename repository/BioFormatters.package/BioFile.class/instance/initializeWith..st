initialize-release
initializeWith: aFilePathOrFileStream
	" Private - Check and open aFilePathOrFileStream "

	| fStream |
	
	( fStream := aFilePathOrFileStream ) isStream
		ifFalse: [ fStream := self openFullFileNamed: aFilePathOrFileStream ].
	self stream: fStream.
	self name: fStream name
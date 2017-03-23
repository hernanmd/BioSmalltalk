accessing
cwd
	" Answer a <String> representing the Current working directory "

	^ cwd
		ifNil: [ cwd := self defaultCwd ]
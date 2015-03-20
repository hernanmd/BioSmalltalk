filesystem
openFileNamed: fileName
	" Answer a FileStream for fileName. Assume the file exists "

	^ self class openFileNamed: fileName
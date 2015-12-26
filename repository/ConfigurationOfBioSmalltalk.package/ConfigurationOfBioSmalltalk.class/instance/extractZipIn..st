doits
extractZipIn: targetPath
	" If fileRef is a ZIP archive, uncompress its contents in targetPath and delete it "

	(fileRef fullName endsWithSubCollection: '.zip')
		ifFalse: [ ^ self ].
	self unZip: targetPath.
	fileRef delete
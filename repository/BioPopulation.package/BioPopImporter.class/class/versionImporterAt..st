initialize-release
versionImporterAt: aString
	" Answer a Class suitable for importing aString "

	^ self allSubclasses detect: [: cls | cls importsVersionAt: aString ]
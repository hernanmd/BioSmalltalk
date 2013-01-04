initialize-release
versionImporterAt: aString

	^ self allSubclasses detect: [: cls | cls importsVersionAt: aString ]
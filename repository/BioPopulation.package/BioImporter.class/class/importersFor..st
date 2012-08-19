initialize-release
importersFor: aString

	^ self allSubclasses select: [: cls | cls imports: aString ]
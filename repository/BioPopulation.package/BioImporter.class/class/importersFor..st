initialize-release
importersFor: aString

	^ self allFinalClasses select: [: cls | cls imports: aString ]
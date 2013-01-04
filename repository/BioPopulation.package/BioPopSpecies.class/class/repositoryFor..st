accessing
repositoryFor: aString

	^ self allSubclasses select: [: cls | cls descriptionIncludes: aString ]
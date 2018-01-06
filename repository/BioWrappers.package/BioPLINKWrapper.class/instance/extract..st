properties - filtering
extract: aFilename
	" Removes all unlisted variants from the current dataset using aFilename (usually one variant ID per line, but it's okay for them to just be separated by spaces). "

	self propertyAt: 'extract' ifAbsentPut: [ self buildPath: aFilename ]
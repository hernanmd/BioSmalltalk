accessing
outputFileNameFor: extension

	^ self outputFileDirectory fullPathFor: (self baseFileName, '.', extension)
options
positionsFileIn: basesDivider
	" Convert receiver's positions file name to basesDivider (megabases or kilobases) "

	| outPosFile outputFilename baseDir baseFilename baseExtension fileRef extendedFilename |
	
	fileRef := self positionsFileName asFileReference.
	baseDir := fileRef parent pathString , self slash.
	baseFilename := fileRef basenameWithoutExtension.
	baseExtension := fileRef extension.
	extendedFilename := '_' ,  basesDivider asString.
	outputFilename := baseDir , baseFilename , extendedFilename , '.' , baseExtension.
	
	outPosFile := outputFilename asFileReference writeStream.
	[ fileRef contents lines 
		collect: [ : line | 
			outPosFile 
				nextPutAll: (line asNumber // basesDivider) asString;
				nextPutTerminator ] ]
	ensure: [ outPosFile close ]
options
positionsFileIn: basesDivider
	" Convert receiver's positions file name to basesDivider (megabases or kilobases) "

	| outPosFile outputFileName |
	outputFileName := basesDivider asString ,  '_' , self positionsFileName.
	outPosFile := outputFileName asFileReference writeStream.
	[ self positionsFileName asFileReference contents lines 
		collect: [ : line | 
			outPosFile 
				nextPutAll: (line asNumber // basesDivider) asString;
				nextPutTerminator ] ]
	ensure: [ outPosFile close ]
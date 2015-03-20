exporting
outputFilename
	" Private - Answer a String file name for the output "

	^ outputFilename
		ifNil: [ outputFilename := self fileNamePrefix , 
						Time totalSeconds asString ,
						'.' , self formatExtension ]

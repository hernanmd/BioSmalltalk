*BioPharo4
openFileNamed: fileName
	" Answer a <FileStream> for fileName in the image directory. Assume the file exists "
	
	^ fileName 
		ifNotNil: [ fileName asFileReference readStream ]
		ifNil: [ self signalInvalidObject: 'Please specify a file' translated ]
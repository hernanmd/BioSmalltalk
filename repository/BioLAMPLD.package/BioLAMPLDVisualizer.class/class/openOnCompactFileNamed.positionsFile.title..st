instance creation
openOnCompactFileNamed: outFilename positionsFile: posFilename title: aString
	" Open the receiver using outFilename as input and set aString as visualization legend title "

	^ self new 
		initialize: outFilename;
		posFile: posFilename;
		name: aString;
		open;
		yourself
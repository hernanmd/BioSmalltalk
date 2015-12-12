instance creation
openOnFileNamed: outFilename title: aString
	" Open the receiver using outFilename as input and set aString as visualization legend title "

	^ self new 
		initialize: outFilename;
		name: aString;
		open;
		yourself
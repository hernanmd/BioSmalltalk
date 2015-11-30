instance creation
openOnDirectory: aString
	" Create a visualization for each file contained in aString. All files must be in LAMP-LD output format "
	
	^ aString asFileReference entries 
		collect: [ : fname | self openOnFileNamed: fname ]
instance creation
dumpOnDirectory: aString
	" Create a visualization for each file contained in aString. All files must be in LAMP-LD output format "
	
	^ aString asFileReference entries 
		collect: [ : fname | self openOnFileNamed: fname fullName ]
		thenDo: [ : v | 
				RTPNGExporter new 
					builder: v grapher view view;
					fileName: v name , '.png';
					exportToFile. ]
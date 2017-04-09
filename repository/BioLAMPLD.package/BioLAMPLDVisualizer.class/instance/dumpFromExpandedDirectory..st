printing
dumpFromExpandedDirectory: aString
	" Create a stacked visualization for each file contained in aString. All files must be in LAMP-LD output format "

	| fileEntries |
	
	fileEntries := aString asFileReference entries.
	(fileEntries select: [ : fileEntry | self possibleExpandedExtensions includes: fileEntry extension ])
		collect: [ : fileEntry |  
			self copy
				name: 'plot_' , fileEntry basename;
				readExpanded: fileEntry fullName; 
				yourself ]
		thenDo: [ : v | 
			v grapher inspect.
			self halt.
			RTPNGExporter new 
				builder: v grapher view;
				fileName: v name , '.png';
				exportToFile. ]

	
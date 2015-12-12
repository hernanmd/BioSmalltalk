instance creation
openOnDirectory: aString
	" Create a visualization for each file contained in aString. All files must be in LAMP-LD output format "

	^ [ :job | 
	| index |
	index := 0.
	job title: 'Starting.'.
	aString asFileReference entries
		collect: [ :fileEntry | self openOnFileNamed: fileEntry fullName title: fileEntry fullName ]
		thenDo: [ :fileEntry | 
			index := index + 1.
			JobProgress
				progress: 0.1 * index;
				title: 'Procesing.' , index asString ] ] asJob run
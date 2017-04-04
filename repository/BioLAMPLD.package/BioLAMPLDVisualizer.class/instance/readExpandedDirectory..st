instance creation
readExpandedDirectory: aString
	" Create a stacked visualization for each file contained in aString. All files must be in LAMP-LD output format "

	aString asFileReference entries
		collect: [ :fileEntry |  self readExpanded: fileEntry fullName; yourself ].

	
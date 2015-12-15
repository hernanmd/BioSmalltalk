instance creation
openStackedOnDirectory: aString
	" Create a stacked visualization for each file contained in aString. All files must be in LAMP-LD output format "
	| lampdVis |
	
	lampdVis := self new.
	aString asFileReference entries
		collect: [ :fileEntry | lampdVis initialize: fileEntry fullName; yourself ].
	^ lampdVis openStacked
	
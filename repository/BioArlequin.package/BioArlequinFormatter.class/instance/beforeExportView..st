private
beforeExportView: anObject
	
	^ self isPhyloclassTalk
		ifTrue: [ self beforeExportViewPhyloclassTalk: anObject ]
		ifFalse: [ self beforeExportViewBioSmalltalk: anObject ]
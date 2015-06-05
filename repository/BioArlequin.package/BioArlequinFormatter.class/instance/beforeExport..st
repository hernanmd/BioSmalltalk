private
beforeExport: aPCTView
	" See superimplementor's comment "

	aPCTView hasQuerySequence ifFalse: [ 
		^ self beforeExportView: aPCTView ].
	^ true

private
beforeExportView: aPCTView
	
	^ self isPhyloclassTalk
		ifTrue: [ 
			(Smalltalk at: #PCTArlequinSequenceInput) openDialogWithOwner: aPCTView.
			aPCTView querySequence isEmpty ]
		ifFalse: [ 
			self beforeExportViewBioSmalltalk: aPCTView ]
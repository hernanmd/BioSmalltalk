accessing
openOutputSelectorWindow 
	" Private - Answer a <Collection> with selections for the resulting output "
	
	| resSelectorWnd |
	
	resSelectorWnd := BioBlastResultsSelector new blastResultOptions: self blastReader.
	resSelectorWnd open.
	^ resSelectorWnd selection isNil
		ifFalse: [ resSelectorWnd selection selectedItems ]
		ifTrue: [ Array empty ]
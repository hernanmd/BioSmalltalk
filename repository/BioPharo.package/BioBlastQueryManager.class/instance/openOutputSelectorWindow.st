accessing
openOutputSelectorWindow 

	| resSelectorWnd |
	
	resSelectorWnd := BioBlastResultsSelector new blastResultOptions: self blastResult.
	resSelectorWnd open.
	^ resSelectorWnd selection selectedItems
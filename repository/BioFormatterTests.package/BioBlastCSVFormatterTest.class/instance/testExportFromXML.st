testing
testExportFromXML

	| formattingResults |
	
	self needsWork.
	formattingResults := self formatter fromXML: BioNCBITests resultBlastnDNA01.
	self assert: ( formattingResults isKindOf: String ).
	self deny: formattingResults isEmpty.
	
testing
testFormatterFor

	self assert: ((BioFileFormatter formatterFor: 'fasta') isKindOf: BioFASTAFormatter).
	self assert: ((BioFileFormatter formatterFor: 'CSV') isKindOf: BioCSVFormatter).
	self assert: ((BioFileFormatter formatterFor: 'csv') isKindOf: BioCSVFormatter).
	self assert: ((BioFileFormatter formatterFor: 'Comma Separated Values') isKindOf: BioCSVFormatter).
	
	self assert: ((BioFileFormatter formatterFor: 'BlastReportCSV') isKindOf: BioBlastCSVFormatter).
	self assert: ((BioFileFormatter formatterFor: 'xml') isKindOf: BioXMLFormatter).
	self assert: ((BioFileFormatter formatterFor: 'XML') isKindOf: BioXMLFormatter).
	self assert: ((BioFileFormatter formatterFor: 'HaploView') isKindOf: BioHaploViewFormatter).
	
	self should: [BioFileFormatter formatterFor: String empty] raise: Error.
	self should: [BioFileFormatter formatterFor: nil] raise: Error.	
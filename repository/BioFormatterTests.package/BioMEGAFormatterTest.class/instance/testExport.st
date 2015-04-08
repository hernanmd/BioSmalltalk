tests-exporting
testExport

	| results |
	self formatter: self formatterClass forDataTypeDNA.
	self formatter alignments: self testDataSet01.
	results := self formatter export.
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter outputFilename notNil.
	self assert: (BioObject fileExists: self formatter outputFilename).
	BioObject removeFileNamed: self formatter outputFilename.


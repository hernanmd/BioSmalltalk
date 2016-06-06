report
extractFromRecord: record position: aNumber

	(record at: aNumber) 
		ifNil: [ self csvWriter writeField: '--' ] 
		ifNotNilDo: [ : recordValue | self csvWriter writeField: recordValue trimBoth ].
	self csvWriter writeSeparator.

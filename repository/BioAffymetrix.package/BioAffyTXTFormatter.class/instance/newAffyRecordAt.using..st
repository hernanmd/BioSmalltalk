accessing
newAffyRecordAt: row using: indexes

	| chr pos |
	chr := (row at: indexes second)
		ifNil: [ 0 ]
		ifNotNil: [ : c | c  ].
	pos := (row at: indexes third)
		ifNil: [ 0 ]
		ifNotNil: [ : p | p  ].
	^ BioAffyTXTReducedRecord new
		id: (row at: indexes first);
		chr: chr asNumber;
		position: pos asNumber;
		yourself
	
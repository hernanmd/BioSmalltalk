accessing
newAffyRecordAt: row

	| chr pos |
	chr := (row at: row size - 2)
		ifNil: [ 0 ]
		ifNotNil: [ : c | c  ].
	pos := (row at: row size - 1)
		ifNil: [ 0 ]
		ifNotNil: [ : p | p  ].
	^ BioAffyProbeSetRecord new
		id: (row at: 1);
		chr: chr asNumber;
		position: pos asNumber;
		markers: ((row copyFrom: 2 to: row size - 3) joinUsing: Character tab);
		yourself
	
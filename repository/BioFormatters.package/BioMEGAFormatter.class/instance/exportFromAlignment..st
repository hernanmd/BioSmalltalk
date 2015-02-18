exporting
exportFromAlignment: aBioAlignment

	| records |
	
	records := aBioAlignment collect: [ : assoc | self exportGroup: assoc ] .
	longestNameCount := records max: [ : megaRecordsGroup | megaRecordsGroup max: [ : mr | mr name size ] ].
	[ self isAlignmentEmpty: records ]
		whileFalse: [ self exportMegaRecords: records ]
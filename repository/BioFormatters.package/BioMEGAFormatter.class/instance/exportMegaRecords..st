exporting
exportMegaRecords: aCollection
	" Iterate over aCollection and write results into the receiver's stream "

	aCollection do: [ : megaRecordsGroup | 
			megaRecordsGroup
				keysAndValuesDo: [ :index :mr | 
					mr
						exportTo: self stream
						nameSpacing: longestNameCount
						alignmentNumber: index ] ].
	self stream cr
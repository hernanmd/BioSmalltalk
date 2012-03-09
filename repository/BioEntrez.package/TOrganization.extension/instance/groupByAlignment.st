*bioentrez
groupByAlignment

	^ self -> ( self classifications groupedBy: [: d | d at: 'GBSeq_alignment' ] )
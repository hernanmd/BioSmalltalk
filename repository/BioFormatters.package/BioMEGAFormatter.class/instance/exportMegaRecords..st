private
exportMegaRecords: aCollection 
	" Iterate over aCollection and write results into the receiver's stream "

	aCollection do: [ : mr | mr exportTo: self stream  ]
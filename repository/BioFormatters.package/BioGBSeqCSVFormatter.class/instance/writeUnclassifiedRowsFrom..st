private
writeUnclassifiedRowsFrom: data
	" Private - Assume data is a <Collection> of <Dictionary>. 
	features contain all possible features in data. if data at specific feature is absent, then use a dash to specify null value "

	data do: [: dict |
		self writeFeatureRow: dict groupedFeature: 'Unrecognized' ] .
	

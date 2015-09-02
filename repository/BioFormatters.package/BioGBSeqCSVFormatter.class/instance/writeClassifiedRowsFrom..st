private
writeClassifiedRowsFrom: data
	" Private - Assume data is a <Dictionary> with each Association a pair <String> -> <OrderedCollection>
	features contain all possible features in data. if data at specific feature is absent, then use a dash to specify null value "

	data associationsDo: [: assoc |
		assoc value do: [ : dict | 
			self dumpFeatureData: dict groupingFeature: assoc key ] ] .
	self informMessage: 'Exported CSV data to ' , self outputFilename

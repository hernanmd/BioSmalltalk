private
writeRowsFrom: data features: features
	" Private - Assume data is a <Collection> of <Dictionary>. 
	features contain all possible features in data. if data at specific feature is absent, then use a dash to specify null value "

	data do: [: dict |
		features do: [: key |
			stream 
				nextPutAll: (dict at: key ifAbsent: [ '-' ]);
				nextPut: self delimiterSourceCharacter ].
			stream cr ].

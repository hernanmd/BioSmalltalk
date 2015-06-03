private
buildSamplesFromGroupedDictionaries: aCollection 

	^ aCollection groupedBy: [ : gbSeqDictionary | 
		gbSeqDictionary at: 'Padded_sequence' ]

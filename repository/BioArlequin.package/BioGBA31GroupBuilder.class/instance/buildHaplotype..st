private
buildHaplotype: groupedDictionaries 

	^ groupedDictionaries collect: [ : gbSeqDictionary | 
		gbSeqDictionary 
			at: 'Padded_sequence' 
			ifAbsent: [ self error: 'Sequences were not padded for Arlequin export' ] ].
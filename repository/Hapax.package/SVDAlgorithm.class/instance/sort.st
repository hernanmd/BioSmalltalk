sorting
sort

	(SequenceableCollectionSorter 
		on: self 
		using: [ :a :b | (a at: 2) >= (b at: 2) ]) 
		sort.
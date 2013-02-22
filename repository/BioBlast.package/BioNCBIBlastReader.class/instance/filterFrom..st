accessing-blast-filters
filterFrom: aMQBBuilder
	
	aMQBBuilder queries do: [: query | 
		self filter 
				perform: query selector 
				node: query receiver 
				withArgument: query arguments ]
		displayingProgress: 'Executing query...' translated
accessing-blast-filters
filterFrom: aMQBBuilder
	
	aMQBBuilder queries collect: [: query | 
		self filter 
				perform: query selector 
				node: query receiver 
				withArgument: query arguments ]
accessing
groupBy: selector

	^ self classifications groupedBy: [: classification | 
		classification contents perform: selector ]
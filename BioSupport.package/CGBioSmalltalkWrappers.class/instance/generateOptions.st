accessing
generateOptions
	" Private - Generate receiver's option methods "

	self parser rowsDo: [: row | 
		self buildSelector: row.		
		self 
			userComment: row second;
			sourceString: String empty;
			generateMethod  ]

